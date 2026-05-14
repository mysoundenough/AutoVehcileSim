"""
CarSim 单场景坑洼仿真 - 正确引用Profile文件
"""
import os
import stat
import re
import shutil
import numpy as np
from pathlib import Path
from datetime import timedelta
import matplotlib.pyplot as plt

from pycarsimlib.core import CarsimManager
from pycarsimlib.logger import initialize_logging

logger = initialize_logging(__name__)

# ========== 配置参数 ==========
CARSIM_DB_DIR = r"D:\Carsim2024.1\CarSim2024.1_Data"
PROFILE_TEMPLATE = r"D:\Carsim2024.1\CarSim2024.1_Data\Roads\Profiles\Profile_0f72cc0f-1404-4dfb-8678-bab5435c2a79.par"
WORK_DIR = r"E:\liling\project\SrsAutoCarSim\Results"

# 坑洼参数
DEPTH_MM = 10000        # 深度(mm)
POSITION_M = 100     # 位置(m)
WIDTH_M = 10.0        # 宽度(m)
DURATION_SEC = 10.0  # 仿真时长(s)
THROTTLE = 30.0      # 油门(%)

def update_profile(sim_content, profile_path):
    pattern = r'SET_MACRO \$\(ROOT_FILE_NAME\)\$\s+(\S+)'
    match = re.search(pattern, sim_content)
    if match:
        run_name = match.group(1)
        run_path = Path(CARSIM_DB_DIR) /"Runs"/f"{run_name}.par"
        with open(run_path, 'r', encoding='utf-8') as f:
            run_content = f.read()
        pattern = r'PARSFILE\s+Procedures\\([^\s]+\.par)'
        match = re.search(pattern, run_content)
        if match:
            proc_name = match.group(1)
            proc_path = Path(CARSIM_DB_DIR) /"Procedures"/f"{proc_name}"
            with open(proc_path, 'r', encoding='utf-8') as f:
                proc_content = f.read()
            pattern = r'PARSFILE\s+Roads\\([^\s]+\.par)'
            match = re.search(pattern, proc_content)
            road_name = match.group(1)
            road_path = Path(CARSIM_DB_DIR) /"Roads"/f"{road_name}"
            with open(road_path, 'r', encoding='utf-8') as f:
                road_content = f.read()
            pattern = r'PARSFILE\s+Roads\\Profiles\\([^\s]+\.par)'
            match = re.search(pattern, road_content)
            pro_name = match.group(1)
            ori_profile_path = Path(CARSIM_DB_DIR) /"Roads"/"Profiles"/f"{pro_name}"
            ori_profile_backup = ori_profile_path.with_suffix('.par.bak')
            if not os.path.exists(ori_profile_backup):
                shutil.copy2(ori_profile_path, ori_profile_backup)
            # 修改Roads中的Profile引用
            # 查找并替换 PARSFILE 行
            """ pattern = r'(PARSFILE\s+Roads\\Profiles\\).+?\.par'
            replacement = rf'\g<1>{profile_path.name}'
            new_content = re.sub(pattern, replacement, road_content) """

    """ if new_content != road_content:
        with open(road_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        logger.info(f"已修改roadfile，使用Profile: {profile_path.name}")
    else:
        logger.warning("未找到PARSFILE行，请手动在CarSim GUI中设置Profile") """
    
    return ori_profile_path, run_name

def create_pothole_profile(input_path, output_path, depth_mm, position_m, width_m):
    """创建带坑洼的Profile文件"""
    
    with open(input_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    pattern = r'Z_PROFILE_TABLE\s+LINEAR_LOOP\n(.*?)\nENDTABLE'
    match = re.search(pattern, content, re.DOTALL)
    
    if not match:
        raise ValueError("未找到路面数据")
    
    table_text = match.group(1)
    S, Z = [], []
    for line in table_text.strip().split('\n'):
        parts = re.split(r'[,\s]+', line.strip())
        parts = [p for p in parts if p]
        if len(parts) >= 2:
            S.append(float(parts[0]))
            Z.append(float(parts[1]))
    
    S = np.array(S)
    Z = np.array(Z)
    
    # 生成坑洼
    half_width = width_m / 2
    dx = np.abs(S - position_m)
    mask = dx < half_width
    pothole = np.zeros_like(Z)
    pothole[mask] = -depth_mm * (1 + np.cos(np.pi * dx[mask] / half_width)) / 2
    
    Z_new = Z + pothole
    
    # 保存
    new_table = '\n'.join([f"    {s:.3f}, {z:.2f}" for s, z in zip(S, Z_new)])
    new_content = re.sub(pattern, f'Z_PROFILE_TABLE LINEAR_LOOP\n{new_table}\nENDTABLE', content, flags=re.DOTALL)
    
    Path(output_path).parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    logger.info(f"坑洼Profile已生成: {output_path}")
    
    return S, Z, Z_new


def modify_simfile_to_use_profile(profile_path):
    """修改simfile，使其使用指定的Profile文件"""
    
    simfile_path = Path(CARSIM_DB_DIR) / "simfile.sim"
    simfile_backup = simfile_path.with_suffix('.sim.bak')
    
    # 备份原文件
    if not simfile_backup.exists():
        shutil.copy(simfile_path, simfile_backup)
        logger.info(f"已备份simfile: {simfile_backup}")
    
    # 读取simfile
    with open(simfile_path, 'r', encoding='utf-8') as f:
        content = f.read()
    ori_profile_path, run_name = update_profile(content, profile_path)
    # 将Profile文件复制到CarSim数据库的Profiles目录
    target_profile = Path(CARSIM_DB_DIR) / "Roads" / "Profiles" / profile_path.name
    
    
    

    
    return ori_profile_path, run_name


def restore_simfile():
    """恢复原始的simfile"""
    simfile_path = Path(CARSIM_DB_DIR) / "simfile.sim"
    simfile_backup = simfile_path.with_suffix('.sim.bak')
    
    if simfile_backup.exists():
        shutil.copy(simfile_backup, simfile_path)
        logger.info("已恢复原始simfile")


def run_simulation(depth_mm, position_m, width_m, duration_sec, throttle):
    """运行CarSim仿真"""
    profile_path = Path(WORK_DIR) / f"pothole_D{depth_mm}mm_P{position_m}m.par"
    # 2. 修改simfile，使用新Profile
    ori_profile_path, run_name = modify_simfile_to_use_profile(profile_path)
    # 1. 创建坑洼Profile
    S, Z_orig, Z_new = create_pothole_profile(ori_profile_path, profile_path, depth_mm, position_m, width_m)
    with open(profile_path, 'r', encoding='utf-8') as f:
        pro_content = f.read()
    os.chmod(ori_profile_path, stat.S_IWRITE)
    with open(ori_profile_path, 'w', encoding='utf-8') as f:
        f.write(pro_content)
    #shutil.copy2(profile_path, ori_profile_path)
    logger.info(f"Profile已复制到: {ori_profile_path}")
    # 3. 初始化CarSim
    cm = CarsimManager(
        carsim_db_dir=CARSIM_DB_DIR,
        vehicle_type="normal_vehicle",
    )
    
    # 4. 仿真参数
    delta_time = timedelta(seconds=0.01)
    total_steps = int(duration_sec / delta_time.total_seconds())
    
    action = {
        "IMP_STEER_SW": 0.0,
        "IMP_FBK_PDL": 0.0,
        "IMP_THROTTLE_ENGINE": throttle
    }
    
    results = {'time': [], 'x': [], 'y': [], 'yaw': []}
    
    logger.info(f"开始仿真: 深度={depth_mm}mm, 位置={position_m}m")
    cm.close()
    cm.run_all()




    """ try:
        for step in range(total_steps):
            observed, terminated, current_time = cm.step(action=action, delta_time=delta_time)
            
            results['time'].append(current_time)
            results['x'].append(observed.get('XCG_TM', 0))
            results['y'].append(observed.get('YCG_TM', 0))
            results['yaw'].append(observed.get('Yaw', 0))
            
            if step % 100 == 0:
                logger.info(f"时间: {current_time:.1f}s, 位置: ({results['x'][-1]:.1f}, {results['y'][-1]:.1f})")
            
            if terminated:
                break
        
        
        logger.info("仿真完成")
        
    finally:
        cm.close()
        # 恢复原始simfile
        restore_simfile() """
    cm.save_results_into_carsimdb('./Results/'+f"{run_name}", Path(CARSIM_DB_DIR)/"Results"/f"{run_name}")
    return results , S, Z_orig, Z_new


if __name__ == "__main__":
    results, S, Z_orig, Z_new = run_simulation(DEPTH_MM, POSITION_M, WIDTH_M, DURATION_SEC, THROTTLE)
    
    print(f"\n仿真完成: 行驶距离={results['x'][-1] - results['x'][0]:.1f}m")
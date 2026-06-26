import pandas as pd
from pathlib import Path
import shutil

"""
CarSim 单场景坑洼仿真 - 正确引用Profile文件
"""
import os,sys
from pathlib import Path
sys.path.insert(0, str(Path.cwd().parent))
import stat
import re
import shutil
import numpy as np

from datetime import timedelta
import matplotlib.pyplot as plt
from pathlib import Path
import shutil
import win32com.client
import pythoncom
import time
from pathlib import Path
import shutil

from car_model import add_car
from pycarsimlib.core import CarsimManager
from pycarsimlib.logger import initialize_logging
from Profile import generate_pothole_profile, update_run_all_with_new_profile
from roadline import RoadSegGenerator
from update_roadline import update_road_in_runall
from DLC_roadline import LineOffsetParams, LineOffsetGenerator
from update_driver import update_driver_in_runall
from friction import CarSimFrictionMapGenerator, FrictionMapParams
from update_friction import RunAllParUpdater
logger = initialize_logging(__name__)

# ========== 配置参数 ==========
CARSIM_DB_DIR = r"C:\workspace\AutoVehcileSim\auto"
WORK_DIR = r".\Results"


VEHICLE_TYPE = "normal_vehicle"
RUN_ALL_DIR = r"C:\workspace\AutoVehcileSim\auto\Results\Run_6f6dddbf-6f3d-45dd-95c6-f5662819b1e8"


def run_simulation(cm):
    """运行CarSim仿真"""

    cm.close()
    cm.run_all()
    cm.close()

    cm.save_results_into_carsimdb('./Results/'+f"{run_name}", Path(CARSIM_DB_DIR)/"Results"/f"{run_name}")

# ===================== 封装成函数：运行一次仿真 =====================
def run_sim():
    # 运行当前仿真（不关闭软件）
    err = False
    cs.Run_CheckError("", "", err)

    if err:
        code = 0
        msg = ""
        cs.GetError(code, msg)
        print(f"❌ 运行失败：{msg}")
        return False
    else:
        print("✅ 运行完成")
    
    # 可选：打开绘图界面查看结果
    # cs.LaunchPlot()

    return True

def set_vehicle_v(par_path, v):
    # change v
    logger.info(par_path)
    if not os.path.exists(par_path):
        logger.error("Proc v not found.")
        raise FileNotFoundError
    # 读取源文件并替换
    with open(par_path, "r", encoding="utf-8") as f:
        content = f.read()
    # 替换 TC_PWR_HYBRID_AV 后面的数字
    new_content = content
    new_content = re.sub(r'\*SPEED\s+[\d.-]+', f'*SPEED {v}', content, flags=re.MULTILINE)
    # 保存新文件
    with open(par_path, "w", encoding="utf-8") as f:
        f.write(new_content)
    f.close()

def modify_power_data(par_path: str, value: float, data: list):
    logger.info("change power file:" + par_path)
    try:
        # 1. 读取文件
        with open(par_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # 2. 匹配阻尼表格区域
        pattern = re.compile(
            r"(PWR_DRV_THROTTLE_TABLE LINEAR\n)(.*?)(ENDTABLE)",
            re.DOTALL
        )

        match = pattern.search(content)
        if not match:
            raise ValueError("未找到 PWR_DRV_THROTTLE_TABLE LINEAR 减震数据")

        # 3. 逐行修改阻尼力
        table_lines = match.group(2).strip().splitlines()
        new_lines = []

        for i, line in enumerate(table_lines):
            line = line.strip()
            if not line or ',' not in line:
                new_lines.append(line)
                continue

            # 拆分速度、力
            vel_str, force_str = line.split(',', 1)
            vel = vel_str.strip()
            force = float(force_str.strip())

            # 按比例缩放
            if value == 1:
                vel = data[i][0]
                new_force = data[i][1]
                if vel.is_integer():
                    vel = int(vel)
            else:
                new_force = force * value

            # 保持格式（整数/小数都兼容）
            if new_force.is_integer():
                new_force = int(new_force)

            new_lines.append(f"{vel}, {new_force}")

        # 4. 替换回文件内容
        new_table = "\n".join(new_lines)
        new_content = pattern.sub(
            match.group(1) + new_table + '\n' + match.group(3),
            content
        )

        # 5. 保存文件
        with open(par_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        f.close()

        logger.info(f"减震器阻尼修改成功: {par_path}, 缩放比例 = {value}")

    except Exception as e:
        logger.error(f"修改减震器失败: {str(e)}")
        raise FileNotFoundError("Simfile not found.")

def copy_result(name):
    # 另存csv 按照参数变化改名
    # 源文件路径
    src_csv = Path(r"C:\workspace\AutoVehcileSim\auto\Results\Run_6f6dddbf-6f3d-45dd-95c6-f5662819b1e8\LastRun.csv")
    # 目标文件夹&文件名res.csv
    dst_folder = Path(r"./result_sin_xishu9")
    dst_csv = dst_folder / name

    # 创建result文件夹(不存在自动新建)
    dst_folder.mkdir(exist_ok=True)

    # 复制文件
    shutil.copy2(src_csv, dst_csv)
    print(f"文件已复制至：{dst_csv.resolve()}")

if __name__ == "__main__":



    cm = CarsimManager(
        carsim_db_dir=CARSIM_DB_DIR,
        vehicle_type=VEHICLE_TYPE,
        run_all_dir=RUN_ALL_DIR,
    )

    # cm.close()

    # 循环修改参数
    f_shock_force_data_all = [[[-1030,-7100],[-520,-5652],[-390,-5283],[-260,-4822],[-130,-3488],[-50,-836],[0,0],[50,405],[130,977],[260,1697],[390,2157],[520,2584],[1030,3723]],
                            [[-1030,-7031],[-520,-5502],[-390,-5094],[-260,-4604],[-130,-3251],[-50,-831],[0,0],[50,374],[130,950],[260,1547],[390,1998],[520,2405],[1030,3668]],
                            [[-1030,-6876],[-520,-5399],[-390,-4972],[-260,-4466],[-130,-2946],[-50,-803],[0,0],[50,370],[130,911],[260,1430],[390,1873],[520,2295],[1030,3580]],
                            [[-1030,-6493],[-520,-5307],[-390,-4908],[-260,-4351],[-130,-2578],[-50,-768],[0,0],[50,368],[130,879],[260,1333],[390,1756],[520,2188],[1030,3449]],
                            [[-1030,-6050],[-520,-5193],[-390,-4812],[-260,-4198],[-130,-2345],[-50,-733],[0,0],[50,367],[130,852],[260,1248],[390,1644],[520,2059],[1030,3250]],
                            [[-1030,-5678],[-520,-4927],[-390,-4561],[-260,-4058],[-130,-2101],[-50,-732],[0,0],[50,366],[130,719],[260,1040],[390,1425],[520,1790],[1030,2714]],
                            [[-1030,-5307],[-520,-4424],[-390,-4120],[-260,-3735],[-130,-1899],[-50,-721],[0,0],[50,364],[130,671],[260,971],[390,1331],[520,1571],[1030,2472]],
                            [[-1030,-4973],[-520,-3849],[-390,-3395],[-260,-2896],[-130,-1614],[-50,-705],[0,0],[50,363],[130,796],[260,1159],[390,1533],[520,1964],[1030,3046]],
                            [[-1030,-4575],[-520,-3240],[-390,-2867],[-260,-2314],[-130,-1449],[-50,-661],[0,0],[50,354],[130,568],[260,868],[390,1169],[520,1367],[1030,2232]],
                            [[-1030,-4105],[-520,-2445],[-390,-2088],[-260,-1660],[-130,-1169],[-50,-458],[0,0],[50,337],[130,975],[260,1764],[390,2228],[520,2699],[1030,3742]],
                            [[-1030,-3708],[-520,-2067],[-390,-1700],[-260,-1335],[-130,-940],[-50,-349],[0,0],[50,320],[130,513],[260,809],[390,1038],[520,1233],[1030,2085]],
                            [[-1030,-3192],[-520,-1590],[-390,-1265],[-260,-959],[-130,-636],[-50,-233],[0,0],[50,312],[130,467],[260,700],[390,884],[520,1069],[1030,1893]],
                            [[-1030,-2890],[-520,-1411],[-390,-1107],[-260,-833],[-130,-553],[-50,-222],[0,0],[50,311],[130,463],[260,687],[390,867],[520,1044],[1030,1862]],
                            [[-1030,-2671],[-520,-1290],[-390,-1013],[-260,-759],[-130,-513],[-50,-215],[0,0],[50,302],[130,464],[260,721],[390,917],[520,1109],[1030,1955]]]
    
    r_shock_force_data_all = [[[-1030,-6255],[-520,-5184],[-390,-4850],[-260,-4416],[-130,-3354],[-50,-1629],[0,0],[50,470],[130,1235],[260,1702],[390,1897],[520,2046],[1030,2605]],
                            [[-1030,-6081],[-520,-5053],[-390,-4729],[-260,-4275],[-130,-2983],[-50,-1407],[0,0],[50,467],[130,1187],[260,1688],[390,1863],[520,2014],[1030,2589]],
                            [[-1030,-5830],[-520,-4923],[-390,-4577],[-260,-4087],[-130,-2621],[-50,-1358],[0,0],[50,444],[130,1105],[260,1583],[390,1809],[520,1976],[1030,2560]],
                            [[-1030,-5494],[-520,-4849],[-390,-4505],[-260,-3991],[-130,-2510],[-50,-1339],[0,0],[50,434],[130,1002],[260,1575],[390,1796],[520,1958],[1030,2540]],
                            [[-1030,-5205],[-520,-4565],[-390,-4357],[-260,-3819],[-130,-2264],[-50,-1204],[0,0],[50,428],[130,950], [260,1447],[390,1749],[520,1927],[1030,2529]],
                            [[-1030,-4873],[-520,-4233],[-390,-4036],[-260,-3611],[-130,-2028],[-50,-999], [0,0],[50,398],[130,939], [260,1319],[390,1711],[520,1898],[1030,2512]],
                            [[-1030,-4495],[-520,-3828],[-390,-3615],[-260,-3297],[-130,-1760],[-50,-953], [0,0],[50,385],[130,840], [260,1208],[390,1650],[520,1876],[1030,2505]],
                            [[-1030,-4092],[-520,-3370],[-390,-3113],[-260,-2606],[-130,-1448],[-50,-748], [0,0],[50,382],[130,702], [260,1077],[390,1464],[520,1827],[1030,2482]],
                            [[-1030,-3753],[-520,-2916],[-390,-2563],[-260,-2151],[-130,-1262],[-50,-634], [0,0],[50,379],[130,673], [260,997], [390,1384],[520,1676],[1030,2427]],
                            [[-1030,-3254],[-520,-2166],[-390,-1828],[-260,-1502],[-130,-975], [-50,-394], [0,0],[50,312],[130,549], [260,884], [390,1202],[520,1430],[1030,2301]],
                            [[-1030,-2887],[-520,-1698],[-390,-1432],[-260,-1145],[-130,-736], [-50,-283], [0,0],[50,299],[130,487], [260,783], [390,1051],[520,1262],[1030,2160]],
                            [[-1030,-2237],[-520,-1157],[-390,-938], [-260,-714], [-130,-452], [-50,-170], [0,0],[50,292],[130,450], [260,673], [390,871], [520,1074],[1030,1928]],
                            [[-1030,-1943],[-520,-1002],[-390,-811], [-260,-630], [-130,-436], [-50,-169], [0,0],[50,287],[130,450], [260,670], [390,854], [520,1037],[1030,1867]],
                            [[-1030,-1814],[-520,-929], [-390,-749], [-260,-581], [-130,-411], [-50,-166], [0,0],[50,274],[130,438], [260,665], [390,835], [520,1013],[1030,1813]]]
    
    pedmaps = [[[0, 0], [0.05, 5], [0.1, 50], [0.15, 70], [0.2, 80], [0.25, 90], [0.3, 110], [0.4, 130], [0.5, 150], [0.6, 180], [0.7, 210], [0.8, 240], [0.9, 270], [1.0, 300]],
               [[0, 0], [0.05, 15], [0.1, 50], [0.15, 70], [0.2, 80], [0.25, 90], [0.3, 110], [0.4, 130], [0.5, 150], [0.6, 180], [0.7, 210], [0.8, 240], [0.9, 270], [1.0, 300]],
               [[0, 0], [0.05, 30], [0.1, 50], [0.15, 70], [0.2, 80], [0.25, 90], [0.3, 110], [0.4, 130], [0.5, 150], [0.6, 180], [0.7, 210], [0.8, 240], [0.9, 270], [1.0, 300]]]
    
    # ===================== 初始化 =====================
    pythoncom.CoInitialize()
    # 【只打开一次】
    cs = win32com.client.Dispatch("CarSim.Application")
    time.sleep(2)  # 等待CarSim完全启动
    print("✅ CarSim 已启动，全程不关闭，可反复运行")

    # ===================== 1. 读取CSV参数 =====================
    SRC_ROOT = Path(__file__).parent
    CSV_PATH = SRC_ROOT / "stli" / "saltellisamples.csv"
    df = pd.read_csv(CSV_PATH, header=None, encoding="utf-8-sig")

    # 校验列数
    if df.shape[1] != 6:
        raise ValueError(f"CSV列数错误！要求6列，实际{df.shape[1]}列")
    if df.isna().any().any():
        raise ValueError("CSV中包含非数字内容，转换失败，请检查数据")
    all_param_rows = df.values.tolist()[412:]
    print(f"✅ 共读取到 {len(all_param_rows)} 组仿真参数，开始遍历运行...")

    # ===================== 2. 遍历每一组参数跑仿真 =====================
    for param_idx, param_row_str in enumerate(all_param_rows, 1):
        # 拆解当前行的6个数字（可根据你的参数含义重命名变量）
        param_row_num = []
        for s in param_row_str:
            s_clean = s.strip()  # 清理前后空格
            if '.' in s_clean:
                # 带小数点 → 转float浮点数
                num = float(s_clean)
            else:
                # 无小数点 → 转int整数
                num = int(s_clean)
            param_row_num.append(num)
        param1, param2, param3, param4, param5, param6 = param_row_num
        print(f"\n===== 第{param_idx}/{len(all_param_rows)}组仿真 =====")
        print(f"当前参数：{param_row_num}")

        v=80
        print(f"\n=== 仿真速度: {v} km/h ===")
        vpath = r"C:\workspace\AutoVehcileSim\auto\Procedures\Proc_07d9a19f-3ef9-44ff-9e52-f41142cc19c3.par"
        set_vehicle_v(par_path=vpath, v=v)

        fk = param1
        # 1. 修改 前悬架空气弹簧刚度
        # 前悬
        F_CmpInd_path = r"C:\workspace\AutoVehcileSim\auto\Suspensions\Compliance\CmpInd_83b37c60-f193-47f3-8b2e-03d0e2ecf1f5.par" 
        cm.set_vehicle_param(par_path=F_CmpInd_path, front_spring_rate=fk)  # N/m

        rk = param2
        # 后悬
        R_CmpInd_path = r"C:\workspace\AutoVehcileSim\auto\Suspensions\Compliance_SA\CmpSA_9166f5c2-2174-435d-8570-aa6e19302ef9.par"
        cm.set_vehicle_param(par_path=R_CmpInd_path, front_spring_rate=rk)  # N/m

        i = param3
        # 3. 修改 阻尼
        # 前悬
        F_Shock_path = r"C:\workspace\AutoVehcileSim\auto\Suspensions\Shocks\Shock_0751644e-013f-45f4-8119-29f0d1bd5cc4.par"
        shock_force_data = f_shock_force_data_all[i]
        cm.set_vehicle_param(par_path=F_Shock_path, shock_force_rate=1, shock_force_data=shock_force_data)  # *k 变化倍数

        j = param4
        # 后悬
        R_Shock_path = r"C:\workspace\AutoVehcileSim\auto\Suspensions\Shocks\Shock_df9857ff-75d8-44ea-8bc2-62a47417d5d6.par"
        shock_force_data = r_shock_force_data_all[j]
        cm.set_vehicle_param(par_path=R_Shock_path, shock_force_rate=1, shock_force_data=shock_force_data)  # *k 变化倍数

        dt = param5
        # 4. 修改 动力响应
        par_path = r"C:\workspace\AutoVehcileSim\auto\Powertrain\HEV_PMC\PMC_a65582f0-a085-4bc8-9606-1a4f75f80775.par"
        cm.set_vehicle_param(par_path=par_path, power_delay_rate=dt)  # s

        id_pf = param6
        # 5. 修改 dirive demand power
        pedmap = pedmaps[id_pf]
        par_path = r"C:\workspace\AutoVehcileSim\auto\Generic\tables\GenTab_90d23e81-2c53-435f-8e2c-d6503354f720.par"
        modify_power_data(par_path=par_path, value=1, data=pedmap)  # *k 可变为 变化倍数 

        # 运行仿真
        run_sim()

        # 另存csv 按照参数变化改名
        name = f"sin_v_{v}_car_fk_{fk}_rk_{rk}_fc_{i}_rc_{j}_delay_{dt}_T_{id_pf}.csv"
        copy_result(name)

    
    print(f"\n仿真完成")
    
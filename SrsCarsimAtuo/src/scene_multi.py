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

def get_parfile_name(sim_content):
    pattern = r'SET_MACRO \$\(ROOT_FILE_NAME\)\$\s+(\S+)'
    match = re.search(pattern, sim_content)
    StrDM_path = RoadSeg_path = Friction_path = profile_path = None
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
            pattern = r'PARSFILE\s+Control\\Driver\\([^\s]+\.par)'
            match = re.search(pattern, proc_content)
            StrDM_name = match.group(1)
            if StrDM_name is not None:
                StrDM_path = Path(CARSIM_DB_DIR) /"Control"/"Driver"/f"{StrDM_name}"

            pattern = r'PARSFILE\s+Roads\\([^\s]+\.par)'
            match = re.search(pattern, proc_content)
            
            if match:
                road_name = match.group(1)
            else:
                pattern = r'PARSFILE\s+Roads\\([^\s]+\.par)'
                match = re.search(pattern, run_content)
                road_name = match.group(1)
            road_path = Path(CARSIM_DB_DIR) /"Roads"/f"{road_name}"
            with open(road_path, 'r', encoding='utf-8') as f:
                road_content = f.read()
            #取道路模块配置文件
            pattern = r'PARSFILE\s+Roads\\BuilderSegment\\([^\s]+\.par)'
            match = re.search(pattern, road_content)
            RoadSeg_name = None
            if match:
                RoadSeg_name = match.group(1)
                RoadSeg_path = Path(CARSIM_DB_DIR) /"Roads"/"BuilderSegment"/f"{RoadSeg_name}"
            #取附着系数配置文件
            pattern = r'PARSFILE\s+Roads\\Friction\\([^\s]+\.par)'
            match = re.search(pattern, road_content)
            Friction_name = None
            if match:
                Friction_name = match.group(1)
                Friction_path = Path(CARSIM_DB_DIR) /"Roads"/"Friction"/f"{Friction_name}"
            #取粗糙度配置文件
            pattern = r'PARSFILE\s+Roads\\Profiles\\([^\s]+\.par)'
            match = re.search(pattern, road_content)
            profile_name = None
            if match:
                profile_name = match.group(1)
                profile_path = Path(CARSIM_DB_DIR) /"Roads"/"Profiles"/f"{profile_name}"
        
        # 车辆参数自动寻路径
        F_CmpInd_path = None
        R_CmpInd_path = None
        Shock_path = None
        # pattern = r'PARSFILE\s+Vehicles\\Assembly\\([^\s]+\.par)'
        # match = re.search(pattern, run_content)
        # if match:
        #     vehicle_name = match.group(1)
        #     vehicle_path = Path(CARSIM_DB_DIR) /"Vehicles"/"Assembly"/f"{vehicle_name}"
        #     with open(vehicle_path, 'r', encoding='utf-8') as f:
        #         vehicle_content = f.read()
        #     pattern = r'PARSFILE\s+Suspensions\\Compliance\\([^\s]+\.par)'
        #     matchs = re.findall(pattern, vehicle_content)
        #     print("matchs", matchs)
        #     # 前悬
        #     cmpind_name = None
        #     cmpind_name = matchs[0]
        #     if cmpind_name:
        #         F_CmpInd_path = Path(CARSIM_DB_DIR) /"Suspensions"/"Compliance"/f"{cmpind_name}"
        #     with open(F_CmpInd_path, 'r', encoding='utf-8') as f:
        #         cmpind_content = f.read()
        #     pattern = r'PARSFILE\s+Suspensions\\Shocks\\([^\s]+\.par)'
        #     match = re.search(pattern, cmpind_content)
        #     shock_name = None
        #     if match:
        #         shock_name = match.group(1)
        #         Shock_path = Path(CARSIM_DB_DIR) /"Suspensions"/"Shocks"/f"{shock_name}"
        #     # 后悬
        #     cmpind_name = None
        #     cmpind_name = matchs[1]
        #     if cmpind_name:
        #         R_CmpInd_path = Path(CARSIM_DB_DIR) /"Suspensions"/"Compliance"/f"{cmpind_name}"
        #     with open(R_CmpInd_path, 'r', encoding='utf-8') as f:
        #         cmpind_content = f.read()
        #     pattern = r'PARSFILE\s+Suspensions\\Shocks\\([^\s]+\.par)'
        #     match = re.search(pattern, cmpind_content)
        #     shock_name = None
        #     if match:
        #         shock_name = match.group(1)
        #         Shock_path = Path(CARSIM_DB_DIR) /"Suspensions"/"Shocks"/f"{shock_name}"

    return run_name, F_CmpInd_path, R_CmpInd_path, Shock_path, StrDM_path, RoadSeg_path, Friction_path, profile_path


VEHICLE_TYPE = "normal_vehicle"
RUN_ALL_DIR = r"C:\workspace\AutoVehcileSim\auto\Results\Run_6f6dddbf-6f3d-45dd-95c6-f5662819b1e8"


def run_simulation(cm):
    """运行CarSim仿真"""

    cm.close()
    cm.run_all()
    cm.close()

    cm.save_results_into_carsimdb('./Results/'+f"{run_name}", Path(CARSIM_DB_DIR)/"Results"/f"{run_name}")


if __name__ == "__main__":
    update_roughness = False
    update_roadline = True
    update_Friction = False
    scenario_name = "MyDoubleLaneChange"
    simfile_path = Path(CARSIM_DB_DIR) / "simfile.sim"
    
    # 读取simfile
    with open(simfile_path, 'r', encoding='utf-8') as f:
        content = f.read()
    run_name, F_CmpInd_path, R_CmpInd_path,  Shock_path, StrDM_path, RoadSeg_path, Friction_path, profile_path = get_parfile_name(content)
    os.makedirs('./Results', exist_ok=True)
    output_dir = WORK_DIR + '\\' + run_name
    os.makedirs(output_dir, exist_ok=True)
    db_run_all_path = CARSIM_DB_DIR + "\\Results\\" + run_name + "\\Run_all.par"
    run_all_path = output_dir + "\\Run_all.par"
    shutil.copy(db_run_all_path, run_all_path)
    bak_run_all_path = run_all_path.replace('.par', '.par.bak')
    shutil.copy(run_all_path, bak_run_all_path)
    if update_roughness and profile_path:
        # 生成带坑洼的Profile文件
        new_profile = generate_pothole_profile(
            original_profile_path=profile_path,
            output_dir=output_dir,
            depth_mm=5000,      # 5m深的坑
            position_m=100,   # 100米处
            width_m=5.0       # 5米宽
        )
        
        update_run_all_with_new_profile(
            run_all_path=run_all_path,
            new_profile_path=new_profile
        )
    if update_roadline:
        # 自定义参数
        params = LineOffsetParams(
            road_length=600.0,
            straight_segments=[
                (0, 50),      # 起步段50m
                (150, 450)    # 结束段450m
            ],
            lane_change_points=[
                (50, 0.0),
                (55, 0.2),
                (60, 1.1),
                (65, 2.4),
                (70, 3.3),
                (75, 3.5),
                (80, 3.5),
                (85, 3.5),
                (90, 3.5),
                (95, 3.5),
                (100, 3.3),
                (105, 2.4),
                (110, 1.1),
                (115, 0.2),
                (120, 0.0),
            ],
            preview_time=0.5,
            max_steer_rate=1000.0,
            max_steer_angle=500.0
        )

        if params.lane_change_points is not None:
            # 自定义参数
            generator = LineOffsetGenerator(output_dir, scenario_name, RoadSeg_path.name, StrDM_path.name)
            strdm_file = generator.generate_strdm_par(params)
            
            result = update_driver_in_runall(
                run_all_path=run_all_path,
                new_driver_file_path=strdm_file,
                # output_path=Path(output_dir) /"updated"/ "Run_all.par"
                output_path=Path(output_dir) / "Run_all.par"
            )

        generator = RoadSegGenerator(output_dir)
        """ print("\n1. 生成直线道路...")
        length = 150.0
        circle_name = "Straight East " + str(int(length))
        RoadSeg_file = generator.generate_straight_road(
            name="MyStraightRoad",
            length=length
            ) """
            
        # 4. 生成S型弯道（类似文件4）
        print("\n4. 生成S型弯道...")
        temp_name="MySTurnRoad"
        RoadSeg_file = generator.generate_s_turn_road(
            name=temp_name
            )
        update_road_in_runall(
            name=temp_name,
            run_all_path=run_all_path,
            new_road_file_path=RoadSeg_file,
            # output_path=Path(output_dir) /"updated"/ "Run_all.par"
            output_path=Path(output_dir) / "Run_all.par"
            )

    if update_Friction:
        # 示例1: 使用默认参数生成
        generator = CarSimFrictionMapGenerator(output_dir, scenario_name, Friction_path.name)
        
        # 默认参数: 在station范围-100到400，侧向-9到9之间设置mu=0.5
        params = FrictionMapParams(
            default_mu=0.85,
            friction_zones=[
                (-100, 400, -9, 9, 0.5)  # 低附着区域
            ]
        )
        
        file_path = generator.generate_friction_map_par(params)
        print(f"\n生成的配置文件: {file_path}")
        updater = RunAllParUpdater(run_all_path, run_all_path)
    
        # 如果新文件存在，可以直接使用
        updated_file = updater.update_with_file(file_path)
    DURATION_SEC = 10.0  # 仿真时长(s)
    THROTTLE = 30.0      # 油门(%)


    cm = CarsimManager(
        carsim_db_dir=CARSIM_DB_DIR,
        vehicle_type=VEHICLE_TYPE,
        run_all_dir=RUN_ALL_DIR,
    )

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
    r_shock_force_data_all = [[[-1030,-7100],[-520,-5652],[-390,-5283],[-260,-4822],[-130,-3488],[-50,-836],[0,0],[50,405],[130,977],[260,1697],[390,2157],[520,2584],[1030,3723]],
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
    
    # 1. 修改 前悬架空气弹簧刚度
    # 前悬
    F_CmpInd_path = r"C:\workspace\AutoVehcileSim\auto\Suspensions\Compliance\CmpInd_83b37c60-f193-47f3-8b2e-03d0e2ecf1f5.par" 
    print("F_CmpInd_path", F_CmpInd_path)
    cm.set_vehicle_param(par_path=F_CmpInd_path, front_spring_rate=132)  # N/m
    # 后悬
    R_CmpInd_path = r"C:\workspace\AutoVehcileSim\auto\Suspensions\Compliance_SA\CmpSA_9166f5c2-2174-435d-8570-aa6e19302ef9.par"
    print("R_CmpInd_path", R_CmpInd_path)
    cm.set_vehicle_param(par_path=R_CmpInd_path, front_spring_rate=42)  # N/m

    # 2. 修改 转向
    
    # 3. 修改 阻尼
    # 前悬
    F_Shock_path = r"C:\workspace\AutoVehcileSim\auto\Suspensions\Shocks\Shock_0751644e-013f-45f4-8119-29f0d1bd5cc4.par"
    print("Shock_path", Shock_path)
    shock_force_data = f_shock_force_data_all[1]
    cm.set_vehicle_param(par_path=F_Shock_path, shock_force_rate=1, shock_force_data=shock_force_data)  # *k 变化倍数
    # 后悬
    R_Shock_path = r"C:\workspace\AutoVehcileSim\auto\Suspensions\Shocks\Shock_df9857ff-75d8-44ea-8bc2-62a47417d5d6.par"
    print("Shock_path", Shock_path)
    shock_force_data = r_shock_force_data_all[2]
    cm.set_vehicle_param(par_path=R_Shock_path, shock_force_rate=1, shock_force_data=shock_force_data)  # *k 变化倍数
    
    # 4. 修改 动力响应
    par_path = r"C:\workspace\AutoVehcileSim\auto\Powertrain\HEV_PMC\PMC_a65582f0-a085-4bc8-9606-1a4f75f80775.par"
    cm.set_vehicle_param(par_path=par_path, power_delay_rate=1.5)  # s
    # 5. 修改 dirive demand power
    par_path = r"C:\workspace\AutoVehcileSim\auto\Generic\tables\GenTab_90d23e81-2c53-435f-8e2c-d6503354f720.par"
    cm.set_vehicle_param(par_path=par_path, power_tao_rate=1)  # *k 变化倍数

    # run_simulation(cm)
    
    print(f"\n仿真完成")
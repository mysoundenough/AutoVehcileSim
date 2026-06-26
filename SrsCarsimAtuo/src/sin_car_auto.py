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

car_model_path = Path(__file__).parent.parent / "car_model"
sys.path.append(str(car_model_path))
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

def copy_result(name):
    # 另存csv 按照参数变化改名
    # 源文件路径
    src_csv = Path(r"C:\workspace\AutoVehcileSim\auto\Results\Run_6f6dddbf-6f3d-45dd-95c6-f5662819b1e8\LastRun.csv")
    # 目标文件夹&文件名res.csv
    dst_folder = Path(r"./result_sin_c_hotmap")
    dst_csv = dst_folder / name

    # 创建result文件夹(不存在自动新建)
    dst_folder.mkdir(exist_ok=True)

    # 复制文件
    shutil.copy2(src_csv, dst_csv)
    print(f"文件已复制至：{dst_csv.resolve()}")

def get_csv_input(start=1):
    # ===================== 1. 读取CSV参数 =====================
    SRC_ROOT = Path(__file__).parent
    CSV_PATH = SRC_ROOT / "stli" / "saltellisamples.csv"
    df = pd.read_csv(CSV_PATH, header=None, encoding="utf-8-sig")

    # 校验列数
    if df.shape[1] != 6:
        raise ValueError(f"CSV列数错误！要求6列，实际{df.shape[1]}列")
    if df.isna().any().any():
        raise ValueError("CSV中包含非数字内容，转换失败，请检查数据")
    all_param_rows = df.values.tolist()[start:]
    print(f"✅ 共读取到 {len(all_param_rows)} 组仿真参数，开始遍历运行...")
    return all_param_rows

if __name__ == "__main__":

    # ===================== 初始化 =====================
    pythoncom.CoInitialize()
    # 【只打开一次】
    cs = win32com.client.Dispatch("CarSim.Application")
    time.sleep(2)  # 等待CarSim完全启动
    print("✅ CarSim 已启动，全程不关闭，重复运行至采样结束")

    
    # ===================== 工况切换模块 =====================
    

    # all_param_rows = get_csv_input()
    # # ===================== 2. 遍历每一组参数跑仿真 =====================
    # for param_idx, param_row_str in enumerate(all_param_rows, 1):
    #     # 拆解当前行的6个数字（可根据你的参数含义重命名变量）
    #     param_row_num = []
    #     for s in param_row_str:
    #         s_clean = s.strip()  # 清理前后空格
    #         if '.' in s_clean:
    #             # 带小数点 → 转float浮点数
    #             num = float(s_clean)
    #         else:
    #             # 无小数点 → 转int整数
    #             num = int(s_clean)
    #         param_row_num.append(num)
    #     param1, param2, param3, param4, param5, param6 = param_row_num
    #     print(f"\n===== 第{param_idx}/{len(all_param_rows)}组仿真 =====")
    #     print(f"当前参数：{param_row_num}")

    for fk in [34,80]:  # 前轮弹簧刚度
        for rk in [75, 155]: # 后轮弹簧刚度
            for fc in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]:  # 前轮阻尼系数
                for rc in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]:  # 后轮阻尼系数
                    for dt in [0.05]:  # 动力响应延迟
                        for id_pf in [1]:  # 电机动力响应延迟
                            print(f"\n===== 仿真参数：fk={fk}, rk={rk}, fc={fc}, rc={rc}, dt={dt}, id_pf={id_pf} =====")

                            add_car('E68', fk=fk, rk=rk, fc=fc, rc=rc, dt=dt, T= id_pf)
                            # add_car('E68', param1, param2, param3, param4, dt, id_pf)

                            # 运行仿真
                            run_sim()

                            # 另存csv 按照参数变化改名
                            name = f"sin_car_fk_{fk}_rk_{rk}_fc_{i}_rc_{j}_delay_{dt}_T_{id_pf}.csv"
                            copy_result(name)

    
    print(f"\n仿真完成")
    
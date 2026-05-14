import os
import subprocess
from pathlib import Path
from config import CARSIM_PROGRAM_PATH, CARSIM_SOLVER_PATH, CARSIM_DATA_DIR, CARSIM_DLL_PATH, CARSIM_RESULTS_DIR
from utils.extractor import VSBExtractor
sim_file = os.path.join(CARSIM_DATA_DIR, "simfile.sim")
# CarSim 求解器路径
solver_path = r"D:\Carsim2024.1\CarSim2024.1_Prog\Programs\ERDConverter.exe"
# 2. 仿真生成的 .vsb 或 .vs 文件路径
VSB_RESULT_PATH = r"C:\Users\Public\Documents\CarSim2020.0_Data\Results\Carsim_Agent_Run_20260306_110046\LastRun.vsb"
# 3. 输出 CSV 的临时路径
TEMP_CSV_PATH = r"./temp_full_results.csv"
results_path = os.path.join('results', 'Run_b148986b-2093-4f69-8107-e989a9c14c72')
command = [CARSIM_SOLVER_PATH, 
            "-sim", sim_file,
            "-progdir", CARSIM_PROGRAM_PATH,
            "-datadir", CARSIM_DATA_DIR]
# 运行 CarSim 仿真
""" result = subprocess.run(
    [solver_path, sim_file],  # 命令行参数
    capture_output=True,       # 捕获输出
    text=True,                 # 以文本形式返回
    timeout=300                # 超时限制（秒）
) """
default_extract_vars = ["Time", "Vx", "Steer_SW", "Fx_L2", "Fy_L2", "Fx_R2", "Fy_R2", "Alpha_R2", "Kappa_R2"]
extractor = VSBExtractor()
env = os.environ.copy()
env["PATH"] = CARSIM_PROGRAM_PATH + os.pathsep + env.get("PATH", "")
result = subprocess.run(command, cwd=CARSIM_DATA_DIR, env=env,
                                    stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
# 检查执行结果
if result.returncode == 0:
    print("仿真成功")
    print(result.stdout)  # 标准输出
    
    file_to_extract = None
    extraction_method = 'vsb'
    if extraction_method == "csv":
        # 方式一：读取 LastRun.csv
        file_to_extract = os.path.join(results_path, "LastRun.csv")
        if not os.path.exists(file_to_extract):
            x=1
    """ elif extraction_method == "vsb":
        # 方式二：转换 vsb/vs
        file_to_extract = runner.erd_file.replace(".vs", ".vsb")
        if not os.path.exists(file_to_extract):
            x=2 """

    csv_path = extractor.extract_to_csv(
        file_to_extract, 
        target_vars=default_extract_vars, 
        method=extraction_method
    )
    import pandas as pd
    df = pd.read_csv(csv_path)
    x = 3
else:
    print("仿真失败")
    print(result.stderr) 
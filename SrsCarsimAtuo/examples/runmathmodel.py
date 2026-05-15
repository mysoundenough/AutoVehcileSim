import ctypes
import os

# ===================== 你只需要填这 1 个路径 =====================
SIM_FILE = r"C:\Srs\SrsAutoCarSim\auto\simfile.sim"  # 你自己的sim文件
# =================================================================

# 1. 加载 DLL
DLL_PATH = r"C:\Carsim2024.1\Carsim2024.1_Prog\Programs\Solvers\carsim_64.dll"
carsim_dll = ctypes.CDLL(DLL_PATH)

# 2. 定义 vs_run 函数原型
carsim_dll.vs_run.argtypes = [ctypes.c_char_p]
carsim_dll.vs_run.restype = ctypes.c_int

# 3. 直接调用！！！（这就是 Run Math Model）
def run_math_model(sim_path):
    print("正在运行 CarSim 仿真...")
    result = carsim_dll.vs_run(sim_path.encode("utf-8"))  # 只调用这一句
    if result == 0:
        print("✅ 仿真成功完成！")
    else:
        print("❌ 仿真失败！")



# 执行
if __name__ == "__main__":
    run_math_model(SIM_FILE)
import ctypes

# ===================== 路径 =====================
SIM_FILE = b"C:\\Srs\\SrsAutoCarSim\\auto\\simfile.sim"
DLL_PATH = r"C:\Carsim2024.1\Carsim2024.1_Prog\Programs\Solvers\carsim_64.dll"

# 加载 DLL
dll = ctypes.CDLL(DLL_PATH)

# --------------------------
# 关键：必须先定义两个函数
# --------------------------
dll.vs_prepare_run.argtypes = [ctypes.c_char_p]   # 👈 生成文件/文件夹/RunID
dll.vs_prepare_run.restype = ctypes.c_int

dll.vs_run.argtypes = [ctypes.c_char_p]           # 👈 运行仿真
dll.vs_run.restype = ctypes.c_int

# ===================== 真正的 Run Math Model =====================
print("正在准备运行环境...")
dll.vs_prepare_run(SIM_FILE)   # 👈 这一步 = 界面自动生成所有文件

print("开始运行仿真...")
result = dll.vs_run(SIM_FILE)  # 👈 这一步 = 执行计算

if result == 0:
    print("✅ 完全等效 CarSim 点击 Run Math Model！")
else:
    print("❌ 运行失败")
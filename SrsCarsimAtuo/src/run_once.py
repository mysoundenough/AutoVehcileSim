import win32com.client
import time

# 1. 绑定CarSim COM服务
cs = win32com.client.Dispatch("CarSim.Application")

# 2. Run_CheckError：运行当前打开的Run，返回仿真是否报错
# 空参数=运行当前页面的仿真工程
run_err = False
cs.Run_CheckError("", "", run_err)

if run_err:
    err_code, err_msg = 0, ""
    cs.GetError(err_code, err_msg)
    print(f"仿真报错：{err_code} | {err_msg}")
else:
    print("仿真正常跑完")

# 可选：打开绘图界面查看结果
# cs.LaunchPlot()

# 可选：关闭CarSim（注释则保持软件打开）
# del cs
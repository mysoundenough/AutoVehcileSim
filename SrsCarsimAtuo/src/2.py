import win32com.client
import pythoncom
import time
from pathlib import Path
import shutil

# ===================== 初始化 =====================
pythoncom.CoInitialize()

# 【只打开一次】
cs = win32com.client.Dispatch("CarSim.Application")
time.sleep(1)
print("✅ CarSim 已启动，全程不关闭，可反复运行")

# ===================== 封装成函数：运行一次仿真 =====================
def run_sim_and_save():
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

    # 自动复制结果到 result/res.csv
    try:
        db_path = cs.GetDatabaseFolder()
        run_id = cs.GetCurrentDataSetID()

        src = Path(db_path) / "Results" / run_id / "LastRun.csv"
        dst_dir = Path("./result")
        dst_dir.mkdir(exist_ok=True)
        shutil.copy2(src, dst_dir / "res.csv")
        print("📁 已保存到 result/res.csv")
    except:
        print("⚠️ 文件复制失败")
    
    # 可选：打开绘图界面查看结果
    # cs.LaunchPlot()

    return True

# ===================== 使用方法：反复调用 =====================
# 第一次运行
run_sim_and_save()

time.sleep(5)

# 这里你可以写代码修改参数
# 修改 xxx.par 文件
# 然后再运行
run_sim_and_save()

time.sleep(5)

# 还能继续跑无数次，CarSim 永远不关闭！
run_sim_and_save()
""" sample script to call carsim solver from python """
import gc
gc.collect()
import os
os.chdir(r"C:\Srs\SrsAutoCarSim\auto")  #
import sys
from pathlib import Path
# 把项目根目录加入 Python 路径
sys.path.append(str(Path(__file__).parent.parent))
from datetime import timedelta
from pycarsimlib.core import CarsimManager
from pycarsimlib.logger import initialize_logging
from rich.progress import track
logger = initialize_logging(__name__)

# constant params
CARSIM_DB_DIR = r"C:\Srs\SrsAutoCarSim\auto"
VEHICLE_TYPE = "normal_vehicle"
RUN_ALL_DIR = r"C:\Srs\SrsAutoCarSim\auto\Results\Run_2856146d-b1be-47b8-ac08-6ebab3ca95c3"

def main() -> None:
    """ run carsim model with static control inputs """
    logger.info("Starting sample run. ")

    # instantiate carsim manager
    cm = CarsimManager(
        carsim_db_dir=CARSIM_DB_DIR,
        vehicle_type=VEHICLE_TYPE,
        run_all_dir=RUN_ALL_DIR,
    )

    # 1. 修改 前悬架空气弹簧刚度
    par_path = r"C:\Srs\SrsAutoCarSim\auto\Suspensions\Compliance\CmpInd_6a0a169e-9f67-48f4-8f46-0512eb1a3093.par"
    cm.set_vehicle_param(par_path=par_path, front_spring_rate=27)  # N/m
    # 2. 修改 转向
    # 3. 修改 阻尼
    par_path = r"C:\Srs\SrsAutoCarSim\auto\Suspensions\Shocks\Shock_06339072-ca43-46c4-af82-ec3bf59d6ffc.par"
    cm.set_vehicle_param(par_path=par_path, shock_force_rate=1.1)  # *k 变化倍数
    # 4. 修改 动力响应
    par_path = r"C:\Srs\SrsAutoCarSim\auto\Generic\tables\GenTab_90d23e81-2c53-435f-8e2c-d6503354f720.par"
    cm.set_vehicle_param(par_path=par_path, power_tao_rate=1.1)  # *k 变化倍数

    try:
        # cm.print_sim_parameters()
        # cm.vs_setdef_and_read()
        cm.close()
        # cm.read_configuration()
        cm.run_all()
    except KeyboardInterrupt:
        logger.warn("Process interrupted with Ctrl + C. ")
    except Exception as err_msg:
        logger.error("Once Run:" + err_msg)

    # close carsim
    # cm.close()

    # save results to check results with vs_visualizer
    # cm.save_results_into_carsimdb()

if __name__ == "__main__":
    sys.exit(main())

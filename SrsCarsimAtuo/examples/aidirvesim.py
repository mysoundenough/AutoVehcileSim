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


def main() -> None:
    """ run carsim model with static control inputs """
    logger.info("Starting sample run. ")

    # instantiate carsim manager
    cm = CarsimManager(
        carsim_db_dir=CARSIM_DB_DIR,
        vehicle_type=VEHICLE_TYPE,
    )

    # 1. 修改 前悬架空气弹簧刚度
    par_path = r"C:\Srs\SrsAutoCarSim\auto\Suspensions\Compliance\CmpInd_6a0a169e-9f67-48f4-8f46-0512eb1a3093.par"
    cm.set_vehicle_param(par_path=par_path, front_spring_rate=20)  # N/m
    # 2. 修改 转向
    # 3. 修改 阻尼
    par_path = r"C:\Srs\SrsAutoCarSim\auto\Suspensions\Shocks\Shock_06339072-ca43-46c4-af82-ec3bf59d6ffc.par"
    cm.set_vehicle_param(par_path=par_path, shock_force_rate=10000)  # *k 变化倍数
    # 4. 修改 动力

    # # 修改目标车速（单位：km/h）
    # cm.set_vehicle_param(user_speed=50.0)  # km/h

    try:
        # cm.print_sim_parameters()
        cm.close()
        # cm._init_carsim()
        cm.run_all()
    except KeyboardInterrupt:
        logger.warn("Process interrupted with Ctrl + C. ")
    except Exception as err_msg:
        logger.error("Once Run:" + err_msg)


    # set simulation params
    # onestep_delta_time = timedelta(seconds=0.1)
    # total_sim_time = timedelta(minutes=0.5)
    # total_sim_step = total_sim_time // onestep_delta_time

    # run simulation steps
    # try:
        # for _ in track(range(total_sim_step), description="Running simulation..."):

        #     # prepare operational signals
        #     control_inputs = {
        #         "IMP_STEER_SW": 3.0,
        #         "IMP_FBK_PDL": 0.0,
        #         "IMP_THROTTLE_ENGINE": 15.0
        #     }

        #     # update vehicle states
        #     observed, terminated, updated_time_sec = cm.step(action=control_inputs, delta_time=onestep_delta_time)

        #     # output log
        #     # logger.info(f"T = {updated_time_sec:.2f} [s]")
        #     # logger.info(observed)

        #     # check termination flag
        #     if terminated:
        #         logger.info("Termination flag is True. End of simulation.")
        #         break

    # except KeyboardInterrupt:
    #     logger.warn("Process interrupted with Ctrl + C. ")
    # except Exception as err_msg:
    #     logger.error(err_msg)

    # close carsim
    cm.close()

    # save results to check results with vs_visualizer
    # cm.save_results_into_carsimdb()

if __name__ == "__main__":
    sys.exit(main())

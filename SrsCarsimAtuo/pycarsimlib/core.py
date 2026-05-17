""" core functions of pycarsimlib """
import re
import os
import sys
import struct
import platform
import shutil
from pycarsimlib.api import vs_solver
from datetime import timedelta
from ctypes import cdll
from typing import Union, List, Dict, Any
from pycarsimlib.logger import initialize_logging
from pycarsimlib.models.normal_vehicle import NormalVehicle
from pycarsimlib.models.in_wheel_motored_vehicle import InWheelMotoredVehicle
logger = initialize_logging(__name__)


class CarsimManager:
    """ carsim manager """
    def __init__(
        self,
        carsim_db_dir: str,
        vehicle_type: str,
        run_all_dir: str,
        **kwargs
    ) -> None:

        # set simfile path
        self.carsimdb_dir = carsim_db_dir
        self.run_all_dir = run_all_dir
        self.simfile_path = os.path.join(self.carsimdb_dir, "simfile.sim")
        self.run_all_path = os.path.join(self.run_all_dir, "Run_all.par")
        logger.info(f"simfile path : {self.simfile_path}")

        # select vehicle models
        if vehicle_type == "normal_vehicle":
            self.vehicle = NormalVehicle(**kwargs)
        elif vehicle_type == "in_wheel_motored_vehicle":
            self.vehicle = InWheelMotoredVehicle(**kwargs)
        else:
            logger.error(f"Invalid vehicle type '{vehicle_type}' is specified. ")
            raise AttributeError

        # initialize carsim solver
        self._init_carsim()

        # announce
        logger.info("Carsim solver has been initialized successfully.")

    def _init_carsim(self):
        """ init carsim """
        # get solver instance
        self.solver_api = vs_solver.vs_solver()
        self.path_to_vs_dll = self.solver_api.get_dll_path(self.simfile_path)

        if not self._is_system_available():
            logger.error("Carsim library is invalid.")
            raise RuntimeError

        if not self._is_solver_available():
            logger.error("Carsim solver is invalid.")
            raise RuntimeError

        # now, carsim solver is ready to use. loading params from simfile.
        self.configuration = self.solver_api.read_configuration(self.simfile_path)
        self.t_current = self.configuration.get('t_start')
        self.t_step = self.configuration.get('t_step')

        # prepare importation and exportation of variables
        self.num_of_import_values = self.configuration.get('n_import')
        self.num_of_export_values = self.configuration.get('n_export')
        self.import_label_array = self.vehicle.get_import_labels()
        self.export_label_array = self.vehicle.get_export_labels()
        self.export_array = self.solver_api.copy_export_vars(self.num_of_export_values)

    def _is_system_available(self):
        """ check if the carsim library is available in the system. """
        # dealing with different os
        current_os = platform.system()
        if self.path_to_vs_dll is not None \
                and os.path.exists(self.path_to_vs_dll):

            if current_os == "Linux":
                mc_type = platform.machine()
                if mc_type == 'x86_64':
                    dll_size = 64
                else:
                    dll_size = 32
            else:
                if "_64" in self.path_to_vs_dll:
                    dll_size = 64
                else:
                    dll_size = 32

        # check availability
        _system_word_size = (8 * struct.calcsize("P"))  # 32 or 64
        if _system_word_size != dll_size:
            print("Python size (32/64) must match size of .dlls being loaded.")
            print("Python size:", _system_word_size, "DLL size:", dll_size)
            return False
        else:
            return True

    def _is_solver_available(self):
        """ is solver available """
        try:
            self.vs_dll = cdll.LoadLibrary(self.path_to_vs_dll)
            if self.vs_dll is not None:
                if self.solver_api.get_api(self.vs_dll):
                    return True
        except Exception as err_msg:
            logger.error(err_msg)
            return False

    def reset(self):
        """ reset """
        # under developing
        raise NotImplementedError

    def step(self, action, delta_time):
        """ step run of carsim for delta_time with given action """
        _loop_num = delta_time // timedelta(seconds=self.t_step)

        for _ in range(_loop_num):

            # Run the integration loop
            self.t_current += self.t_step  # increment the time

            # reshape dict to list
            import_array = []
            for key in self.import_label_array:
                if key in action:
                    import_array.append(action[key])
                else:
                    logger.error("Invalid format of carsim action.")
                    raise AttributeError

            # call vs_api function
            status, self.export_array = self.solver_api.integrate_io(self.t_current, import_array, self.export_array)

        return dict(zip(self.export_label_array, self.export_array)), status, self.t_current

    def run_all(self):
        """ run all simulation steps at once """
        error_occurred = 1
        logger.info("##### Run all simulation steps #####")
        logger.info("simfile_path:" + self.simfile_path)
        error_occurred = self.solver_api.run(
            self.simfile_path.replace('\\\\', '\\')
        )
        if error_occurred != 0:
            print("ERROR OCCURRED:  ")
            self.solver_api.print_error()
            sys.exit(error_occurred)
        logger.info("##### End of simulation #####")
    
    def read_configuration(self):

        self.solver_api.read_configuration(self.simfile_path)

    def vs_setdef_and_read(self):
        error_occurred = 1
        logger.info("##### vs_setdef_and_read #####")
        logger.info("simfile_path:" + self.simfile_path)
        error_occurred = self.solver_api.vs_setdef_and_read(
            self.simfile_path.replace('\\\\', '\\')
        )
        if error_occurred != 0:
            print("ERROR OCCURRED:  ")
            self.solver_api.print_error()
            sys.exit(error_occurred)
        logger.info("##### End of vs_setdef_and_read #####")


    def close(self):
        """ close carsim solver normally"""
        self.solver_api.terminate_run(self.t_current)
        logger.info("run close, Carsim solver terminated normally.")

    def save_results_into_carsimdb(self, results_source_dir="", results_target_dir=""):
        """ copy latest results dir into carsimdb location """

        # keep arguments
        _source_dir = results_source_dir
        _target_dir = results_target_dir

        print("laiyuan", _source_dir)
        print("target", _target_dir)

        # set paths
        if not _source_dir:
            _source_dir = os.path.join(os.getcwd(), "Results")
        if not _target_dir:
            _target_dir = os.path.join(self.carsimdb_dir, "Results")

        print("laiyuan", _source_dir)
        print("target", _target_dir)

        # copy results dir
        logger.info(f"Saving results into {_target_dir}")
        shutil.copytree(_source_dir, _target_dir, dirs_exist_ok=True)
        logger.info("Successfully saved results.")

    def set_vehicle_param(self,
                          par_path,
                          front_spring_rate: float = None,
                          shock_force_rate: float = None,
                          power_delay_rate: float = None,
                          power_tao_rate: float = None,
                          user_speed: float = None):
        
        if front_spring_rate is not None:
            self.modify_spring_rate(par_path, "FRONT_SPRING_RATE", front_spring_rate)
        if shock_force_rate is not None:
            self.modify_shock_force(par_path, "FD_TABLE SPLINE", shock_force_rate)
        if power_tao_rate is not None:
            self.modify_power_tao(par_path, "", power_tao_rate)
        if power_delay_rate is not None:
            self.modify_power_delay(par_path, "", power_delay_rate)

        logger.info("vehicle param change done ---")
    
    def modify_power_delay(self, par_path: str, param_name: str, value: float):
        logger.info(par_path)
        if not os.path.exists(par_path):
            logger.error("Simfile not found.")
            raise FileNotFoundError
        # 读取源文件并替换
        with open(par_path, "r", encoding="utf-8") as f:
            content = f.read()
        # 替换 TC_PWR_HYBRID_AV 后面的数字
        new_content = content
        new_content = re.sub(r'^\s*TC_PWR_HYBRID_AV\s+[\d.-]+\s*$', f'TC_PWR_HYBRID_AV {value}', content, flags=re.MULTILINE)
        # 保存新文件
        with open(par_path, "w", encoding="utf-8") as f:
            f.write(new_content)

        # 修改run_all文件
        logger.info(self.run_all_path)
        if not os.path.exists(self.run_all_path):
            logger.error("run_all file not found.")
            raise FileNotFoundError
        # 读取源文件并替换
        with open(self.run_all_path, "r", encoding="utf-8") as f:
            content = f.read()
        # 替换  后面的数字
        new_content = re.sub(r'^\s*TC_PWR_HYBRID_AV\s+[\d.-]+\s*$', f'TC_PWR_HYBRID_AV {value}', content, flags=re.MULTILINE) # 保存新文件
        with open(self.run_all_path, "w", encoding="utf-8") as f:
            f.write(new_content)

    def modify_power_tao(self, par_path: str, param_name: str, value: float):
        logger.info("change power file:" + par_path)
        # 修改底层文件
        try:
            # 1. 读取文件
            with open(par_path, 'r', encoding='utf-8') as f:
                content = f.read()

            # 2. 匹配扭矩表格区域
            pattern = re.compile(
                r"(PWR_DRV_THROTTLE_TABLE LINEAR\n)(.*?)(ENDTABLE)",
                re.DOTALL
            )

            match = pattern.search(content)
            if not match:
                raise ValueError("未找到 PWR_DRV_THROTTLE_TABLE LINEAR 动力响应表格数据")

            # 3. 逐行修改动力响应
            table_lines = match.group(2).strip().splitlines()
            new_lines = []

            for line in table_lines:
                line = line.strip()
                if not line or ',' not in line:
                    new_lines.append(line)
                    continue

                # 拆分开度、扭矩
                vel_str, force_str = line.split(',', 1)
                vel = vel_str.strip()
                force = float(force_str.strip())

                # 按比例缩放
                new_force = force * value

                # 保持格式（整数/小数都兼容）
                if new_force.is_integer():
                    new_force = int(new_force)

                new_lines.append(f"{vel}, {new_force}")

            # 4. 替换回文件内容
            new_table = "\n".join(new_lines)
            # new_content = pattern.sub(
            #     rf"\1{new_table}\n\3",
            #     content
            # )
            new_content = pattern.sub(r"\g<1>" + new_table + r"\n\g<3>", content)

            # 5. 保存文件
            with open(par_path, 'w', encoding='utf-8') as f:
                f.write(new_content)

            logger.info(f"动力响应修改成功: {par_path}, 缩放比例 = {value}")

        except Exception as e:
            logger.error(f"修改动力响应失败: {str(e)}")
            raise FileNotFoundError("Simfile not found.")
        
        # 修改run_all文件
        try:
            # 1. 读取文件
            with open(self.run_all_path, 'r', encoding='utf-8') as f:
                content = f.read()

            # 2. 匹配扭矩表格区域
            pattern = re.compile(
                r"(PWR_DRV_THROTTLE_TABLE LINEAR\n)(.*?)(ENDTABLE)",
                re.DOTALL
            )

            match = pattern.search(content)
            if not match:
                raise ValueError("未找到 PWR_DRV_THROTTLE_TABLE LINEAR 动力响应表格数据")

            # 3. 逐行修改动力响应扭矩
            table_lines = match.group(2).strip().splitlines()
            new_lines = []

            for line in table_lines:
                line = line.strip()
                if not line or ',' not in line:
                    new_lines.append(line)
                    continue

                # 拆分开度、扭矩
                vel_str, force_str = line.split(',', 1)
                vel = vel_str.strip()
                force = float(force_str.strip())

                # 按比例缩放
                new_force = force * value

                # 保持格式（整数/小数都兼容）
                if new_force.is_integer():
                    new_force = int(new_force)

                new_lines.append(f"{vel}, {new_force}")

            # 4. 替换回文件内容
            new_table = "\n".join(new_lines)
            # new_content = pattern.sub(
            #     rf"\1{new_table}\n\3",
            #     content
            # )
            new_content = pattern.sub(r"\g<1>" + new_table + r"\n\g<3>", content)

            # 5. 保存文件
            with open(self.run_all_path, 'w', encoding='utf-8') as f:
                f.write(new_content)

            logger.info(f"动力响应修改成功: {self.run_all_path}, 缩放比例 = {value}")

        except Exception as e:
            logger.error(f"修改动力响应失败: {str(e)}")
            raise FileNotFoundError("Simfile not found.")
    
    def modify_spring_rate(self, par_path: str, param_name: str, value: float):
        logger.info(par_path)
        if not os.path.exists(par_path):
            logger.error("Simfile not found.")
            raise FileNotFoundError
        # 读取源文件并替换
        with open(par_path, "r", encoding="utf-8") as f:
            content = f.read()
        # 替换 *KSPRING_L 后面的数字
        new_content = content
        new_content = re.sub(r'\**KSPRING_L\s+[\d.-]+', f"*KSPRING_L {value}", new_content)
        new_content = re.sub(r'^\s*FS_COMP_COEFFICIENT\s+[\d.-]+\s*$', f'FS_COMP_COEFFICIENT {value}', new_content, flags=re.MULTILINE)
        new_content = re.sub(r'^\s*FS_EXT_COEFFICIENT\s+[\d.-]+\s*$', f'FS_EXT_COEFFICIENT {value}', new_content, flags=re.MULTILINE)
        # 保存新文件
        with open(par_path, "w", encoding="utf-8") as f:
            f.write(new_content)

        # 修改run_all文件
        logger.info(self.run_all_path)
        if not os.path.exists(self.run_all_path):
            logger.error("run_all file not found.")
            raise FileNotFoundError
        # 读取源文件并替换
        with open(self.run_all_path, "r", encoding="utf-8") as f:
            content = f.read()
        # 替换 FS_COMP_COEFFICIENT FS_EXT_COEFFICIENT 后面的数字
        new_content = re.sub(r'^\s*FS_COMP_COEFFICIENT\s+[\d.-]+\s*$', f'FS_COMP_COEFFICIENT {value}', content, flags=re.MULTILINE)
        new_content = re.sub(r'^\s*FS_EXT_COEFFICIENT\s+[\d.-]+\s*$', f'FS_EXT_COEFFICIENT {value}', new_content, flags=re.MULTILINE)
        # 保存新文件
        with open(self.run_all_path, "w", encoding="utf-8") as f:
            f.write(new_content)

    
    def modify_shock_force(self, par_path: str, param_name: str, value: float):
        """
        修改 CarSim 减震器阻尼力表格（按比例缩放）
        :param par_path: 减震器 .par 文件完整路径
        :param param_name: 固定传 "FD_TABLE" 即可
        :param value: 缩放比例（如 1.0 不变，0.5 变软，1.5 变硬）
        """
        try:
            # 1. 读取文件
            with open(par_path, 'r', encoding='utf-8') as f:
                content = f.read()

            # 2. 匹配阻尼表格区域
            pattern = re.compile(
                r"(FD_TABLE SPLINE\n)(.*?)(ENDTABLE)",
                re.DOTALL
            )

            match = pattern.search(content)
            if not match:
                raise ValueError("未找到 FD_TABLE SPLINE 减震数据")

            # 3. 逐行修改阻尼力
            table_lines = match.group(2).strip().splitlines()
            new_lines = []

            for line in table_lines:
                line = line.strip()
                if not line or ',' not in line:
                    new_lines.append(line)
                    continue

                # 拆分速度、力
                vel_str, force_str = line.split(',', 1)
                vel = vel_str.strip()
                force = float(force_str.strip())

                # 按比例缩放
                new_force = force * value

                # 保持格式（整数/小数都兼容）
                if new_force.is_integer():
                    new_force = int(new_force)

                new_lines.append(f"{vel}, {new_force}")

            # 4. 替换回文件内容
            new_table = "\n".join(new_lines)
            new_content = pattern.sub(
                rf"\1{new_table}\n\3",
                content
            )

            # 5. 保存文件
            with open(par_path, 'w', encoding='utf-8') as f:
                f.write(new_content)

            logger.info(f"减震器阻尼修改成功: {par_path}, 缩放比例 = {value}")

        except Exception as e:
            logger.error(f"修改减震器失败: {str(e)}")
            raise FileNotFoundError("Simfile not found.")

        try:
            # 1. 读取文件
            with open(self.run_all_path, 'r', encoding='utf-8') as f:
                content = f.read()

            # 2. 匹配阻尼表格区域
            pattern = re.compile(
                r"(FD_TABLE SPLINE\n)(.*?)(ENDTABLE)",
                re.DOTALL
            )

            match = pattern.search(content)
            if not match:
                raise ValueError("未找到 FD_TABLE SPLINE 减震数据")

            # 3. 逐行修改阻尼力
            table_lines = match.group(2).strip().splitlines()
            new_lines = []

            for line in table_lines:
                line = line.strip()
                if not line or ',' not in line:
                    new_lines.append(line)
                    continue

                # 拆分速度、力
                vel_str, force_str = line.split(',', 1)
                vel = vel_str.strip()
                force = float(force_str.strip())

                # 按比例缩放
                new_force = force * value

                # 保持格式（整数/小数都兼容）
                if new_force.is_integer():
                    new_force = int(new_force)

                new_lines.append(f"{vel}, {new_force}")

            # 4. 替换回文件内容
            new_table = "\n".join(new_lines)
            new_content = pattern.sub(
                rf"\1{new_table}\n\3",
                content
            )

            # 5. 保存文件
            with open(self.run_all_path, 'w', encoding='utf-8') as f:
                f.write(new_content)

            logger.info(f"减震器阻尼修改成功: {self.run_all_path}, 缩放比例 = {value}")

        except Exception as e:
            logger.error(f"修改减震器失败: {str(e)}")
            raise FileNotFoundError("Simfile not found.")
        

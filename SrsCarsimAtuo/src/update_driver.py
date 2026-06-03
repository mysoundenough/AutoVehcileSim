"""
Run_all.par 驾驶员模型配置更新工具
用新的StrDM文件替换原有的驾驶员模型配置
"""

import re
from pathlib import Path
from typing import Optional


class RunAllDriverUpdater:
    """
    Run_all.par 驾驶员模型配置更新器
    用于替换驾驶员模型(StrDM)配置
    """
    
    def __init__(self, run_all_path: str, output_dir: Optional[str] = None):
        """
        初始化更新器
        
        Args:
            run_all_path: 原始 Run_all.par 文件路径
            output_dir: 输出目录，如果为None则覆盖原文件
        """
        self.run_all_path = Path(run_all_path)
        self.output_dir = Path(output_dir) if output_dir else self.run_all_path.parent
        self.output_dir.mkdir(parents=True, exist_ok=True)
        
        # 读取原始文件内容
        with open(self.run_all_path, 'r', encoding='utf-8') as f:
            self.original_content = f.read()
    
    def extract_driver_section_from_file(self, driver_file_path: str) -> str:
        """
        从驾驶员模型文件中提取完整的配置段
        
        Args:
            driver_file_path: 驾驶员模型文件路径 (StrDM_*.par)
            
        Returns:
            驾驶员模型配置段（包含ENTER_PARSFILE到EXIT_PARSFILE的完整内容）
        """
        with open(driver_file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 移除开头的PARSFILE和结尾的END
        content = re.sub(r'^PARSFILE\n', '', content)
        content = re.sub(r'\nEND$', '', content)
        
        # 提取关键信息
        full_data_name_match = re.search(r'#FullDataName (.+?)\n', content)
        full_data_name = full_data_name_match.group(1) if full_data_name_match else ""
        
        # 提取 SET_ILTARG_FOR_ID
        iltarg_match = re.search(r'SET_ILTARG_FOR_ID (\d+)', content)
        set_iltarg = iltarg_match.group(1) if iltarg_match else "0"
        
        # 提取 set_description
        desc_match = re.search(r'set_description LTARG_ID (.+?)\n', content)
        description = desc_match.group(1) if desc_match else ""
        
        # 提取 INSTALL_DM_PATH_FOLLOWER
        install_dm = "INSTALL_DM_PATH_FOLLOWER" if "INSTALL_DM_PATH_FOLLOWER" in content else ""
        
        # 提取 OPT_DM
        opt_dm_match = re.search(r'OPT_DM (\d+)', content)
        opt_dm = opt_dm_match.group(1) if opt_dm_match else "3"
        
        # 提取 INSTALL_DM_IMPORTS
        install_imports = "INSTALL_DM_IMPORTS" if "INSTALL_DM_IMPORTS" in content else ""
        
        # 提取 LTARG_TABLE
        table_match = re.search(r'LTARG_TABLE SPLINE_FLAT\n(.*?)\nENDTABLE', content, re.DOTALL)
        table_content = table_match.group(1) if table_match else ""
        
        # 提取其他参数
        path_width_match = re.search(r'SET_PATH_WIDTH ([\d\.]+)', content)
        path_width = path_width_match.group(1) if path_width_match else "0.1"
        
        dash_interval_match = re.search(r'SET_PATH_DASH_INTERVAL ([\d\.]+)', content)
        dash_interval = dash_interval_match.group(1) if dash_interval_match else "0.5"
        
        vertex_interval_match = re.search(r'SET_PATH_VERTEX_INTERVAL (\d+)', content)
        vertex_interval = vertex_interval_match.group(1) if vertex_interval_match else "1"
        
        path_dz_match = re.search(r'SET_PATH_DZ ([\d\.]+)', content)
        path_dz = path_dz_match.group(1) if path_dz_match else "0.03"
        
        path_color_match = re.search(r'SET_PATH_COLOR ([\d\.]+ [\d\.]+ [\d\.]+)', content)
        path_color = path_color_match.group(1) if path_color_match else "0.4 0.4 1"
        
        # 提取 CREATE_PATH_OBJ
        create_path = "CREATE_PATH_OBJ on" if "CREATE_PATH_OBJ on" in content else ""
        
        # 提取 OPT_STR_BY_TRQ
        opt_str_match = re.search(r'OPT_STR_BY_TRQ (\d+)', content)
        opt_str_by_trq = opt_str_match.group(1) if opt_str_match else "0"
        
        # 提取转向参数
        av_sw_max_match = re.search(r'AV_SW_MAX_DM ([\d\.]+)', content)
        av_sw_max = av_sw_max_match.group(1) if av_sw_max_match else "1200"
        
        a_sw_max_match = re.search(r'A_SW_MAX_DM ([\d\.]+)', content)
        a_sw_max = a_sw_max_match.group(1) if a_sw_max_match else "540"
        
        # 提取预瞄时间
        tprev_match = re.search(r'\*TPREV ([\d\.]+)', content)
        tprev = tprev_match.group(1) if tprev_match else "0.5"
        
        # 提取低速阈值
        vlow_match = re.search(r'VLOW_DM ([\d\.]+)', content)
        vlow = vlow_match.group(1) if vlow_match else "10"
        
        # 提取 TPREV_CONSTANT
        tprev_const_match = re.search(r'TPREV_CONSTANT ([\d\.]+)', content)
        tprev_const = tprev_const_match.group(1) if tprev_const_match else "0.5"
        
        # 提取 LOG_ENTRY
        log_entry_match = re.search(r'LOG_ENTRY (.+?)\n', content)
        log_entry = log_entry_match.group(1) if log_entry_match else ""
        
        driver_name = Path(driver_file_path).name
        
        # 构建完整的配置段
        driver_section = f"""ENTER_PARSFILE Control\\Driver\\{driver_name}
#FullDataName {full_data_name}
SET_ILTARG_FOR_ID {set_iltarg}
set_description LTARG_ID {description}
{install_dm}
OPT_DM {opt_dm}
{install_imports}
LTARG_TABLE SPLINE_FLAT
{table_content}
ENDTABLE
SET_PATH_WIDTH {path_width}
SET_PATH_DASH_INTERVAL {dash_interval}
SET_PATH_VERTEX_INTERVAL {vertex_interval}
SET_PATH_DZ {path_dz}
SET_PATH_COLOR {path_color}
LTARG_ID_DM LTARG_ID
{create_path}
OPT_STR_BY_TRQ {opt_str_by_trq}
AV_SW_MAX_DM {av_sw_max}
A_SW_MAX_DM {a_sw_max}
VLOW_DM {vlow}
TPREV_CONSTANT {tprev_const}
LOG_ENTRY {log_entry}
EXIT_PARSFILE Control\\Driver\\{driver_name}
"""
        
        return driver_section
    
    def update_with_file(self, new_driver_file_path: str, 
                         output_path: Optional[str] = None,
                         backup: bool = True) -> Path:
        """
        使用新的驾驶员模型文件更新Run_all.par
        
        Args:
            new_driver_file_path: 新的驾驶员模型文件路径 (StrDM_*.par)
            output_path: 输出文件路径
            backup: 是否备份原文件
            
        Returns:
            更新后的文件路径
        """
        # 备份原文件
        if backup:
            backup_path = self.run_all_path.with_suffix('.par.bak')
            with open(backup_path, 'w', encoding='utf-8') as f:
                f.write(self.original_content)
            print(f"✅ 已备份原文件: {backup_path}")
        
        # 从新文件中提取配置段
        print(f"📖 读取驾驶员模型文件: {new_driver_file_path}")
        new_section = self.extract_driver_section_from_file(new_driver_file_path)
        
        # 查找并替换（使用字符串查找，避免正则转义问题）
        start_marker = "ENTER_PARSFILE Control\\Driver\\StrDM_"
        end_marker = "EXIT_PARSFILE Control\\Driver\\StrDM_"
        
        start_idx = self.original_content.find(start_marker)
        
        if start_idx == -1:
            # 尝试正斜杠格式
            start_marker = "ENTER_PARSFILE Control/Driver/StrDM_"
            end_marker = "EXIT_PARSFILE Control/Driver/StrDM_"
            start_idx = self.original_content.find(start_marker)
        
        if start_idx != -1:
            # 找到对应的结束位置
            end_idx = self.original_content.find(end_marker, start_idx)
            if end_idx != -1:
                # 找到该行的结束
                end_line_idx = self.original_content.find('\n', end_idx)
                if end_line_idx != -1:
                    end_idx = end_line_idx + 1
                
                # 直接替换字符串
                new_content = self.original_content[:start_idx] + new_section + self.original_content[end_idx:]
                
                # 保存
                output_path = Path(output_path) if output_path else self.run_all_path
                with open(output_path, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                
                print(f"✅ 已更新文件: {output_path}")
                return output_path
            else:
                print("❌ 未找到结束标记")
                return None
        else:
            print("❌ 未找到驾驶员模型配置起始标记")
            return None


def update_driver_in_runall(run_all_path: str, 
                            new_driver_file_path: str,
                            output_path: str = None) -> str:
    """
    简单函数：更新Run_all.par中的驾驶员模型配置
    
    Args:
        run_all_path: Run_all.par文件路径
        new_driver_file_path: 新的驾驶员模型文件路径 (StrDM_*.par)
        output_path: 输出文件路径（可选）
    
    Returns:
        更新后的文件路径
    """
    updater = RunAllDriverUpdater(run_all_path)
    result = updater.update_with_file(new_driver_file_path, output_path)
    return str(result) if result else None


# ==================== 使用示例 ====================

if __name__ == "__main__":
    # 配置路径
    RUN_ALL_PATH = r"./Results/Run_7c5ad720-4776-4093-b36b-51f3c09721ba/Run_all.par"
    NEW_DRIVER_FILE = r"./Results/Run_7c5ad720-4776-4093-b36b-51f3c09721ba/StrDM_8597394d-a68f-46f7-992e-beb4bd86bc2e.par"
    OUTPUT_DIR = r"./Results/Run_7c5ad720-4776-4093-b36b-51f3c09721ba/updated"
    
    print("="*60)
    print("Run_all.par 驾驶员模型配置更新工具")
    print("="*60)
    
    # 更新驾驶员模型配置
    if Path(NEW_DRIVER_FILE).exists():
        result = update_driver_in_runall(
            run_all_path=RUN_ALL_PATH,
            new_driver_file_path=NEW_DRIVER_FILE,
            output_path=Path(OUTPUT_DIR) / "Run_all_updated.par"
        )
        
        if result:
            print(f"\n✅ 更新成功: {result}")
        else:
            print("\n❌ 更新失败")
    else:
        print(f"❌ 文件不存在: {NEW_DRIVER_FILE}")
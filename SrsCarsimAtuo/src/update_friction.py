"""
Run_all.par 文件更新工具
用新的附着系数配置替换原有的配置
"""

import re
from pathlib import Path
from datetime import datetime
from typing import Optional


class RunAllParUpdater:
    """
    Run_all.par 文件更新器
    用于替换附着系数配置段
    """
    
    def __init__(self, run_all_path: str, output_dir: Optional[str] = None):
        """
        初始化更新器
        
        Args:
            run_all_path: 原始 Run_all.par 文件路径
            output_dir: 输出目录，如果为None则覆盖原文件
        """
        self.run_all_path_new = Path(run_all_path.replace('.par', '_new.par'))
        self.run_all_path = Path(run_all_path)
        self.output_dir = Path(output_dir) if output_dir else self.run_all_path.parent
        
        # 读取原始文件内容
        with open(self.run_all_path, 'r', encoding='utf-8') as f:
            self.original_content = f.read()
    
    def get_friction_section_from_file(self, friction_file_path: str) -> str:
        """
        从附着系数文件中提取完整的配置段
        
        Args:
            friction_file_path: 附着系数文件路径
            
        Returns:
            附着系数配置段（包含ENTER_PARSFILE到EXIT_PARSFILE的完整内容）
        """
        with open(friction_file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 提取 #FullDataName 行
        full_data_name_match = re.search(r'#FullDataName (.+?)\n', content)
        full_data_name = full_data_name_match.group(1) if full_data_name_match else ""
        
        # 提取 MU_ROAD_CARPET 表格
        table_match = re.search(r'MU_ROAD_CARPET 2D_STEP\n(.*?)\nENDTABLE', content, re.DOTALL)
        table_content = table_match.group(1) if table_match else ""
        
        # 提取 LOG_ENTRY
        log_entry_match = re.search(r'LOG_ENTRY (.+?)\n', content)
        log_entry = log_entry_match.group(1) if log_entry_match else ""
        
        # 构建完整的配置段
        friction_section = f"""ENTER_PARSFILE Roads\\Friction\\{Path(friction_file_path).name}
#FullDataName {full_data_name}
MU_ROAD_CARPET 2D_STEP
{table_content}
ENDTABLE
LOG_ENTRY {log_entry}
EXIT_PARSFILE Roads\\Friction\\{Path(friction_file_path).name}\n"""
        
        return friction_section
    
    def get_friction_section_from_params(self, friction_file_name: str,
                                          full_data_name: str,
                                          table_header: str,
                                          table_rows: list,
                                          log_entry: str) -> str:
        """
        根据参数构建附着系数配置段
        
        Args:
            friction_file_name: 附着系数文件名
            full_data_name: #FullDataName 内容
            table_header: 表格表头（如 "0, -10, -6, -2, 0, 2, 6, 10"）
            table_rows: 表格行数据列表 [("station", [mu_values]), ...]
            log_entry: LOG_ENTRY 内容
            
        Returns:
            附着系数配置段
        """
        # 构建表格内容
        table_lines = [table_header]
        for station, mu_values in table_rows:
            mu_str = ", ".join([f"{mu:.2f}" for mu in mu_values])
            table_lines.append(f"{station:.0f}, {mu_str}")
        
        table_content = "\n".join(table_lines)
        
        friction_section = f"""ENTER_PARSFILE Roads\\Friction\\{friction_file_name}
#FullDataName {full_data_name}
MU_ROAD_CARPET 2D_STEP
{table_content}
ENDTABLE
LOG_ENTRY {log_entry}
EXIT_PARSFILE Roads\\Friction\\{friction_file_name}\n"""
        
        return friction_section
    
    def find_and_replace_friction_section(self, new_friction_section: str) -> str:

        #使用字符串查找替换（更简单，避免正则转义问题）
        # 查找旧的附着系数配置段开始位置
        old_start_marker = "ENTER_PARSFILE Roads\\Friction\\RdMu_"
        old_end_marker = "EXIT_PARSFILE Roads\\Friction\\RdMu_"
        
        start_idx = self.original_content.find(old_start_marker)
        
        if start_idx == -1:
            # 尝试正斜杠格式
            old_start_marker = "ENTER_PARSFILE Roads/Friction/RdMu_"
            old_end_marker = "EXIT_PARSFILE Roads/Friction/RdMu_"
            start_idx = self.original_content.find(old_start_marker)
        
        if start_idx != -1:
            # 找到结束位置
            end_idx = self.original_content.find(old_end_marker, start_idx)
            if end_idx != -1:
                # 找到该行的结束
                end_line_idx = self.original_content.find('\n', end_idx)
                if end_line_idx != -1:
                    end_idx = end_line_idx + 1
            
            # 替换
            new_content = (self.original_content[:start_idx] + 
                        new_friction_section + 
                        self.original_content[end_idx:])
        else:
            print("⚠️ 未找到附着系数配置段，追加到文件末尾")
            new_content = self.original_content + "\n" + new_friction_section
        
        # 更新 set_description 行
        new_content = re.sub(
            r'set_description road_path_id PATH_ID for: .+?\n',
            'set_description road_path_id PATH_ID for: Straight East_python\n',
            new_content
        )
        
        return new_content

    def update_with_file(self, new_friction_file_path: str) -> Path:
        """
        使用新的附着系数文件更新 Run_all.par
        
        Args:
            new_friction_file_path: 新的附着系数文件路径
            output_path: 输出文件路径，如果为None则覆盖原文件
            backup: 是否备份原文件
            
        Returns:
            更新后的文件路径
        """
        # 从文件中提取配置段
        friction_section = self.get_friction_section_from_file(new_friction_file_path)
        
        # 替换
        new_content = self.find_and_replace_friction_section(friction_section)
        
        # 写入文件
        with open(self.output_dir, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        print(f"✅ 已更新文件: {self.output_dir}")
        return self.output_dir
    
    def update_with_custom_config(self, 
                                  friction_file_name: str,
                                  full_data_name: str,
                                  table_header: str,
                                  table_rows: list,
                                  log_entry: str,
                                  output_path: Optional[str] = None,
                                  backup: bool = True) -> Path:
        """
        使用自定义配置更新 Run_all.par
        
        Args:
            friction_file_name: 附着系数文件名（如 "RdMu_6c13f312-d7ed-4bb3-a3fd-fea7aa273e97.par"）
            full_data_name: #FullDataName 内容
            table_header: 表格表头
            table_rows: 表格行数据
            log_entry: LOG_ENTRY 内容
            output_path: 输出文件路径
            backup: 是否备份原文件
            
        Returns:
            更新后的文件路径
        """
        # 构建配置段
        friction_section = self.get_friction_section_from_params(
            friction_file_name, full_data_name, table_header, table_rows, log_entry
        )
        
        # 替换
        new_content = self.find_and_replace_friction_section(friction_section, backup)
        
        # 写入文件
        output_path = Path(output_path) if output_path else self.run_all_path
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        print(f"✅ 已更新文件: {output_path}")
        return output_path


def create_left_low_friction_config() -> dict:
    """
    创建左侧低附着、右侧正常附着的配置
    
    Returns:
        配置参数字典
    """
    # 表头：侧向位置 (L)
    table_header = "0, -10, -6, -2, 0, 2, 6, 10"
    
    # 表格行数据: (station, [mu_at_lateral_positions])
    table_rows = [
        (-200, [0.30, 0.30, 0.30, 0.85, 0.85, 0.85, 0.85]),
        (150,  [0.30, 0.30, 0.30, 0.85, 0.85, 0.85, 0.85]),
        (400,  [0.30, 0.30, 0.30, 0.85, 0.85, 0.85, 0.85]),
        (500,  [0.30, 0.30, 0.30, 0.85, 0.85, 0.85, 0.85]),
    ]
    
    return {
        "friction_file_name": "RdMu_6c13f312-d7ed-4bb3-a3fd-fea7aa273e97.par",
        "full_data_name": "Road: Friction Map, S-L Grid`SplitMu_LeftLow`Mu=0.3 from -200<S<500, -10<L<-2; Mu=0.85 from -200<S<500, 2<L<10",
        "table_header": table_header,
        "table_rows": table_rows,
        "log_entry": "Used Dataset: Road: Friction Map, S-L Grid; { SplitMu_LeftLow } Mu=0.3 from -200<S<500, -10<L<-2; Mu=0.85 from -200<S<500, 2<L<10"
    }


def create_ice_friction_config() -> dict:
    """
    创建冰雪路面配置（全区域低附着）
    
    Returns:
        配置参数字典
    """
    table_header = "0, -10, -5, 0, 5, 10"
    table_rows = [
        (-200, [0.15, 0.15, 0.15, 0.15, 0.15]),
        (100,  [0.15, 0.15, 0.15, 0.15, 0.15]),
        (300,  [0.15, 0.15, 0.15, 0.15, 0.15]),
        (500,  [0.15, 0.15, 0.15, 0.15, 0.15]),
    ]
    
    return {
        "friction_file_name": "RdMu_ice_6c13f312-d7ed-4bb3-a3fd-fea7aa273e97.par",
        "full_data_name": "Road: Friction Map, S-L Grid`Ice_Road`Mu=0.15 everywhere",
        "table_header": table_header,
        "table_rows": table_rows,
        "log_entry": "Used Dataset: Road: Friction Map, S-L Grid; { Ice_Road } Mu=0.15 everywhere"
    }


def create_wet_friction_config() -> dict:
    """
    创建湿滑路面配置（中低附着）
    
    Returns:
        配置参数字典
    """
    table_header = "0, -10, -5, 0, 5, 10"
    table_rows = [
        (-200, [0.55, 0.55, 0.55, 0.55, 0.55]),
        (100,  [0.55, 0.55, 0.55, 0.55, 0.55]),
        (300,  [0.55, 0.55, 0.55, 0.55, 0.55]),
        (500,  [0.55, 0.55, 0.55, 0.55, 0.55]),
    ]
    
    return {
        "friction_file_name": "RdMu_wet_6c13f312-d7ed-4bb3-a3fd-fea7aa273e97.par",
        "full_data_name": "Road: Friction Map, S-L Grid`Wet_Road`Mu=0.55 everywhere",
        "table_header": table_header,
        "table_rows": table_rows,
        "log_entry": "Used Dataset: Road: Friction Map, S-L Grid; { Wet_Road } Mu=0.55 everywhere"
    }


# ==================== 使用示例 ====================

if __name__ == "__main__":
    # 文件路径配置
    RUN_ALL_PATH = r"./carsim_configs/Run_all.par"  # 原始 Run_all.par 路径
    OUTPUT_DIR = r"./carsim_configs/updated"        # 输出目录
    
    # 示例1: 使用已有的附着系数文件更新
    print("="*60)
    print("示例1: 使用已有文件更新")
    print("="*60)
    
    # 假设已有新的附着系数文件
    new_friction_file = r"./carsim_configs/RdMu_6c13f312-d7ed-4bb3-a3fd-fea7aa273e97.par"
    
    updater = RunAllParUpdater(RUN_ALL_PATH, OUTPUT_DIR)
    
    # 如果新文件存在，可以直接使用
    updated_file = updater.update_with_file(new_friction_file)
    
    # 示例2: 使用自定义配置更新（左侧低附着）
    print("\n" + "="*60)
    """ print("示例2: 左侧低附着配置")
    print("="*60)
    
    left_low_config = create_left_low_friction_config()
    
    updated_file = updater.update_with_custom_config(
        friction_file_name=left_low_config["friction_file_name"],
        full_data_name=left_low_config["full_data_name"],
        table_header=left_low_config["table_header"],
        table_rows=left_low_config["table_rows"],
        log_entry=left_low_config["log_entry"],
        output_path=Path(OUTPUT_DIR) / "Run_all_updated.par",
        backup=True
    )
    
    # 示例3: 冰雪路面配置
    print("\n" + "="*60)
    print("示例3: 冰雪路面配置")
    print("="*60)
    
    ice_config = create_ice_friction_config()
    
    updater2 = RunAllParUpdater(RUN_ALL_PATH, OUTPUT_DIR)
    ice_updated = updater2.update_with_custom_config(
        friction_file_name=ice_config["friction_file_name"],
        full_data_name=ice_config["full_data_name"],
        table_header=ice_config["table_header"],
        table_rows=ice_config["table_rows"],
        log_entry=ice_config["log_entry"],
        output_path=Path(OUTPUT_DIR) / "Run_all_ice.par",
        backup=False
    )
    
    # 示例4: 湿滑路面配置
    print("\n" + "="*60)
    print("示例4: 湿滑路面配置")
    print("="*60)
    
    wet_config = create_wet_friction_config()
    
    updater3 = RunAllParUpdater(RUN_ALL_PATH, OUTPUT_DIR)
    wet_updated = updater3.update_with_custom_config(
        friction_file_name=wet_config["friction_file_name"],
        full_data_name=wet_config["full_data_name"],
        table_header=wet_config["table_header"],
        table_rows=wet_config["table_rows"],
        log_entry=wet_config["log_entry"],
        output_path=Path(OUTPUT_DIR) / "Run_all_wet.par",
        backup=False
    )
    
    print("\n" + "="*60)
    print("所有更新完成！")
    print("="*60)
    print(f"输出目录: {OUTPUT_DIR}") """
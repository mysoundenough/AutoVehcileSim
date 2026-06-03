"""
Run_all.par 道路段配置更新工具
用新生成的道路段文件替换原有的道路段配置
"""

import re
from pathlib import Path
from typing import Optional


class RunAllRoadSegUpdater:
    """
    Run_all.par 道路段配置更新器
    用于替换道路段(BuilderSegment)配置
    """
    
    def __init__(self, name: str, run_all_path: str, output_dir: Optional[str] = None):
        """
        初始化更新器
        
        Args:
            run_all_path: 原始 Run_all.par 文件路径
            output_dir: 输出目录，如果为None则覆盖原文件
        """
        self.name = name
        self.run_all_path = Path(run_all_path)
        self.output_dir = Path(output_dir) if output_dir else self.run_all_path.parent
        self.output_dir.mkdir(parents=True, exist_ok=True)
        
        # 读取原始文件内容
        with open(self.run_all_path, 'r', encoding='utf-8') as f:
            self.original_content = f.read()
    
    def extract_road_section_from_file(self, road_file_path: str) -> str:
        """
        从道路段文件中提取完整的配置段
        
        Args:
            road_file_path: 道路段文件路径 (RoadSeg_*.par)
            
        Returns:
            道路段配置段（包含ENTER_PARSFILE到EXIT_PARSFILE的完整内容）
        """
        with open(road_file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 提取 #FullDataName
        full_data_name_match = re.search(r'#FullDataName (.+?)\n', content)
        full_data_name = full_data_name_match.group(1) if full_data_name_match else ""
        
        # 提取 SET_IPATH_FOR_ID
        ipath_for_id_match = re.search(r'SET_IPATH_FOR_ID (\d+)', content)
        ipath_for_id = ipath_for_id_match.group(1) if ipath_for_id_match else "0"
        
        # 提取 OPT_PATH_START
        opt_start_match = re.search(r'OPT_PATH_START (\d+)', content)
        opt_path_start = opt_start_match.group(1) if opt_start_match else "0"
        
        # 提取 OPT_PATH_LOOP
        opt_loop_match = re.search(r'OPT_PATH_LOOP (\d+)', content)
        opt_path_loop = opt_loop_match.group(1) if opt_loop_match else "0"
        
        # 提取 SPATH_START
        spath_start_match = re.search(r'SPATH_START ([\d\.]+)', content)
        spath_start = spath_start_match.group(1) if spath_start_match else "0"
        
        # 提取起始坐标（如果有）
        x_start = ""
        y_start = ""
        heading_start = ""
        
        x_match = re.search(r'X_PATH_START ([\d\.\-]+)', content)
        if x_match:
            x_start = f"\nX_PATH_START {x_match.group(1)}"
        
        y_match = re.search(r'Y_PATH_START ([\d\.\-]+)', content)
        if y_match:
            y_start = f"\nY_PATH_START {y_match.group(1)}"
        
        heading_match = re.search(r'HEADING_START ([\d\.\-]+)', content)
        if heading_match:
            heading_start = f"\nHEADING_START {heading_match.group(1)}"
        
        # 提取 set_description
        desc_match = re.search(r'set_description path_id (.+?)\n', content)
        description = desc_match.group(1) if desc_match else ""
        
        # 提取 NSEGMENTS
        nsegments_match = re.search(r'NSEGMENTS (\d+)', content)
        nsegments = nsegments_match.group(1) if nsegments_match else "1"
        
        # 提取所有段定义
        segments = []
        
        # 查找所有 IPATHSEG 块
        ipathseg_pattern = r'IPATHSEG (\d+)\n(.*?)(?=IPATHSEG \d+|Title |$)'
        matches = re.finditer(ipathseg_pattern, content, re.DOTALL)
        
        for match in matches:
            seg_num = match.group(1)
            seg_content = match.group(2).strip()
            segments.append(f"IPATHSEG {seg_num}\n{seg_content}")
        
        segments_str = '\n'.join(segments)
        
        # 提取 Title
        title_match = re.search(r'Title (.+?)\n', content)
        title = title_match.group(1) if title_match else ""
        
        # 提取 LOG_ENTRY
        log_entry_match = re.search(r'LOG_ENTRY (.+?)\n', content)
        log_entry = log_entry_match.group(1) if log_entry_match else ""
        
        road_name = Path(road_file_path).name
        
        # 构建完整的配置段
        road_section = f"""ENTER_PARSFILE Roads\\BuilderSegment\\{road_name}
#FullDataName {full_data_name}
SET_IPATH_FOR_ID {ipath_for_id}
OPT_PATH_START {opt_path_start}
OPT_PATH_LOOP {opt_path_loop}
SPATH_START {spath_start}{x_start}{y_start}{heading_start}
PATH_ID_DM = PATH_ID
set_description path_id {description}
NSEGMENTS {nsegments}
{segments_str}
Title {title}
LOG_ENTRY {log_entry}
EXIT_PARSFILE Roads\\BuilderSegment\\{road_name}
"""
        
        return road_section
    
    def update_with_file(self, new_road_file_path: str, 
                         output_path: Optional[str] = None) -> Path:
        """
        使用新的道路段文件更新Run_all.par
        
        Args:
            new_road_file_path: 新的道路段文件路径 (RoadSeg_*.par)
            output_path: 输出文件路径
            backup: 是否备份原文件
            
        Returns:
            更新后的文件路径
        """
        
        # 从新文件中提取配置段
        print(f"📖 读取道路段文件: {new_road_file_path}")
        new_section = self.extract_road_section_from_file(new_road_file_path)
        
        # 查找并替换（使用字符串查找，避免正则转义问题）
        start_marker = "ENTER_PARSFILE Roads\\BuilderSegment\\"
        end_marker = "EXIT_PARSFILE Roads\\BuilderSegment\\"
        
        start_idx = self.original_content.find(start_marker)
        
        if start_idx == -1:
            # 尝试正斜杠格式
            start_marker = "ENTER_PARSFILE Roads/BuilderSegment/"
            end_marker = "EXIT_PARSFILE Roads/BuilderSegment/"
            start_idx = self.original_content.find(start_marker)
        
        if start_idx != -1:
            # 找到对应的结束位置
            end_idx = self.original_content.find(end_marker, start_idx)
            if end_idx != -1:
                # 找到该行的结束
                end_line_idx = self.original_content.find('\n', end_idx)
                if end_line_idx != -1:
                    end_idx = end_line_idx + 1
                old_section = self.original_content[start_idx:end_idx]
                # 提取 set_description
                desc_match = re.search(r'set_description path_id (.+?)\n', old_section)
                description = desc_match.group(1) if desc_match else ""
                # 直接替换字符串
                new_content = self.original_content[:start_idx] + new_section + self.original_content[end_idx:]
                new_content = new_content.replace(description, self.name)
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
            print("❌ 未找到道路段配置起始标记")
            return None


def update_road_in_runall(name: str,
                          run_all_path: str, 
                          new_road_file_path: str,
                          output_path: str = None) -> str:
    """
    简单函数：更新Run_all.par中的道路段配置
    
    Args:
        run_all_path: Run_all.par文件路径
        new_road_file_path: 新的道路段文件路径
        output_path: 输出文件路径（可选）
    
    Returns:
        更新后的文件路径
    """
    updater = RunAllRoadSegUpdater(name, run_all_path)
    result = updater.update_with_file(new_road_file_path, output_path)
    return str(result) if result else None


# ==================== 使用示例 ====================

if __name__ == "__main__":
    # 配置路径
    RUN_ALL_PATH = r"./Results/Run_7c5ad720-4776-4093-b36b-51f3c09721ba/Run_all.par"
    OUTPUT_DIR = r"./Results/Run_7c5ad720-4776-4093-b36b-51f3c09721ba/updated"
    
    # 假设已经生成了各种道路段文件
    road_files = {
        "straight": r"./Results/roads/RoadSeg_78ae3b49-9398-4a5e-a64e-3317ac81ba57.par",
        "circle": r"./Results/roads/RoadSeg_d1178487-398b-4215-8559-b2799b8a43a2.par",
        "turn": r"./Results/roads/RoadSeg_505d02c8-5d5e-4a92-92bf-8ee2d826900e.par",
        "s_turn": r"./Results/roads/RoadSeg_9afba02b-4059-406d-8983-91b57db8a671.par",
    }
    
    print("="*60)
    print("Run_all.par 道路段配置更新工具")
    print("="*60)
    
    # 示例1: 替换为直线道路
    print("\n1. 替换为直线道路...")
    name = 'myAuto'
    if Path(road_files["straight"]).exists():
        update_road_in_runall(
            name = name,
            run_all_path=RUN_ALL_PATH,
            new_road_file_path=road_files["straight"],
            output_path=Path(OUTPUT_DIR) / "Run_all_straight.par"
        )
    
    # 示例2: 替换为圆形道路
    print("\n2. 替换为圆形道路...")
    if Path(road_files["circle"]).exists():
        update_road_in_runall(
            name = name,
            run_all_path=RUN_ALL_PATH,
            new_road_file_path=road_files["circle"],
            output_path=Path(OUTPUT_DIR) / "Run_all_circle.par"
        )
    
    # 示例3: 替换为转弯道路
    print("\n3. 替换为转弯道路...")
    if Path(road_files["turn"]).exists():
        update_road_in_runall(
            name = name,
            run_all_path=RUN_ALL_PATH,
            new_road_file_path=road_files["turn"],
            output_path=Path(OUTPUT_DIR) / "Run_all_turn.par"
        )
    
    # 示例4: 替换为S型弯道
    print("\n4. 替换为S型弯道...")
    if Path(road_files["s_turn"]).exists():
        update_road_in_runall(
            name = name,
            run_all_path=RUN_ALL_PATH,
            new_road_file_path=road_files["s_turn"],
            output_path=Path(OUTPUT_DIR) / "Run_all_s_turn.par"
        )
    
    print("\n" + "="*60)
    print("所有更新完成！")
    print("="*60)
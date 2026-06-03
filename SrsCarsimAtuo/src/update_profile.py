import re
from pathlib import Path


def replace_profile_in_runall(run_all_path: str, 
                              new_profile_path: str, 
                              output_path: str = None) -> str:
    """
    在Run_all.par中替换Profile配置
    
    Args:
        run_all_path: Run_all.par文件路径
        new_profile_path: 新的Profile文件路径
        output_path: 输出文件路径（可选）
    
    Returns:
        更新后的文件路径
    """
    # 读取原始文件
    with open(run_all_path, 'r', encoding='utf-8') as f:
        original_content = f.read()
    
    # 读取新Profile文件
    with open(new_profile_path, 'r', encoding='utf-8') as f:
        profile_content = f.read()
    
    # 提取Profile配置段
    profile_content = re.sub(r'^PARSFILE\n', '', profile_content)
    profile_content = re.sub(r'\nEND$', '', profile_content)
    
    # 提取关键部分
    full_data_name = re.search(r'#FullDataName (.+?)\n', profile_content).group(1)
    iside1 = re.search(r'ISIDE 1\nZ_PROFILE_TABLE LINEAR_LOOP\n(.*?)\nENDTABLE', profile_content, re.DOTALL).group(1)
    iside2 = re.search(r'ISIDE 2\nZ_PROFILE_TABLE LINEAR_LOOP\n(.*?)\nENDTABLE', profile_content, re.DOTALL).group(1)
    log_entry = re.search(r'LOG_ENTRY (.+?)\n', profile_content).group(1)
    
    profile_name = Path(new_profile_path).name
    
    # 构建新配置段
    new_section = f"""ENTER_PARSFILE Roads\\\\Profiles\\\\{profile_name}
#FullDataName {full_data_name}
ISIDE 1
Z_PROFILE_TABLE LINEAR_LOOP
{iside1}
ENDTABLE
ISIDE 2
Z_PROFILE_TABLE LINEAR_LOOP
{iside2}
ENDTABLE
LOG_ENTRY {log_entry}
EXIT_PARSFILE Roads\\\\Profiles\\\\{profile_name}"""
    
    # 替换
    #pattern = r'ENTER_PARSFILE Roads\\Profiles\\Profile_[a-f0-9-]+\.par\n.*?\nEXIT_PARSFILE Roads\\Profiles\\Profile_[a-f0-9-]+\.par'
    pattern = r'ENTER_PARSFILE Roads\\\\Profiles\\\\Profile_[a-f0-9-]+\.par\n.*?\nEXIT_PARSFILE Roads\\\\Profiles\\\\Profile_[a-f0-9-]+\.par'
    new_content = re.sub(pattern, new_section, original_content, flags=re.DOTALL)
    
    # 保存
    if output_path is None:
        output_path = run_all_path
    else:
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)
    
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"✅ 已更新: {output_path}")
    return str(output_path)


def replace_profile_simple(run_all_path: str, 
                            new_profile_path: str, 
                            output_path: str = None) -> str:
    """
    使用字符串直接替换（最简单可靠）
    """
    # 读取原始文件
    with open(run_all_path, 'r', encoding='utf-8') as f:
        original_content = f.read()
    
    # 读取新Profile文件
    with open(new_profile_path, 'r', encoding='utf-8') as f:
        profile_content = f.read()
    
    # 提取Profile配置段
    profile_content = re.sub(r'^PARSFILE\n', '', profile_content)
    profile_content = re.sub(r'\nEND$', '', profile_content)
    
    # 提取关键部分
    full_data_name = re.search(r'#FullDataName (.+?)\n', profile_content).group(1)
    
    iside1_match = re.search(r'ISIDE 1\nZ_PROFILE_TABLE LINEAR_LOOP\n(.*?)\nENDTABLE', profile_content, re.DOTALL)
    iside2_match = re.search(r'ISIDE 2\nZ_PROFILE_TABLE LINEAR_LOOP\n(.*?)\nENDTABLE', profile_content, re.DOTALL)
    
    iside1 = iside1_match.group(1) if iside1_match else ""
    iside2 = iside2_match.group(1) if iside2_match else ""
    
    log_entry = re.search(r'LOG_ENTRY (.+?)\n', profile_content).group(1)
    
    profile_name = Path(new_profile_path).name
    
    # 构建新配置段
    new_section = f"""ENTER_PARSFILE Roads\\Profiles\\{profile_name}
#FullDataName {full_data_name}
ISIDE 1
Z_PROFILE_TABLE LINEAR_LOOP
{iside1}
ENDTABLE
ISIDE 2
Z_PROFILE_TABLE LINEAR_LOOP
{iside2}
ENDTABLE
LOG_ENTRY {log_entry}
EXIT_PARSFILE Roads\\Profiles\\{profile_name}"""
    
    # 找到旧Profile的起始位置
    start_marker = "ENTER_PARSFILE Roads\\Profiles\\"
    end_marker = "EXIT_PARSFILE Roads\\Profiles\\"
    
    start_idx = original_content.find(start_marker)
    
    if start_idx == -1:
        # 尝试正斜杠格式
        start_marker = "ENTER_PARSFILE Roads/Profiles/"
        end_marker = "EXIT_PARSFILE Roads/Profiles/"
        start_idx = original_content.find(start_marker)
    
    if start_idx != -1:
        # 找到对应的结束位置
        end_idx = original_content.find(end_marker, start_idx)
        if end_idx != -1:
            # 找到该行的结束
            end_line_idx = original_content.find('\n', end_idx)
            if end_line_idx != -1:
                end_idx = end_line_idx + 1
            
            # 直接替换字符串
            new_content = original_content[:start_idx] + new_section + original_content[end_idx:]
            
            # 保存
            if output_path is None:
                output_path = run_all_path
            else:
                output_path = Path(output_path)
                output_path.parent.mkdir(parents=True, exist_ok=True)
            
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            
            print(f"✅ 已更新: {output_path}")
            return str(output_path)
        else:
            print("❌ 未找到结束标记")
            return None
    else:
        print("❌ 未找到起始标记")
        return None



# 使用示例
if __name__ == "__main__":
    replace_profile_simple(
        run_all_path="./Results/Run_3563bff4-4dd7-43e7-a5f6-58f9da20a0a7/Run_all.par",
        new_profile_path="./Results/Run_3563bff4-4dd7-43e7-a5f6-58f9da20a0a7/Profile_8c0a6d7f-8aef-4de3-8923-fccdfa925ce1.par",
        output_path="./Results/Run_3563bff4-4dd7-43e7-a5f6-58f9da20a0a7/Run_all_updated.par"
    )
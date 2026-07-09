#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""修改 CarSim 111.par 文件中的障碍物类型"""
import sys
import ast
from pathlib import Path

# 配置
PAR_FILE = r"C:\workspace\AutoVehcileSim\auto\Roads\AniGroup\AniRep_9cb90584-0471-4ee3-a9ef-61bd9620d05e.par"
ALL_SHAPE_DICT = {
    "Picket Fence": [
        "SPECIAL_PARSFILE Animator\\STL\\Shape_b3cad671-95d4-4698-975c-fdf0abce2d5a.par",
        "#BlueLink0 Animator: Shape File Link`Fences: Picket Fence` Environment: Props (1 of 2)` , 3D Object`Shape_b3cad671-95d4-4698-975c-fdf0abce2d5a"
    ],
    "Stone Pillar": [
        "SPECIAL_PARSFILE Animator\\STL\\Shape_8832f7d8-c97e-415b-96ac-8910a017080f.par",
        "#BlueLink0 Animator: Shape File Link`Fences: Stone Pillar` Environment: Props (1 of 2)` , 3D Object`Shape_8832f7d8-c97e-415b-96ac-8910a017080f"
    ]

}

"""
SPECIAL_PARSFILE Animator\STL\Shape_b3cad671-95d4-4698-975c-fdf0abce2d5a.par
#BlueLink0 Animator: Shape File Link`Fences: Picket Fence` Environment: Props (1 of 2)` , 3D Object`Shape_b3cad671-95d4-4698-975c-fdf0abce2d5a

SPECIAL_PARSFILE Animator\STL\Shape_779f3bdc-916c-4cf1-af00-e21db3ccca79.par
#BlueLink0 Animator: Shape File Link`Traffic Cone` Environment: Props (2 of 2)` , 3D Object`Shape_779f3bdc-916c-4cf1-af00-e21db3ccca79

SPECIAL_PARSFILE Animator\STL\Shape_8832f7d8-c97e-415b-96ac-8910a017080f.par
#BlueLink0 Animator: Shape File Link`Fences: Stone Pillar` Environment: Props (1 of 2)` , 3D Object`Shape_8832f7d8-c97e-415b-96ac-8910a017080f



"""


def update_shape(shape_name):
    """更新 par 文件为指定形状"""
    if shape_name not in ALL_SHAPE_DICT:
        print(f"可用形状: {', '.join(ALL_SHAPE_DICT.keys())}")
        return
    
    special_line, bluelink_line = ALL_SHAPE_DICT[shape_name]
    
    with open(PAR_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    # 直接替换特定行
    lines[51] = special_line + "\n"
    lines[52] = bluelink_line + "\n"
    
    with open(PAR_FILE, 'w', encoding='utf-8') as f:
        f.writelines(lines)
    
    print(f"已更新为: {shape_name}")



def update_position(points):
    """更新 *POINTS_TABLE 到 ENDTABLE 之间的位置点"""
    with open(PAR_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    start_index = None
    end_index = None
    for index, line in enumerate(lines):
        if line.strip() == "*POINTS_TABLE":
            start_index = index
        elif start_index is not None and line.strip() == "ENDTABLE":
            end_index = index
            break

    if start_index is None or end_index is None:
        raise ValueError("未找到 *POINTS_TABLE 或 ENDTABLE")

    point_lines = []
    for point in points:
        if isinstance(point, str):
            point_lines.append(point.rstrip("\n") + "\n")
            continue

        if len(point) != 2:
            raise ValueError(f"位置数据格式错误: {point}")

        x_value, y_value = point
        point_lines.append(f"{x_value}, {y_value}\n")

    new_lines = (
        lines[: start_index + 1]
        + point_lines
        + lines[end_index:]
    )

    with open(PAR_FILE, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)

    print(f"已更新位置点: {len(point_lines)} 行")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("用法:")
        print("  - 更新形状:   python3 set_shape.py shape <形状名称>")
        print(f"    可用形状: {', '.join(ALL_SHAPE_DICT.keys())}")
        print("  - 更新位置:   python3 set_shape.py position \"[[x1,y1],[x2,y2],...]\"")
        print("  - 示例:")
        print("    python3 set_shape.py shape \"Picket Fence\"")
        print("    python3 set_shape.py position \"[[0,-2],[0,2],[10,-2],[10,2]]\"")
    elif sys.argv[1] == "shape" and len(sys.argv) >= 3:
        update_shape(sys.argv[2])
    elif sys.argv[1] == "position" and len(sys.argv) >= 3:
        try:
            points = ast.literal_eval(sys.argv[2])
            if not isinstance(points, list):
                raise ValueError("位置参数必须是一个列表")
            update_position(points)
        except Exception as e:
            print(f"解析位置参数时出错: {e}")
            print("请使用格式: \"[[x1,y1],[x2,y2],...]\"")
    else:
        print("用法:")
        print("  - 更新形状:   python3 set_shape.py shape <形状名称>")
        print(f"    可用形状: {', '.join(ALL_SHAPE_DICT.keys())}")
        print("  - 更新位置:   python3 set_shape.py position \"[[x1,y1],[x2,y2],...]\"")

    
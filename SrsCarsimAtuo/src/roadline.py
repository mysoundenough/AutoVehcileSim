"""
CarSim 道路段配置文件生成器
支持生成直线段、圆弧段、组合路段等
"""

import uuid
from pathlib import Path
from datetime import datetime
from typing import List, Tuple, Optional, Dict, Any
from dataclasses import dataclass
from enum import Enum


class SegmentType(Enum):
    """路径段类型"""
    STRAIGHT = 0      # 直线
    TABLE = 1         # 表格
    RHO = 2           # 曲率
    RADIUS = 3        # 半径
    CLOTHOID = 4      # 回旋曲线


@dataclass
class PathSegment:
    """路径段定义"""
    segment_type: SegmentType
    length: float = 0.0                    # 长度(m)
    radius: Optional[float] = None         # 半径(m) - 用于RADIUS类型
    curvature: Optional[float] = None      # 曲率(1/m) - 用于RHO类型
    arc_angle: Optional[float] = None      # 弧角(deg) - 用于RADIUS/RHO类型
    clothoid_length: Optional[float] = None # 回旋曲线长度 - 用于CLOTHOID类型
    rho_entering: Optional[float] = None    # 进入曲率 - 用于CLOTHOID
    rho_departing: Optional[float] = None   # 离开曲率 - 用于CLOTHOID


@dataclass
class RoadPathConfig:
    """道路路径配置"""
    title: str                              # 标题
    description: str                        # 描述
    category: str = "Straight"              # 类别
    path_id: int = 0                        # 路径ID
    start_station: float = 0.0              # 起始站桩(m)
    start_x: Optional[float] = None         # 起始X坐标
    start_y: Optional[float] = None         # 起始Y坐标
    start_heading: Optional[float] = None   # 起始朝向(deg)
    opt_path_loop: bool = False             # 是否环形
    opt_path_start: bool = False            # 是否设置起始坐标
    segments: List[PathSegment] = None      # 路径段列表
    
    def __post_init__(self):
        if self.segments is None:
            self.segments = []



class RoadSegGenerator:
    """
    道路段配置文件生成器
    生成类似 RoadSeg_*.par 格式的文件
    """
    
    def __init__(self, output_dir: str):
        """
        初始化生成器
        
        Args:
            output_dir: 输出目录
        """
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)
    
    def _generate_uuid(self) -> str:
        """生成UUID"""
        return str(uuid.uuid4())
    
    def _get_mix_table_row(self, segment: PathSegment) -> str:
        """生成MIXTABLE行"""
        if segment.segment_type == SegmentType.STRAIGHT:
            return f"#straight, , {segment.length}, {segment.length}, 360, deg, 0.01, 90, deg, 400"
        
        elif segment.segment_type == SegmentType.RADIUS:
            radius = segment.radius or 0
            arc_angle = segment.arc_angle or 360
            return f"#radius, , 50, {radius}, {arc_angle}, deg, 0.01, 90, deg, 400"
        
        elif segment.segment_type == SegmentType.RHO:
            curvature = segment.curvature or 0
            arc_angle = segment.arc_angle or 360
            arc_length = abs(arc_angle / 360 * 2 * 3.14159 / abs(curvature)) if curvature != 0 else 0
            return f"#curvature, , 50, {curvature:.6f}, {arc_angle}, deg, 0.01, 90, deg, 400"
        
        elif segment.segment_type == SegmentType.CLOTHOID:
            length = segment.clothoid_length or segment.length
            return f"#clothoid, , 50, 100, 90, deg, 0.01, 90, deg, {length}"
        
        else:
            return f"#straight, , 100, 100, 360, deg, 0.01, 90, deg, 400"
    
    def _get_segment_definition(self, idx: int, segment: PathSegment) -> str:
        """生成段定义"""
        lines = [f"! Segment {idx}, {segment.segment_type.name.lower()}"]
        lines.append(f"IPATHSEG {idx}")
        lines.append(f"SEGMENT_TYPE {segment.segment_type.value}")
        
        if segment.segment_type == SegmentType.STRAIGHT:
            lines.append(f"SEGMENT_LENGTH {segment.length}")
        
        elif segment.segment_type == SegmentType.RADIUS:
            lines.append(f"SEGMENT_RADIUS {segment.radius:.6f}")
            lines.append(f"SEGMENT_ARC {segment.arc_angle:.6f}")
        
        elif segment.segment_type == SegmentType.RHO:
            lines.append(f"SEGMENT_RHO {segment.curvature:.6f}")
            lines.append(f"SEGMENT_ARC {segment.arc_angle:.6f}")
        
        elif segment.segment_type == SegmentType.CLOTHOID:
            rho_enter = segment.rho_entering or 0.0
            rho_depart = segment.rho_departing or 0.0
            length = segment.clothoid_length or segment.length
            lines.append(f"SEGMENT_RHO_DS_ENTERING {rho_enter:.6f}")
            lines.append(f"SEGMENT_RHO_DS_DEPARTING {rho_depart:.6f}")
            lines.append(f"SEGMENT_LENGTH {length:.6f}")
        
        return '\n'.join(lines)
    
    def generate_straight_road(self, name: str, length: float = 100.0) -> Path:
        """
        生成直线道路配置（类似文件1）
        
        Args:
            name: 道路名称
            length: 直线长度(m)
        
        Returns:
            生成的文件路径
        """
        config = RoadPathConfig(
            title=name,
            description=f"{name} <Straight>",
            category="Straight",
            path_id=0,
            start_station=0,
            opt_path_loop=False,
            opt_path_start=False,
            segments=[
                PathSegment(
                    segment_type=SegmentType.STRAIGHT,
                    length=length
                )
            ]
        )
        return self.generate(config)
    
    def generate_circle_road(self, name: str, radius: float, 
                             arc_angle: float = 360.0,
                             start_x: float = 0.0, 
                             start_y: float = None) -> Path:
        """
        生成圆形道路配置（类似文件2）
        
        Args:
            name: 道路名称
            radius: 半径(m)
            arc_angle: 弧角(deg)
            start_x: 起始X坐标
            start_y: 起始Y坐标
        
        Returns:
            生成的文件路径
        """
        if start_y is None:
            start_y = -radius

        config = RoadPathConfig(
            title=name,
            description=f"{name} <Circles>",
            category="Circles",
            path_id=1000,
            start_station=0,
            start_x=start_x,
            start_y=start_y,
            start_heading=0,
            opt_path_loop=True,
            opt_path_start=True,
            segments=[
                PathSegment(
                    segment_type=SegmentType.RADIUS,
                    radius=radius,
                    arc_angle=arc_angle
                )
            ]
        )
        return self.generate(config)
    
    def generate_turn_road(self, name: str, straight_length: float = 50.0,
                           radius: float = 10.186, arc_angle: float = 90.0,
                           start_x: float = 0.0, start_y: float = 60.186,
                           start_heading: float = -90) -> Path:
        """
        生成转弯道路配置（类似文件3）
        
        Args:
            name: 道路名称
            straight_length: 直线段长度
            radius: 转弯半径
            arc_angle: 转弯角度
            start_x: 起始X坐标
            start_y: 起始Y坐标
            start_heading: 起始朝向
        
        Returns:
            生成的文件路径
        """
        config = RoadPathConfig(
            title=name,
            description=f"{name} <Crossing with Curbs>",
            category="Crossing with Curbs",
            path_id=1014,
            start_station=58,
            start_x=start_x,
            start_y=start_y,
            start_heading=start_heading,
            opt_path_loop=False,
            opt_path_start=True,
            segments=[
                PathSegment(segment_type=SegmentType.STRAIGHT, length=straight_length),
                PathSegment(segment_type=SegmentType.RADIUS, radius=radius, arc_angle=arc_angle),
                PathSegment(segment_type=SegmentType.STRAIGHT, length=straight_length),
            ]
        )
        return self.generate(config)
    
    def generate_s_turn_road(self, name: str) -> Path:
        """
        生成S型弯道配置（类似文件4）
        
        Args:
            name: 道路名称
        
        Returns:
            生成的文件路径
        """
        config = RoadPathConfig(
            title=name,
            description=f"{name} <S-Shaped Turns>",
            category="S-Shaped Turns",
            path_id=0,
            start_station=10,
            start_x=None,
            start_y=None,
            start_heading=None,
            opt_path_loop=False,
            opt_path_start=True,
            segments=[
                # 直线段
                PathSegment(segment_type=SegmentType.STRAIGHT, length=50),
                # 回旋曲线进入
                PathSegment(segment_type=SegmentType.CLOTHOID, clothoid_length=200,
                           rho_entering=0.0, rho_departing=0.005),
                # 恒定曲率
                PathSegment(segment_type=SegmentType.RHO, curvature=0.005, arc_angle=33.3),
                # 直线
                PathSegment(segment_type=SegmentType.STRAIGHT, length=200),
                # 回旋曲线退出
                PathSegment(segment_type=SegmentType.CLOTHOID, clothoid_length=200,
                           rho_entering=0.0, rho_departing=-0.005),
                # 反向曲率
                PathSegment(segment_type=SegmentType.RHO, curvature=-0.005, arc_angle=33.3),
                # 直线
                PathSegment(segment_type=SegmentType.STRAIGHT, length=50),
            ]
        )
        return self.generate(config)
    
    def generate(self, config: RoadPathConfig) -> Path:
        """
        生成道路段配置文件
        
        Args:
            config: 道路路径配置
        
        Returns:
            生成的文件路径
        """
        file_uuid = self._generate_uuid()
        file_name = f"RoadSeg_{file_uuid}.par"
        file_path = self.output_dir / file_name
        
        num_segments = len(config.segments)
        
        # 生成MIXTABLE行
        mix_rows = []
        for seg in config.segments:
            mix_rows.append(self._get_mix_table_row(seg))
        mix_table = '\n'.join(mix_rows)
        
        # 生成段定义
        segment_defs = []
        for idx, seg in enumerate(config.segments, 1):
            segment_defs.append(self._get_segment_definition(idx, seg))
        segment_defs_str = '\n\n'.join(segment_defs)
        
        # 生成起始坐标和朝向部分
        start_coords = ""
        if config.opt_path_start and config.start_x is not None and config.start_y is not None:
            start_coords = f"""
X_PATH_START {config.start_x}
Y_PATH_START {config.start_y}"""
            if config.start_heading is not None:
                start_coords += f"""
HEADING_START {config.start_heading}"""
        
        # 生成文件内容
        content = f"""PARSFILE
#FullDataName Path: Segment Builder`{config.title}`{config.category}
#RingCtrl0 {1 if len(config.segments) == 1 else 2}
SET_IPATH_FOR_ID {config.path_id}
#CheckBox0 {1 if config.opt_path_start else 0}    
OPT_PATH_START {1 if config.opt_path_start else 0}
#CheckBox1 {1 if config.opt_path_loop else 0}    
OPT_PATH_LOOP {1 if config.opt_path_loop else 0}

SPATH_START {config.start_station}{start_coords}
PATH_ID_DM = PATH_ID
set_description path_id {config.title}

NSEGMENTS {num_segments}
*TABLEROWS {num_segments}

! Table Columns:
!   NOTE: Label columns are not written to parsfile.
!
! 0: (Ring) Specify the type of segment. Circular arcs can be specified using radius or curvature (inverse radius). The table option provides a link to a dataset from the X-Y Coordinates for Segment library. The clothoid option will automatically generate an X-Y table with a specified length that maintains continuity with adjacent segments (the preceding and following rows in the table).
! 1: (BlueLink) Link to a dataset from the X-Y Coordinates for Segment library.
! 2: (Text) Length of straight segment in meters.
! 3: (Label) Specify the length of a straight segment with meters.
! 4: (Text) Segment radius: use a positive radius for a left turn, negative for a right turn.
! 5: (Label) Specify radius with meters. Use a positive radius for a left turn, negative radius for a right turn.
! 6: (Text) Length of segment arc, specified with arc length (m) or central angle (deg).
! 7: (Ring) Specify arc size with central angle (deg) or arc length (m).
! 8: (Text) Segment curvature (inverse of radius, 1/m): use positive curvature for a left turn, negative for a right turn
! 9: (Label) Specify segment curvature with 1/m (inverse of radius). Use a positive number for a left turn, negative for a right turn.
! 10: (Text) Length of segment arc, specified with arc length (m) or central angle (deg).
! 11: (Ring) Specify arc size with central angle (deg) or arc length (m).
! 12: (Text) Length of clothoid segment in meters. This will automatically generate an X-Y table that has this overall length and maintains continuity with the adjacent segments (the preceding and following rows in the table).
! 13: (Label) Specify the length of a clothoid segment with meters.
#MIXTABLE0
#NUMROWS {num_segments}
{mix_table}
#ENDTABLE

{segment_defs_str}

Title {config.description}

#EMBEDDED_NOTES
#Generated by RoadSegGenerator
#END_EMBEDDED_NOTES

LOG_ENTRY Used Dataset: Path: Segment Builder; {{ {config.category} }} {config.title}
#Library : Path: Segment Builder
#DataSet : {config.title}
#Category: {config.category}
#FileID  : RoadSeg_{file_uuid}
#Created : {datetime.now().strftime('%m-%d-%Y %H:%M:%S')}
#Modified: {datetime.now().strftime('%m-%d-%Y %H:%M:%S')}
#Product : CarSim 2024.1
#DataVer : 2024.1
#VehCode Path Segment Builder

END
"""
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"✅ 生成道路段文件: {file_path}")
        print(f"   名称: {config.title}")
        print(f"   段数: {num_segments}")
        
        return file_path


# ==================== 使用示例 ====================

if __name__ == "__main__":
    output_dir = r".\Results\roads"
    generator = RoadSegGenerator(output_dir)
    
    print("="*60)
    print("CarSim 道路段配置文件生成器")
    print("="*60)
    
    # 1. 生成直线道路（类似文件1）
    print("\n1. 生成直线道路...")
    length = 150.0
    circle_name = "Straight East " + str(int(length))
    RoadSeg_file = generator.generate_straight_road(
        name="MyStraightRoad",
        length=length
        )
    print("\n2. 生成圆形道路...")
    radius = 50.0
    circle_name = str(int(radius)) + " m Radius"
    RoadSeg_file = generator.generate_circle_road(
        name=circle_name,
        radius=radius,
        arc_angle=360.0,
        start_x=0.0,
        start_y=(-1)*radius
    )
    
    # 3. 生成转弯道路（类似文件3）
    print("\n3. 生成转弯道路...")
    turn_file = generator.generate_turn_road(
        name="MyTurnRoad",
        straight_length=50.0,
        radius=15.0,
        arc_angle=90.0,
        start_x=0.0,
        start_y=60.0,
        start_heading=-90
    )
    
    # 4. 生成S型弯道（类似文件4）
    print("\n4. 生成S型弯道...")
    s_turn_file = generator.generate_s_turn_road(
        name="MySTurnRoad"
    )
    
    print("\n" + "="*60)
    print("所有文件生成完成！")
    print("="*60)
    print(f"输出目录: {output_dir}")




"""
CarSim 双移线工况配置文件生成器
生成RoadSeg（道路几何）、StrDM（驾驶员模型）等配置文件
"""

import os
import uuid
from pathlib import Path
from datetime import datetime
from typing import List, Tuple, Optional
from dataclasses import dataclass


@dataclass
class PathSegment:
    """路径段定义"""
    segment_type: int = 0  # 0: straight, 1: table, 2: rho, 3: radius, 4: cloth
    length: float = 100.0  # 长度(m)
    radius: Optional[float] = None  # 半径(m)，用于弯道


@dataclass
class LineOffsetParams:
    """双移线工况参数"""
    # 路径参数
    road_length: float = 500.0  # 道路总长度(m)
    straight_segments: List[Tuple[float, float]] = None  # (起始位置, 长度)列表
    
    # 双移线轨迹点 (station, lateral_offset)
    lane_change_points: List[Tuple[float, float]] = None
    
    # 驾驶员模型参数
    preview_time: float = 0.5  # 预瞄时间(s)
    max_steer_rate: float = 1200.0  # 最大转向角速度(deg/s)
    max_steer_angle: float = 540.0  # 最大转向角(deg)
    low_speed_threshold: float = 10.0  # 低速阈值(km/h)
    
    def __post_init__(self):
        if self.straight_segments is None:
            # 默认：100m直线 + 300m双移线区域 + 100m直线
            self.straight_segments = [(0, 100), (400, 100)]
        
        if self.lane_change_points is None:
            # 标准双移线轨迹 (S, Lateral offset)
            self.lane_change_points = [
                (70, 0.0),
                (75, 0.2),
                (80, 1.1),
                (85, 2.4),
                (90, 3.3),
                (95, 3.5),
                (100, 3.5),
                (105, 3.5),
                (110, 3.5),
                (115, 3.5),
                (120, 3.5),
                (125, 3.3),
                (130, 2.4),
                (135, 1.1),
                (140, 0.2),
                (145, 0.0),
            ]


class LineOffsetGenerator:
    """
    CarSim 双移线工况配置文件生成器
    
    生成的文件:
    1. RoadSeg_*.par - 道路几何定义
    2. RoadSeg_*_echo.par - 道路回声文件
    3. StrDM_*.par - 驾驶员模型（双移线路径）
    """
    
    def __init__(self, output_dir: str, scenario_name: str = "MyLineOffset", road_seg_name: str = None, strdm_name: str = None):
        """
        初始化生成器
        
        Args:
            output_dir: 输出目录
            scenario_name: 场景名称
        """
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)
        
        self.scenario_name = scenario_name
        if road_seg_name is None:
            self.road_seg_name = f"RoadSeg_{str(uuid.uuid4())}.par"
        else:
            self.road_seg_name = road_seg_name
        if strdm_name is None:
            self.strdm_name = f"StrDM_{str(uuid.uuid4())}.par"
        else:
            self.strdm_name = strdm_name
        self.timestamp = datetime.now()
    
    def generate_road_seg_par(self, params: LineOffsetParams) -> Path:
        """
        生成道路段配置文件 (RoadSeg_*.par)
        
        对应文件2: RoadSeg_ca4189a8-8495-400e-b06b-9c5da9e94127.par
        """
        file_name = self.road_seg_name
        file_path = self.output_dir / file_name
        
        # 计算总段数：直线段数 + 双移线曲线段
        num_straight = len(params.straight_segments)
        # 双移线区域用一个路径段表示
        
        content = f"""PARSFILE
#FullDataName Path: Segment Builder`{self.scenario_name}`Straight
#RingCtrl0 0
SET_IPATH_FOR_ID 0
#CheckBox0 0    
OPT_PATH_START 0
#CheckBox1 0    
OPT_PATH_LOOP 0

SPATH_START 0
PATH_ID_DM = PATH_ID
set_description path_id {self.scenario_name}

NSEGMENTS {num_straight + 1}
*TABLEROWS {num_straight + 1}

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
#NUMROWS {num_straight + 1}
"""
        
        # 添加直线段
        for start_pos, length in params.straight_segments:
            content += f"#straight, , {length}, {length}, 360, deg, 0.01, 90, deg, 400\n"
        
        # 添加双移线曲线段（使用table类型）
        # 计算双移线区域总长度
        lane_change_length = params.lane_change_points[-1][0] - params.lane_change_points[0][0]
        #content += f"#table, Path_{self.scenario_name}_LaneChange, {lane_change_length}, , 360, deg, 0.01, 90, deg, 400\n"
        
        content += f"""#ENDTABLE

"""
        
        # 生成各个段的详细定义
        for i, (start_pos, length) in enumerate(params.straight_segments, 1):
            content += f"""! Segment {i}, straight
IPATHSEG {i}
SEGMENT_TYPE 0
SEGMENT_LENGTH {length}

"""
        
        # 添加双移线曲线段
        segment_idx = num_straight + 1
        lane_change_length = params.lane_change_points[-1][0] - params.lane_change_points[0][0]
        content += f"""! Segment {segment_idx}, lane change curve
IPATHSEG {segment_idx}
SEGMENT_TYPE 1
SEGMENT_LENGTH {lane_change_length}
SEGMENT_TABLE_NAME Path_{self.scenario_name}_LaneChange

"""
        
        content += f"""
Title {self.scenario_name} <Double Lane Change>

#EMBEDDED_NOTES
#This double lane change path matches the S-L coordinates to global X-Y coordinates.
#Generated by LineOffsetGenerator
#END_EMBEDDED_NOTES

LOG_ENTRY Used Dataset: Path: Segment Builder; {{ {self.scenario_name} }} Straight
#Library : Path: Segment Builder
#DataSet : {self.scenario_name}
#Category: Straight
#FileID  : {file_name.replace('.par', '')}
#Created : {self.timestamp.strftime('%m-%d-%Y %H:%M:%S')}
#Modified: {self.timestamp.strftime('%m-%d-%Y %H:%M:%S')}
#Product : CarSim 2024.1
#DataVer : 2024.1
#VehCode Path Segment Builder

END
"""
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"✅ 生成道路段文件: {file_path}")
        return file_path
    
    def generate_road_seg_echo_par(self, params: LineOffsetParams) -> Path:
        """
        生成道路回声配置文件 (RoadSeg_*_echo.par)
        
        对应文件1: RoadSeg_ca4189a8-8495-400e-b06b-9c5da9e94127_echo.par
        """
        file_name = self.road_seg_name.replace('.par', '_echo.par')
        file_path = self.output_dir / file_name
        
        # 计算总段数
        num_straight = len(params.straight_segments)
        total_length = sum(length for _, length in params.straight_segments)
        lane_change_length = params.lane_change_points[-1][0] - params.lane_change_points[0][0]
        total_length += lane_change_length
        
        content = f"""PARSFILE
! VS Road Calculator
! Utility to calculate road and path coordinates for visualization
! Revision 222209, March 18, 2024

TITLE {self.scenario_name} <{self.scenario_name}>

! Echo: Roads\BuilderSegment\{file_name}
! This run was made {self.timestamp.strftime('%H:%M')} on {self.timestamp.strftime('%b %d, %Y')}.

!------------------------------------------------------------------------------------
! SYSTEM PARAMETERS (SIMULATION OPTIONS)
!------------------------------------------------------------------------------------
! [I] indicates that changing the parameter via an Event triggers an initialization.
! [L] indicates that the parameter is locked once the simulation starts.

ID_EVENT            0 ; - ! ID number that can be assigned to the current event
ID_RUN              0 ; - ! ID number that can be assigned to a simulation run
OPT_ALL_WRITE       0 ! Write all outputs to file? 1 -> all, 0 -> only activated
                      ! outputs
OPT_ECHO_DEFAULT    2 ! Show values that were not set by reading from a file? 1 ->
                      ! show with [D] indicator, 0 -> show without [D], 2 -> do not
                      ! show the property at all
OPT_ERROR_DIALOG    0 ! Show pop-up dialog box if fatal error occurs: 1 -> yes
                      ! (normal use), 0 -> no (for batch runs)
OPT_WRITE           0 ; - ! Write outputs when T > TSTART_WRITE? 1 -> write, 0 ->
                      ! don't write; change this using VS Commands or Events
TSTEP            0.04 ; s ! Time step between calculations [L]
! T_DT           0.04 ; s ! CALC -- Time increment between calculations

!------------------------------------------------------------------------------------
! SYSTEM CONSTANTS
!------------------------------------------------------------------------------------

!------------------------------------------------------------------------------------
! REFERENCE PATHS
!------------------------------------------------------------------------------------
! Up to 500 reference paths may be installed to provide station-based coordinate
! systems used to define 3D road surfaces, targets for the driver model, and
! positions of moving objects. In addition to the parameters shown in this section,
! the paths may include spline X-Y tables (keyword = SEGMENT_XY_TABLE).

! NPATH             1 ! Number of installed paths available for roads, driver model,
                      ! and moving objects (read only)
DEFINE_PATHS        1 ! VS Command to install reference paths

OPT_PATH_START(1)   0 ! Set initial heading and X-Y coordinates of the path? 0 -> no
                      ! (legacy, using table data), 1 -> yes
OPT_PATH_LOOP(1)    0 ! Is this path looped? 0 -> no, 1 -> yes
SPATH_START(1)      0 ; m ! Station at the start of this path

NSEGMENTS(1)        {num_straight + 1} ! Number of segments in this path
"""
        
        # 添加各个段的类型和长度
        seg_idx = 1
        for start_pos, length in params.straight_segments:
            content += f"""SEGMENT_TYPE(1,{seg_idx})   0 ! 0 -> straight, 1 -> table, 2 -> rho, 3 -> radius, 4 -> cloth
SEGMENT_LENGTH(1,{seg_idx}) {length} ; m ! Segment length
! S_SEGMENT_END(1,{seg_idx}) {start_pos + length} ; m ! CALC -- Station at end of this segment
"""
            seg_idx += 1
        
        # 双移线曲线段
        lane_change_start = params.lane_change_points[0][0]
        lane_change_end = params.lane_change_points[-1][0]
        content += f"""SEGMENT_TYPE(1,{seg_idx})   1 ! 0 -> straight, 1 -> table, 2 -> rho, 3 -> radius, 4 -> cloth
SEGMENT_LENGTH(1,{seg_idx}) {lane_change_end - lane_change_start} ; m ! Segment length
! S_SEGMENT_END(1,{seg_idx}) {lane_change_end} ; m ! CALC -- Station at end of this segment
"""
        
        content += f"""
!------------------------------------------------------------------------------------
! ROAD SURFACES
!------------------------------------------------------------------------------------
! Road surfaces define elevation Z and friction MU as functions of global X and Y
! coordinates, using a station-based coordinate system defined with a Reference
! Path. Up to 200 surfaces may be installed to represent sections, intersections,
! multiple lanes, etc. The Z, MU, and RR_SURF values for a road surface are
! provided with Configurable Functions MU_ROAD, ROAD_DZ, RR_SURF, and ROAD_ZS.
! Boundaries that control automatic switching from one road surface to another make
! use of the Configurable Functions ROAD_L_BOUNDARY, ROAD_NEW_ID, and ROAD_NEW_S.

! NROAD             1 ! Number of installed road surfaces (read only)
DEFINE_ROADS        1 ! VS Command to define road surfaces
CURRENT_ROAD_ID     1 ! ROAD_ID for the vehicle during initialization [I]

ROAD_PATH_ID(1)     1 ! PATH_ID of reference path used for this road [I]

!------------------------------------------------------------------------------------
! START AND STOP INFORMATION FOR PATH
!------------------------------------------------------------------------------------
PATH_ID_DM          1 ! PATH_ID of reference path for the driver and vehicle [I]
OPT_DIRECTION       1 ! Travel direction along path PATH_ID_DM: 0 -> set to 1 or -1
                      ! using SSTART and SSTOP values (legacy); 1 -> increasing
                      ! station, -1 -> decreasing station [I]

!------------------------------------------------------------------------------------
! CONFIGURABLE FUNCTIONS
!------------------------------------------------------------------------------------

! MU_ROAD: 2D function that calculates MU as a function of lateral position and
! station

! ROAD_NEW_ID: Function that calculates ID from S

! ROAD_ZS: Function that calculates elevation from station

! RR_SURF: 2D function that calculates RR_SURF as a function of lateral position and
! station


END
"""
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"✅ 生成道路回声文件: {file_path}")
        return file_path
    
    def generate_strdm_par(self, params: LineOffsetParams) -> Path:
        """
        生成驾驶员模型配置文件 (StrDM_*.par)
        
        对应文件3: StrDM_8597394d-a68f-46f7-992e-beb4bd86bc2e.par
        """
        file_name = self.strdm_name
        file_path = self.output_dir / file_name
        
        # 生成双移线轨迹点表格
        table_lines = []
        for s, lat in params.lane_change_points:
            table_lines.append(f"{s}, {lat}")
        table_text = '\n'.join(table_lines)
        
        content = f"""PARSFILE
#FullDataName Control: Steering by the Closed-loop Driver Model`{self.scenario_name}`Vehicle Dynamics Tests
SET_ILTARG_FOR_ID 0
set_description LTARG_ID {self.scenario_name}
INSTALL_DM_PATH_FOLLOWER
#CheckBox4 1    
OPT_DM 3
INSTALL_DM_IMPORTS
#RingCtrl0 0
#RingCtrl1 SPLINE_FLAT
#RingCtrl2 1
#DiagramOne0
LTARG_TABLE SPLINE_FLAT
{table_text}
ENDTABLE
#RadioCtrl0 0    

SET_PATH_WIDTH 0.1
SET_PATH_DASH_INTERVAL 0.5
SET_PATH_VERTEX_INTERVAL 1
SET_PATH_DZ 0.03
SET_PATH_COLOR 0.4 0.4 1
#CheckBox2 0    
#CheckBox3 1    
LTARG_ID_DM LTARG_ID
#CheckBox0 0    
#CheckBox1 1    
CREATE_PATH_OBJ on
#CheckBox5 0    
OPT_STR_BY_TRQ 0
AV_SW_MAX_DM {params.max_steer_rate}
A_SW_MAX_DM {params.max_steer_angle}
*TPREV {params.preview_time}
*GAIN 0
VLOW_DM {params.low_speed_threshold}
TPREV_CONSTANT {params.preview_time}

#EMBEDDED_NOTES
#This Double Lane Change path is generated by LineOffsetGenerator.
#
#The preview time of {params.preview_time}s is a compromise between following a path closely (shorter time means more aggressive steering to follow the path in front of the vehicle) and remaining stable (longer time means less sensitivity to abrupt changes in the path).
#
#The target path is shown with a dashed line generated for the animator.
#END_EMBEDDED_NOTES

LOG_ENTRY Used Dataset: Control: Steering by the Closed-loop Driver Model; {{ Vehicle Dynamics Tests }} {self.scenario_name}
#Library : Control: Steering by the Closed-loop Driver Model
#DataSet : {self.scenario_name}
#Category: Vehicle Dynamics Tests
#FileID  : {file_name.replace('.par', '')}
#Modified: {self.timestamp.strftime('%m-%d-%Y %H:%M:%S')}
#Product : CarSim 2024.1
#DataVer : 2024.1
#VehCode Driver Path Follower

END
"""
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"✅ 生成驾驶员模型文件: {file_path}")
        return file_path
    
    def generate_all(self, params: Optional[LineOffsetParams] = None) -> dict:
        """
        生成所有配置文件
        
        Args:
            params: 双移线工况参数，如果为None则使用默认值
            
        Returns:
            生成的文件路径字典
        """
        if params is None:
            params = LineOffsetParams()
        
        files = {
            'road_seg': self.generate_road_seg_par(params),
            'road_seg_echo': self.generate_road_seg_echo_par(params),
            'strdm': self.generate_strdm_par(params),
        }
        
        print(f"\n🎉 所有配置文件已生成到: {self.output_dir}")
        print(f"   场景名称: {self.scenario_name}")
        print(f"   文件名: {self.road_seg_name}")
        
        return files


def create_double_lane_change_simfile(output_dir: str, 
                                       scenario_name: str = "MyLineOffset",
                                       road_length: float = 500.0,
                                       preview_time: float = 0.5) -> Path:
    """
    便捷函数：创建完整的双移线工况仿真配置
    
    Args:
        output_dir: 输出目录
        scenario_name: 场景名称
        road_length: 道路总长度(m)
        preview_time: 预瞄时间(s)
    
    Returns:
        生成的sim文件路径（需要手动创建或引用生成的par文件）
    """
    
    # 自定义双移线轨迹点（可根据需要调整）
    custom_points = [
        (70, 0.0),
        (75, 0.2),
        (80, 1.1),
        (85, 2.4),
        (90, 3.3),
        (95, 3.5),
        (100, 3.5),
        (105, 3.5),
        (110, 3.5),
        (115, 3.5),
        (120, 3.5),
        (125, 3.3),
        (130, 2.4),
        (135, 1.1),
        (140, 0.2),
        (145, 0.0),
    ]
    
    params = LineOffsetParams(
        road_length=road_length,
        straight_segments=[(0, 70), (145, 355)],  # 70m前 + 355m后
        lane_change_points=custom_points,
        preview_time=preview_time,
        max_steer_rate=1200.0,
        max_steer_angle=540.0,
        low_speed_threshold=10.0
    )
    
    generator = LineOffsetGenerator(output_dir, scenario_name)
    files = generator.generate_all(params)
    
    # 可选：生成一个简单的sim文件作为主入口
    sim_file = output_dir / f"{scenario_name}.sim"
    with open(sim_file, 'w') as f:
        f.write(f"""SIMFILE

! Main Simulation File for {scenario_name}

FILEBASE {output_dir}/LastRun
INPUT {files['road_seg'].name}
ECHO {output_dir}/LastRun_echo.par
FINAL {output_dir}/LastRun_end.par
LOGFILE {output_dir}/LastRun_log.txt

! 参考路径和驾驶员模型
PARSFILE {files['strdm'].name}

! 车辆模型（需要根据实际情况指定）
! PARSFILE Vehicles/your_vehicle.par

! 求解器配置
DLLFILE ../Programs/solvers/carsim_64.dll

! 仿真参数
SIM_START_TIME 0.0
SIM_STOP_TIME 20.0
SIM_STEP_SIZE 0.01

! 初始速度
INITIAL_SPEED 80.0  ! km/h

! 输入/输出变量
IMPORT IMP_STEER_SW Replace 0.0! 1
IMPORT IMP_FBK_PDL Replace 0.0! 1
IMPORT IMP_THROTTLE_ENGINE Replace 0.0! 1

EXPORT XCG_TM
EXPORT YCG_TM
EXPORT Yaw
EXPORT Vx_TM
EXPORT Ax_TM

END
""")
    
    print(f"✅ 生成主仿真文件: {sim_file}")
    
    return sim_file


# ==================== 使用示例 ====================

if __name__ == "__main__":
    # 示例1: 使用默认参数生成双移线工况配置
    output_dir = "./carsim_configs"
    
    # 创建场景
    generator = LineOffsetGenerator(output_dir, "MyLineOffset", 'RoadSeg_e43ec8e3-67de-44ef-a76e-9d55b542f2ff.par', 'StrDM_8b20c1bb-4808-467b-8f2e-d78c2de7c4cd.par')
    
    # 自定义参数
    params = LineOffsetParams(
        road_length=600.0,
        straight_segments=[
            (0, 50),      # 起步段50m
            (150, 450)    # 结束段450m
        ],
        lane_change_points=[
            (50, 0.0),
            (55, 0.2),
            (60, 1.1),
            (65, 2.4),
            (70, 3.3),
            (75, 3.5),
            (80, 3.5),
            (85, 3.5),
            (90, 3.5),
            (95, 3.5),
            (100, 3.3),
            (105, 2.4),
            (110, 1.1),
            (115, 0.2),
            (120, 0.0),
        ],
        preview_time=0.5,
        max_steer_rate=1000.0,
        max_steer_angle=500.0
    )
    
    # 生成所有配置文件
    files = generator.generate_all(params)
    
    print("\n生成的配置文件:")
    for name, path in files.items():
        print(f"  {name}: {path}")
    
    # 示例2: 使用便捷函数快速创建
    # sim_file = create_double_lane_change_simfile("./my_sim", "QuickLaneChange")
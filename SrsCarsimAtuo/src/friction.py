"""
CarSim 附着系数配置文件生成器
生成Road Friction Map配置文件
"""

import uuid
from pathlib import Path
from datetime import datetime
from typing import List, Tuple, Optional
from dataclasses import dataclass


@dataclass
class FrictionMapParams:
    """附着系数地图参数"""
    # 默认摩擦系数
    default_mu: float = 0.85
    
    # 摩擦系数区域定义: [(station_start, station_end, lateral_min, lateral_max, mu), ...]
    friction_zones: List[Tuple[float, float, float, float, float]] = None
    
    # 网格精度: [station_points, lateral_points]
    grid_size: Tuple[int, int] = (4, 5)  # 行数(站柱), 列数(侧向)
    
    def __post_init__(self):
        if self.friction_zones is None:
            # 默认: 在station范围-100到400，侧向-9到9之间设置mu=0.5
            self.friction_zones = [
                (-100, 400, -9, 9, 0.5)
            ]


class CarSimFrictionMapGenerator:
    """
    CarSim 附着系数地图配置文件生成器
    
    生成 RdMu_*.par 文件，定义道路附着系数随位置变化的地图
    """
    
    def __init__(self, output_dir: str, scenario_name: str = "MyDoubleLaneChange", 
                 file_name: str = None):
        """
        初始化生成器
        
        Args:
            output_dir: 输出目录
            scenario_name: 场景名称
            file_name: 文件唯一标识符
        """
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)
        
        self.scenario_name = scenario_name
        self.file_name = file_name
        self.timestamp = datetime.now()
    
    def generate_friction_map_par(self, params: Optional[FrictionMapParams] = None) -> Path:
        """
        生成附着系数配置文件 (RdMu_*.par)
        
        Args:
            params: 附着系数地图参数，如果为None则使用默认值
            
        Returns:
            生成的文件路径
        """
        if params is None:
            params = FrictionMapParams()
        
        # 计算3D数据的点
        # 站柱(S)方向点: 包括各区域的边界
        station_points = self._get_station_points(params)
        lateral_points = self._get_lateral_points(params)
        
        # 构建数据表
        table_rows = self._build_mu_table(station_points, lateral_points, params)
        
        file_name = f"{self.file_name}"
        file_path = self.output_dir / file_name
        
        # 构建描述字符串
        description = self._build_description(params)
        
        content = f"""PARSFILE
#FullDataName Road: Friction Map, S-L Grid`{self.scenario_name}`{description}
#CheckBox0 0    

#RingCtrl0 2D_STEP
#RadioCtrl0 0    
#RadioCtrl1 0    

*3D_XLabel Lateral coordinate (m)
*3D_YLabel Station (m)
*3D_ZLabel Friction coefficient Mu (-)

#DiagramTwo0
*3D_DATA {len(lateral_points)}, {len(station_points)} ! columns x rows
MU_ROAD_CARPET 2D_STEP
{self._format_header(lateral_points)}
{table_rows}
ENDTABLE

*SCALAR {params.default_mu}


#EMBEDDED_NOTES
{self._format_notes(params)}
#END_EMBEDDED_NOTES

LOG_ENTRY Used Dataset: Road: Friction Map, S-L Grid; {{ {self.scenario_name} }} {description}
#Library : Road: Friction Map, S-L Grid
#DataSet : {description}
#Category: {self.scenario_name}
#FileID  : {self.file_name.replace('.par', '')}
#Modified: {self.timestamp.strftime('%m-%d-%Y %H:%M:%S')}
#Product : CarSim 2024.1
#DataVer : 2024.1
#VehCode Mu via S-L Grid

END
"""
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"✅ 生成附着系数配置文件: {file_path}")
        return file_path
    
    def _get_station_points(self, params: FrictionMapParams) -> List[float]:
        """获取站柱(S)方向的关键点"""
        points = set()
        
        # 添加默认边界
        points.add(-200)
        points.add(400)
        
        # 添加各摩擦区域的边界
        for s_start, s_end, _, _, _ in params.friction_zones:
            points.add(s_start)
            points.add(s_end)
        
        # 添加一些中间点使曲线更平滑
        for s_start, s_end, _, _, _ in params.friction_zones:
            mid = (s_start + s_end) / 2
            points.add(mid)
        
        return sorted(points)
    
    def _get_lateral_points(self, params: FrictionMapParams) -> List[float]:
        """获取侧向(L)方向的关键点"""
        points = set()
        
        # 添加默认边界
        points.add(-10)
        points.add(10)
        
        # 添加各摩擦区域的边界
        for _, _, l_min, l_max, _ in params.friction_zones:
            points.add(l_min)
            points.add(l_max)
        
        # 添加零点和中间点
        points.add(0)
        for _, _, l_min, l_max, _ in params.friction_zones:
            mid = (l_min + l_max) / 2
            points.add(mid)
        
        return sorted(points)
    
    def _get_mu_at_position(self, station: float, lateral: float, 
                            params: FrictionMapParams) -> float:
        """获取指定位置的摩擦系数"""
        for s_start, s_end, l_min, l_max, mu in params.friction_zones:
            if s_start <= station <= s_end and l_min <= lateral <= l_max:
                return mu
        return params.default_mu
    
    def _build_mu_table(self, station_points: List[float], 
                        lateral_points: List[float],
                        params: FrictionMapParams) -> str:
        """构建MU数据表"""
        rows = []
        
        for station in station_points:
            row_values = []
            for lateral in lateral_points:
                mu = self._get_mu_at_position(station, lateral, params)
                row_values.append(f"{mu:.2f}")
            rows.append(", ".join(row_values))
        
        # 添加站柱值作为第一列
        result = ""
        for i, station in enumerate(station_points):
            result += f"{station:.0f}, {rows[i]}\n"
        
        return result.rstrip('\n')
    
    def _format_header(self, lateral_points: List[float]) -> str:
        """格式化表头"""
        header_parts = [f"{l:.0f}" for l in lateral_points]
        return "0, " + ", ".join(header_parts)
    
    def _build_description(self, params: FrictionMapParams) -> str:
        """构建描述字符串"""
        descriptions = []
        for s_start, s_end, l_min, l_max, mu in params.friction_zones:
            descriptions.append(f"Mu={mu} from {s_start:.0f}<S<{s_end:.0f}, {l_min:.0f}<L<{l_max:.0f}")
        
        if descriptions:
            return "; ".join(descriptions)
        return f"Default Mu={params.default_mu}"
    
    def _format_notes(self, params: FrictionMapParams) -> str:
        """格式化嵌入式注释"""
        notes = ["#Generated by CarSimFrictionMapGenerator\n#"]
        
        for s_start, s_end, l_min, l_max, mu in params.friction_zones:
            notes.append(f"#The friction is {mu} from {s_start:.0f} < s < {s_end:.0f} and {l_min:.0f} m < L < {l_max:.0f} m.\n#")
        
        notes.append(f"#Mu is {params.default_mu} everywhere else.")
        
        return '\n'.join(notes)


def create_friction_map_for_double_lane_change(output_dir: str, 
                                                scenario_name: str = "MyDoubleLaneChange",
                                                file_name: str = None,
                                                low_mu_zone: Tuple[float, float, float, float, float] = None) -> Path:
    """
    为双移线工况创建附着系数配置文件
    
    Args:
        output_dir: 输出目录
        scenario_name: 场景名称
        file_name: 文件名
        low_mu_zone: 低附着区域定义 (s_start, s_end, l_min, l_max, mu)
    
    Returns:
        生成的文件路径
    """
    if low_mu_zone is None:
        # 默认: 在双移线区域设置低附着系数0.5
        low_mu_zone = (50, 150, -9, 9, 0.5)
    
    params = FrictionMapParams(
        default_mu=0.85,
        friction_zones=[low_mu_zone],
        grid_size=(6, 5)
    )
    
    generator = CarSimFrictionMapGenerator(output_dir, scenario_name, file_name)
    return generator.generate_friction_map_par(params)


# ==================== 使用示例 ====================

if __name__ == "__main__":
    output_dir = "./carsim_configs"
    scenario_name = "MyDoubleLaneChange"
    file_name = "RdMu_6c13f312-d7ed-4bb3-a3fd-fea7aa273e97.par"
    
    # 示例1: 使用默认参数生成
    generator = CarSimFrictionMapGenerator(output_dir, scenario_name, file_name)
    
    # 默认参数: 在station范围-100到400，侧向-9到9之间设置mu=0.5
    params = FrictionMapParams(
        default_mu=0.85,
        friction_zones=[
            (-100, 400, -9, 9, 0.5)  # 低附着区域
        ]
    )
    
    file_path = generator.generate_friction_map_par(params)
    print(f"\n生成的配置文件: {file_path}")
    
    # 示例2: 为双移线工况创建专门的附着系数配置
    print("\n" + "="*50)
    print("为双移线工况创建附着系数配置")
    print("="*50)
    
    # 在双移线区域(70-145m)设置低附着系数0.4
    low_mu_zone = (70, 145, -9, 9, 0.4)
    
    friction_file = create_friction_map_for_double_lane_change(
        output_dir="./carsim_configs",
        scenario_name="MyDoubleLaneChange",
        file_name=None,
        low_mu_zone=low_mu_zone
    )
    
    print(f"\n生成的附着系数文件: {friction_file}")
    
    # 示例3: 多区域配置（如左低右高路面）
    print("\n" + "="*50)
    print("多区域附着系数配置（左低右高）")
    print("="*50)
    
    multi_zone_params = FrictionMapParams(
        default_mu=0.85,
        friction_zones=[
            (-200, 500, -10, -2, 0.3),   # 左侧车道低附着
            (-200, 500, 2, 10, 0.85),    # 右侧车道正常附着
        ]
    )
    
    generator2 = CarSimFrictionMapGenerator(
        output_dir="./carsim_configs", 
        scenario_name="SplitMu_LeftLow",
        file_name=file_name
    )
    multi_file = generator2.generate_friction_map_par(multi_zone_params)
    print(f"\n生成的配置文件: {multi_file}")
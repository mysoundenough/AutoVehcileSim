import pefile

# 你的DLL路径
DLL_PATH = r"C:\Carsim2024.1\Carsim2024.1_Prog\Programs\Solvers\carsim_64.dll"

# 解析DLL
pe = pefile.PE(DLL_PATH)

print("✅ carsim_64.dll 全部导出接口：")
print("=" * 60)

# 遍历导出表
for exp in pe.DIRECTORY_ENTRY_EXPORT.symbols:
    if exp.name:
        func_name = exp.name.decode('utf-8')
        print(f"{func_name:<30} 地址: 0x{exp.address:X}")

print("=" * 60)
print(f"总计导出函数: {len(pe.DIRECTORY_ENTRY_EXPORT.symbols)} 个")
// Define data types and macros needed for VehicleSim software, including VS
// Math Models and tools that work with VS products.

// This file is needed to use VS API functions for examples in the SDK and 
// similar software. If you are not a developer at Mechanical Simulation, you
// should probably never modify this file.

// This file is also used at Mechanical Simulation to build many of the
// VehicleSim software tools. "Dev note" in a comment means it is applicable 
// for Mechanical Simulation developers.

// Last revision: November 9, 2023

#ifndef VS_DEFTYPES_H_
#define VS_DEFTYPES_H_

#include <stdarg.h>

#ifndef PI  // avoid conflict in NI CVI
#define PI 3.141592653589793
#endif
#define PI_HALF 1.5707963267948966
#define TERRAIN_QUERY_UNDEFINED_Z -1e30

// Floating point and boolean types
typedef double vs_real;
typedef int vs_bool;

// Three-dimensional points/vectors.
typedef struct {
    vs_real x;
    vs_real y;
    vs_real z;
} ThreeDimensionalVector;

/***
Dev note: CAUTION:

Editing these enums improperly can produce unpredictable errors in behavior.
Addition of new entries to enumerators should be done in sequence; please use
the next integer in sequence regardless of position. Please note that the next
integer in sequence may in fact not be located at the end of the enumerator.
***/

// Types of symbol objects that can be accessed with a keyword, including new
// commands. Dev note: all objects are organized into 7 general types stored in
// 6 arrays: sSysPars, sPars, sStateVars, sImpVars, sOutVars, and sIsym.
typedef enum {
  VS_KEYWORD_NULL = 100,     // keyword exists but is not used
  VS_KEYWORD_SYM = 101,      // vsSym variable with unique name
  VS_KEYWORD_ISYM = 102,     // vsIsym array for indexed parameter dimensions
  VS_KEYWORD_FUNC0 = 103,    // function or command with 0 arguments
  VS_KEYWORD_FUNC1 = 104,    // function or command with 1 argument
  VS_KEYWORD_CLOSURE = 105,  // function with hidden argument
  VS_KEYWORD_OUTVAR = 106,   // vsOutvar output variable
  VS_KEYWORD_WRT = 107,  // custom command to write an output variable to file
  VS_KEYWORD_EXP = 108,  // custom command to export an output variable
  VS_KEYWORD_ANI = 109,  // custom command to stream an output for video
  VS_KEYWORD_IMP = 110,  // custom command to activate an import variable
  VS_KEYWORD_TAB_1D = 111,  // keywords for config options of a unique table
  VS_KEYWORD_TAB_2D = 112,
  VS_KEYWORD_TAB_GAIN = 113,
  VS_KEYWORD_TAB_OFFSET = 114,
  VS_KEYWORD_TAB_CONST = 115,
  VS_KEYWORD_TAB_COEF = 116,
  VS_KEYWORD_TAB_GROUP_1D = 117,  // keywords for table group
  VS_KEYWORD_TAB_GROUP_2D = 118,
  VS_KEYWORD_TAB_GROUP_GAIN = 119,
  VS_KEYWORD_TAB_GROUP_OFFSET = 120,
  VS_KEYWORD_TAB_GROUP_CONST = 121,
  VS_KEYWORD_TAB_GROUP_COEF = 122,
  VS_KEYWORD_CALC = 123,
  VS_KEYWORD_TAB_GROUP_START_XROW = 124,
  VS_KEYWORD_TAB_START_XROW = 125,
  VS_KEYWORD_TAB_GROUP_SCALE_XROW = 126,
  VS_KEYWORD_TAB_SCALE_XROW = 127,
  VS_KEYWORD_TAB_GROUP_EQ = 128,
  VS_KEYWORD_TAB_EQ = 129,
  VS_KEYWORD_TAB_GROUP_START_XCOL = 130,
  VS_KEYWORD_TAB_START_XCOL = 131,
  VS_KEYWORD_TAB_GROUP_SCALE_XCOL = 132,
  VS_KEYWORD_TAB_SCALE_XCOL = 133,
  VS_KEYWORD_TAB_GROUP_COMBINE = 134,
  VS_KEYWORD_TAB_COMBINE = 135,
  VS_KEYWORD_TAB_GROUP_ID = 136,
  VS_KEYWORD_TAB_ID = 137,
  VS_KEYWORD_DEF_FUNC_FUNC = 138,
  VS_KEYWORD_DEF_FUNC_ID = 139,
  VS_KEYWORD_LSYM = 140,
  VS_KEYWORD_TOKEN_FUNC = 141,
  VS_KEYWORD_CLOSURE_NO_ARGS = 142
} vs_keyword_type;

// Locations in calculation timeline for calling external functions (e.g.
// ext_echo, ext_calc, etc.).
typedef enum {
  VS_EXT_ECHO_TOP = 0,
  VS_EXT_ECHO_SYPARS = 1,
  VS_EXT_ECHO_PARS = 2,
  VS_EXT_ECHO_END = 3,
  VS_EXT_EQ_INIT = 4,
  VS_EXT_EQ_IN = 5,
  VS_EXT_EQ_OUT = 6,
  VS_EXT_EQ_END = 7,
  VS_EXT_EQ_PRE_INIT = 8,
  VS_EXT_EQ_INIT2 = 9,
  VS_EXT_EQ_SAVE = 10,
  VS_EXT_EQ_FULL_STEP = 11,
  VS_EXT_AFTER_READ = 12,
  VS_EXT_LOC_UNSPECIFIED = 13,
  VS_EXT_EQ_DYN = 14,
  VS_EXT_EQ_STATE = 15,
  VS_EXT_EQ_KIN = 16
} vs_ext_loc;

// Attributes that can be set for internal symbolic structures using VS API
// functions. Dev note: any new entry added here should also be installed in
// sFindGenIdType() in vs_simlibio.c
typedef enum {  // start with attributes for outputs & exports
  OUTVAR_SHORT_NAME = 0,
  OUTVAR_LONG_NAME = 1,
  OUTVAR_GEN_NAME = 2,
  OUTVAR_BODY_NAME = 3,
  OUTVAR_REAL = 4,
  OUTVAR_VALUE = 5,
  OUTVAR_UNITS = 6,
  OUTVAR_COMP = 7,
  OUTVAR_ECHO_DESC = 8,
  IMP_KEYWORD = 9,
  IMP_UNITS = 10,
  IMP_DESC = 11,
  IMP_COMP = 12,
  IMP_NATIVE = 13,
  IMP_REAL = 14,
  IMP_VISIBLE = 15,
  SV_UNITS = 16,
  SV_DERIVATIVE = 17,  // state variable derivative
  ISYM_KEYWORD = 18,
  ISYM_DIMENSIONS = 19,
  ISYM_LIMIT_1 = 20,
  ISYM_LIMIT_2 = 21,
  ISYM_LIMIT_3 = 22,
  ISYM_LIMIT_4 = 23,
  ISYM_LIMIT_5 = 24,
  ISYM_INDEX_1 = 25,
  ISYM_INDEX_2 = 26,
  ISYM_INDEX_3 = 27,
  ISYM_INDEX_4 = 28,
  ISYM_INDEX_5 = 29,
  SYS_PAR_KEYWORD = 30,
  SYS_PAR_UNITS = 31,
  SYS_PAR_DESC = 32,
  SYS_PAR_REAL = 33,
  SYS_PAR_INTEGER = 34,
  SYS_PAR_VALUE = 35,
  SYS_PAR_INIT = 36,
  SYS_PAR_VISIBLE = 37,
  PAR_KEYWORD = 38,
  PAR_UNITS = 39,
  PAR_DESC = 40,
  PAR_REAL = 41,
  PAR_INTEGER = 42,
  PAR_VALUE = 43,
  PAR_INIT = 44,
  PAR_VISIBLE = 45,
  ANI_SHORT_NAME = 46,
  ANI_REAL = 47,
  ANI_REAL_SCALED = 48,  // for live ani
  OUTVAR_ERD_NAME = 49,
  OUTVAR_ERD_UNITS = 50,
  OUTVAR_EXTRA_DOC = 51,
  ANI_NAME = 52,
  // valid settings for PAR_CHECK_VALUE and SYS_PAR_CHECK_VALUE: 0 don't
  // check, -1 value is locked, 1 check for min only, 2 check for max only,
  // 3 check for both min and max
  PAR_CHECK_VALUE = 53,
  PAR_MIN_VALUE = 54,
  PAR_MAX_VALUE = 55,
  SYS_PAR_CHECK_VALUE = 56,
  SYS_PAR_MIN_VALUE = 57,
  SYS_PAR_MAX_VALUE = 58,
  ISYM_PTR_ARR = 59,
  PAR_VS_DEFINE = 60,
  IMP_WHERE = 61,
  OUTVAR_WHERE = 62,
  PAR_STRING = 63 // WIP MikeS, Nov 2023
} vs_sym_attr_type;

// general types of symbolic objects. Dev note: all live in vs_simlibio.c
typedef enum {
  UNKNOWN_TYPE = -1,  // should not occur
  OUTVAR_TYPE = 0,    // stored in sOutVars (*vsOutvar array)
  IMP_TYPE = 1,       // stored in sImpVars vsArraySyms (*vsSym array)
  SV_TYPE = 2,        // stored in sStateVars vsArraySyms (*vsSym array)
  ISYM_TYPE = 3,      // stored in sIsym (*vsIsym array)
  SYS_PAR_TYPE = 4,   // stored in sSysPars vsArraySyms (*vsSym array)
  PAR_TYPE = 5,       // stored im sPar vsArraySyms (*vsSym array)
  ANI_TYPE = 6        // stored in sOutVars (*vsOutvar array)
} vs_gen_sym_attr_type;

// Import options for use with IMP_VISIBLE. IMP_VS_* options do not affect
// Simulink. Dev note: if this enum is changed in any way, you MUST ensure that
// it stays in sync with sImpKeyType (defined in vs_simlibio.c).
typedef enum {
  IMP_IGNORE = 0,
  IMP_REPLACE = 1,
  IMP_ADD = 2,
  IMP_MULTIPLY = 3,
  IMP_USER_DEFINED = 4,
  IMP_VS_REPLACE = 5,
  IMP_VS_ADD = 6,
  IMP_VS_MULTIPLY = 7,
  IMP_AVAILABLE = 8,
} vs_import_option;

// wrapper blocks where import variablea are used or an outputs are calculated
typedef enum {
  BLK_STATE = 1,  // ODE state variables and environment (wind, objects)
  BLK_CTL = 2,    // built-in driver controls (steer, speed)
  BLK_KIN = 3,    // kinematical equations in multibody dynamics model
  BLK_DYN = 4     // dynamical equations and all that follow in the MBD model
} vs_stage;

typedef int (*status_func_t)(vs_ext_loc where, int statusCode,
                             vs_real statusValue, void* userData);

typedef int (*vlog_func_t)(int logLevel, const char* format, va_list vlist,
                           void* userData);

#endif  // end block for _VS_DEFTYPES_H

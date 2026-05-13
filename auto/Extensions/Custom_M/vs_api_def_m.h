/* This file declares many of the VS API functions in a VS Solver library that
   can be accessed from MATLAB.

   Updated Feb 2024 by Mike S. */

// Run a VS Math Model (Chapter 2, VS API manual)
int  vs_run(const char *simfile);

int    vs_error_occurred (void);
void   vs_initialize (double  t, int, int);
int    vs_integrate (double  *t, int);
double vs_setdef_and_read (const char *simfile, int, int);
int    vs_statement (const char *key, const char *buffer, int stopError);
int    vs_stop_run (void);
void   vs_terminate_run (double  t);

// extending VS Math Models with MATLAB or VB (chapter 4)
void   vs_copy_export_vars (double  *export);
void   vs_copy_io (double  *imports, double  *exports);
double vs_get_tstep (void);
int    vs_integrate_io (double  t, double  *imports, double  *exports);
void   vs_read_configuration (const char *simfile, int *n_import,
                        int *n_export, double  *tstart, double  *tstop,
                        double  *tstep);

// utility functions: conditons (chapter 5)
int    vs_during_event (void);
int    vs_opt_pause(void);

// get messages and names of things (chapter 5)
void  vs_clear_error_message (void);
void  vs_clear_output_message (void);
char *vs_get_echofile_name (void);
char *vs_get_endfile_name (void);
char *vs_get_erdfile_name (void);
char *vs_get_error_message (void);
char *vs_get_infile_name (void);
char *vs_get_logfile_name (void);
char *vs_get_output_message (void);
char *vs_get_simfile_name (void);
char *vs_get_version_model (void);
char *vs_get_version_product (void);
char *vs_get_version_vs (void);
void  vs_printf (const char *format);
void  vs_printf_error (const char *format);

// functions for interacting with the VS math model (chapter 7)
int vs_define_imp_where(char *keyword, double *real, char *units, int native,
            char *component, char *desc, int blk_id);
int vs_define_out_where(char* extname, char* erdname, char* longname,
       double* real, char* units, char* genname, char* bodyname, char* component,
       int blk_id);

int     vs_define_import (char *keyword, char *desc, double  *real, char *);
int     vs_define_indexed_parameter_array (char *keyword);
int     vs_define_output (char *shortname, char *longname, double  *real, char *);
int     vs_define_parameter (char *keyword, char *desc, double  *, char *);
int     vs_define_parameter_int (char *keyword, char *desc, int *);
void    vs_define_units (char *desc, double  gain);
int     vs_define_variable (char *keyword, char *desc, double  *);
int     vs_get_sym_attribute (int id, int type, void **att);
int     vs_get_var_id (char *keyword, int *type);
double *vs_get_var_ptr (char *keyword);
int    *vs_get_var_ptr_int (char *keyword);
int     vs_have_keyword_in_database (char *keyword);
double  vs_import_result (int id, double  native);
void    vs_install_calc_func (char *name, void *func); // obsolete
int     vs_install_keyword_alias (char *existing, char *alias);
void    vs_install_symbolic_func (char *name, void *func, int n_args);
void    vs_read_next_line (char *buffer, int n);
void    vs_set_stop_run (double  stop_gt_0, const char *format);
int     vs_set_sym_attribute (int id, int type, const void *att);
int     vs_set_sym_int (int id, int dataType, int value);
int     vs_set_sym_real (int id, int dataType, double  value);
void    vs_set_units (char *var_keyword, char *units_keyword);
char   *vs_string_copy_internal (char **target, char *source);
void    vs_write_f_to_echo_file (char *key, double  , char *doc);
void    vs_write_header_to_echo_file (char *buffer);
void    vs_write_i_to_echo_file (char *key, int , char *doc);
void    vs_write_to_echo_file (const char *buffer);
void    vs_write_to_logfile (int level, const char *format);

// functions to get number of export variables for sensors in Simulink
int vs_get_n_export_sensor (int *max_connections);
int vs_get_sensor_connections (double *connect);

// configurable table functions (chapter 7)
int    vs_define_table (char *root, int ntab, int ninst);
double vs_table_calc (int index, double xcol, double x, int itab, int inst);
int    vs_table_index (char *name);
int    vs_table_ntab (int index);
int    vs_table_ninst (int index);

// Functions the make use of user ID for paths (Table 12 in path and roads doc)
double vs_path_sstart_id(double user_id);
double vs_path_sstop_id(double user_id);
double vs_path_length_id(double user_id);
double vs_path_is_looped_id(double user_id);
double vs_path_s_id(double x, double y, double user_id, double inst);
double vs_path_l_id(double x, double y, double user_id, double inst);
double vs_path_x_id(double s, double l, double user_id, double inst);
double vs_path_y_id(double s, double l, double user_id, double inst);
double vs_path_dxds_id(double s, double l, double user_id, double inst);
double vs_path_dyds_id(double s, double l, double user_id, double inst);
double vs_path_dxdl_id(double s, double l, double user_id, double inst);
double vs_path_dydl_id(double s, double l, double user_id, double inst);
double vs_path_curv_id(double s, double l, double user_id, double inst);
double vs_path_yaw_id(double s, double path_id, double ltarg_id, double inst);

// Functions that make use of user ID for roads (Table 13 in path and roads doc)
double vs_road_sstart_id(double user_id);
double vs_road_sstop_id(double user_id);
double vs_road_length_id(double user_id);
double vs_road_is_looped_id(double user_id);
double vs_road_s_id(double x, double y, double user_id, double inst);
double vs_road_l_id(double x, double y, double user_id, double inst);
double vs_road_x_id(double s, double l, double user_id, double inst);
double vs_road_y_id(double s, double l, double user_id, double inst);
double vs_road_dxds_id(double s, double l, double user_id, double inst);
double vs_road_dyds_id(double s, double l, double user_id, double inst);
double vs_road_dxdl_id(double s, double l, double user_id, double inst);
double vs_road_dydl_id(double s, double l, double user_id, double inst);
double vs_road_curv_id(double s, double l, double user_id, double inst);
double vs_road_z_id(double s, double l, double user_id, double inst);
double vs_road_dzds_id(double s, double l, double user_id, double inst);
double vs_road_dzdl_id(double s, double l, double user_id, double inst);

// deprecated: 2D reference path properties
void  vs_get_road_start_stop(double *start, double *stop); // deprecated
double vs_path_curv_i(double s, double inst);
double vs_road_curv_i(double s, double inst);
double vs_path_l_i(double x, double y, double inst);
double vs_road_l(double x, double y);
double vs_road_l_i(double x, double y, double inst);
double vs_path_s_i(double x, double y, double inst);
double vs_road_s(double x, double y);
double vs_road_s_i(double x, double y, double inst);
double vs_path_x_i(double sy, double inst);
double vs_road_x(double s);
double vs_road_x_i(double sy, double inst);
double vs_path_x_sl_i(double s, double l, double inst);
double vs_road_x_sl_i(double s, double l, double inst);
double vs_path_y_i(double s, double inst);
double vs_road_y(double s);
double vs_road_y_i(double sy, double inst);
double vs_path_y_sl_i(double s, double l, double inst);
double vs_road_y_sl_i(double s, double l, double inst);
double vs_path_yaw_i(double sta, double directiony, double inst);
double vs_road_yaw(double sta, double direction);
double vs_road_yaw_i(double sta, double directiony, double inst);
double vs_s_loop(double s);
double vs_s_loop_i(double s, int i);
double vs_s_path_loop(double s);
double vs_target_heading(double s);
double vs_target_l(double s);

// moving objects and sensors (ADAS)
int  vs_define_moving_objects (int n);
int  vs_define_sensors (int n);
void vs_free_sensors_and_objects (void);

// necessary but undocumented
int  vs_get_lat_pos_of_edge (int edge, double  s, int opt_road, double  *l);
void vs_scale_export_vars (void);

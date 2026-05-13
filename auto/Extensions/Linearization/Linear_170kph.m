% MATLAB linearized CarSim 2024.1 model, calculated at t = 270.023 s.
% TITLE Root Locus (Speed Series) <Advanced: Restore State, Linearize, Gravity>
% Run was made 14:09 on March 25, 2024.

% Vehicle Configuration: I_I
% Revision 222209, March 18, 2024


% The linear equations have the form:
%     SV' = MatrixA * SV + MatrixB * IN
%     OUT = MatrixC * SV + MatrixD * IN

% All perturbations are given with internal SI units.

% -----------------------------------------------------------------------------------
% 33 STATE VARIABLES
% -----------------------------------------------------------------------------------
% SV(1) = SV_ZO: Global Z coord. of sprung-mass origin {Zo}; perturbation = 0.001
% SV(2) = SV_PITCH: Pitch of sprung mass {Pitch}; perturbation = 0.001
% SV(3) = SV_ROLL: Roll (Euler) of sprung mass {Roll_E}; perturbation = 0.001
% SV(4) = SV_SWA: Steering wheel angle; perturbation = 0.001
% SV(5) = SV_AV_SW: Steering wheel angular rate {StrAV_SW}; perturbation = 0.001
% SV(6) = SV_STR_IN_GR_A1: Steering gear input position, axle 1 {A_StrIn1}; perturbation = 0.001
% SV(7) = SV_STR_IN_DGR_A1: Steering gear input rate, axle 1; perturbation = 0.001
% SV(8) = SV_JNC_L1: Jounce movement at wheel L1; perturbation = 0.001
% SV(9) = SV_JNC_R1: Jounce movement at wheel R1; perturbation = 0.001
% SV(10) = SV_JNC_L2: Jounce movement at wheel L2; perturbation = 0.001
% SV(11) = SV_JNC_R2: Jounce movement at wheel R2; perturbation = 0.001
% SV(12) = SV_SLIP_LAT_L1: Lagged tan of lateral slip, tire L1; perturbation = 0.001
% SV(13) = SV_SLIP_LAT_R1: Lagged tan of lateral slip, tire R1; perturbation = 0.001
% SV(14) = SV_SLIP_LAT_L2: Lagged tan of lateral slip, tire L2; perturbation = 0.001
% SV(15) = SV_SLIP_LAT_R2: Lagged tan of lateral slip, tire R2; perturbation = 0.001
% SV(16) = SV_SLIP_LONG_L1: Lagged long. slip, tire L1 {KappL_L1}; perturbation = 0.001
% SV(17) = SV_SLIP_LONG_R1: Lagged long. slip, tire R1 {KappL_R1}; perturbation = 0.001
% SV(18) = SV_SLIP_LONG_L2: Lagged long. slip, tire L2 {KappL_L2}; perturbation = 0.001
% SV(19) = SV_SLIP_LONG_R2: Lagged long. slip, tire R2 {KappL_R2}; perturbation = 0.001
% SV(20) = SV_VXS: Body-X speed of laden sprung-mass CG; perturbation = 0.001
% SV(21) = SV_VYS: Body-Y speed of laden sprung-mass CG; perturbation = 0.001
% SV(22) = SV_VZS: Body-Z speed of laden sprung-mass CG; perturbation = 0.001
% SV(23) = SV_AVZ: Body-Z yaw rate of sprung-mass {AVz}; perturbation = 0.001
% SV(24) = SV_AVY: Body-Y pitch rate of sprung-mass {AVy}; perturbation = 0.001
% SV(25) = SV_AVX: Body-X roll rate of sprung-mass {AVx}; perturbation = 0.001
% SV(26) = SV_JNCR_L1: Jounce rate at wheel L1; perturbation = 0.001
% SV(27) = SV_JNCR_R1: Jounce rate at wheel R1; perturbation = 0.001
% SV(28) = SV_JNCR_L2: Jounce rate at wheel L2; perturbation = 0.001
% SV(29) = SV_JNCR_R2: Jounce rate at wheel R2; perturbation = 0.001
% SV(30) = SV_AVY_L1: Spin of wheel L1 {AVy_L1}; perturbation = 0.001
% SV(31) = SV_AVY_R1: Spin of wheel R1 {AVy_R1}; perturbation = 0.001
% SV(32) = SV_AVY_L2: Spin of wheel L2 {AVy_L2}; perturbation = 0.001
% SV(33) = SV_AVY_R2: Spin of wheel R2 {AVy_R2}; perturbation = 0.001

% -----------------------------------------------------------------------------------
% 1 INPUT/CONTROL VARIABLE
% -----------------------------------------------------------------------------------
% IN(1) = IMP_STEER_SW: Steering wheel angle; perturbation = 0.001

% -----------------------------------------------------------------------------------
% 2 OUTPUT VARIABLES
% -----------------------------------------------------------------------------------
% OUT(1) = AVz; Yaw rate (body-fixed), vehicle
% OUT(2) = Ay; Lat. accel., inst. CG, vehicle

% -----------------------------------------------------------------------------------
% DEFINE MATRICES FOR LINEAR SYSTEM
% -----------------------------------------------------------------------------------
MatrixA = zeros(33, 33);

MatrixA(1,2) = -47.2222;
MatrixA(1,3) = 0.000112686;
MatrixA(1,20) = 0.00477265;
MatrixA(1,22) = 0.999989;
MatrixA(1,24) = -1.10256;
MatrixA(2,3) = -1.19127e-12;
MatrixA(2,23) = -6.30254e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 1.26285e-15;
MatrixA(3,3) = -1.13591e-11;
MatrixA(3,23) = -0.0047727;
MatrixA(3,24) = -3.00801e-18;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 3.86334e-08;
MatrixA(12,2) = 0.439125;
MatrixA(12,3) = 0.000626315;
MatrixA(12,8) = 15.9095;
MatrixA(12,12) = -88.4789;
MatrixA(12,20) = 1.46064e-12;
MatrixA(12,21) = 1.86284;
MatrixA(12,23) = 2.04618;
MatrixA(12,24) = -8.14341e-13;
MatrixA(12,25) = 1.04133;
MatrixA(12,26) = 0.140882;
MatrixA(13,1) = -3.86325e-08;
MatrixA(13,2) = -0.439125;
MatrixA(13,3) = 0.000455616;
MatrixA(13,9) = -15.9095;
MatrixA(13,13) = -87.7458;
MatrixA(13,20) = -1.4865e-12;
MatrixA(13,21) = 1.86284;
MatrixA(13,22) = -3.87781e-14;
MatrixA(13,23) = 2.04618;
MatrixA(13,24) = 8.01415e-13;
MatrixA(13,25) = 1.04133;
MatrixA(13,27) = -0.140882;
MatrixA(14,1) = 6.63124e-09;
MatrixA(14,2) = 0.176022;
MatrixA(14,3) = -2.49484e-05;
MatrixA(14,10) = -2.40757;
MatrixA(14,14) = -84.6032;
MatrixA(14,20) = 2.0811e-11;
MatrixA(14,21) = 1.78922;
MatrixA(14,22) = -1.00874e-13;
MatrixA(14,23) = -2.23996;
MatrixA(14,24) = -1.15229e-11;
MatrixA(14,25) = 0.980108;
MatrixA(14,28) = 0.289499;
MatrixA(15,1) = -6.63228e-09;
MatrixA(15,2) = -0.176022;
MatrixA(15,3) = -1.16245e-05;
MatrixA(15,11) = 2.40757;
MatrixA(15,15) = -84.6774;
MatrixA(15,20) = -2.08064e-11;
MatrixA(15,21) = 1.78922;
MatrixA(15,22) = 9.93219e-14;
MatrixA(15,23) = -2.23996;
MatrixA(15,24) = 1.15244e-11;
MatrixA(15,25) = 0.980108;
MatrixA(15,29) = -0.289499;
MatrixA(20,1) = -131.711;
MatrixA(20,2) = -128.788;
MatrixA(20,3) = -0.708663;
MatrixA(20,8) = -38.8406;
MatrixA(20,9) = -38.8406;
MatrixA(20,10) = -28.9278;
MatrixA(20,11) = -28.9278;
MatrixA(20,12) = -0.35742;
MatrixA(20,13) = 0.241587;
MatrixA(20,14) = -0.409639;
MatrixA(20,15) = 0.498226;
MatrixA(20,20) = -4.89817;
MatrixA(20,21) = -8.26795e-07;
MatrixA(20,22) = 0.023378;
MatrixA(20,23) = 3.88129e-05;
MatrixA(20,24) = 2.92181;
MatrixA(20,25) = -1.75704e-06;
MatrixA(20,26) = -0.238396;
MatrixA(20,27) = -0.238396;
MatrixA(20,28) = -0.317471;
MatrixA(20,29) = -0.317471;
MatrixA(20,30) = 0.339878;
MatrixA(20,31) = 0.339878;
MatrixA(20,32) = 0.350887;
MatrixA(20,33) = 0.350887;
MatrixA(21,1) = -5.42604e-12;
MatrixA(21,2) = -6.14938e-12;
MatrixA(21,3) = 26.766;
MatrixA(21,8) = 2.24945;
MatrixA(21,9) = -2.24945;
MatrixA(21,10) = 14.883;
MatrixA(21,11) = -14.883;
MatrixA(21,12) = -34.2281;
MatrixA(21,13) = -34.2637;
MatrixA(21,14) = -34.4628;
MatrixA(21,15) = -34.4563;
MatrixA(21,20) = 9.85593e-14;
MatrixA(21,21) = -0.108892;
MatrixA(21,22) = 1.30465e-14;
MatrixA(21,23) = -47.3367;
MatrixA(21,24) = -5.61256e-14;
MatrixA(21,25) = -0.232421;
MatrixA(21,26) = -0.56233;
MatrixA(21,27) = 0.56233;
MatrixA(21,28) = -0.145791;
MatrixA(21,29) = 0.145791;
MatrixA(21,30) = -0.00300992;
MatrixA(21,31) = 0.00300992;
MatrixA(21,32) = -0.00357383;
MatrixA(21,33) = 0.00357383;
MatrixA(22,1) = -9.21696;
MatrixA(22,2) = -24.6619;
MatrixA(22,3) = 0.0830998;
MatrixA(22,8) = 23.7514;
MatrixA(22,9) = 23.7514;
MatrixA(22,10) = 18.3834;
MatrixA(22,11) = 18.3834;
MatrixA(22,12) = 3.42963;
MatrixA(22,13) = -3.42914;
MatrixA(22,14) = 7.03589;
MatrixA(22,15) = -7.02353;
MatrixA(22,20) = -0.212711;
MatrixA(22,21) = 2.45985e-07;
MatrixA(22,22) = 0.00101523;
MatrixA(22,23) = -1.76099e-05;
MatrixA(22,24) = 47.3517;
MatrixA(22,25) = -5.12074e-06;
MatrixA(22,26) = 7.62891;
MatrixA(22,27) = 7.62891;
MatrixA(22,28) = 7.2198;
MatrixA(22,29) = 7.2198;
MatrixA(22,30) = -0.010957;
MatrixA(22,31) = -0.010957;
MatrixA(22,32) = 0.0443964;
MatrixA(22,33) = 0.0443964;
MatrixA(23,1) = 1.20424e-13;
MatrixA(23,2) = 9.56984e-12;
MatrixA(23,3) = 38.193;
MatrixA(23,8) = 28.0597;
MatrixA(23,9) = -28.0597;
MatrixA(23,10) = -0.590998;
MatrixA(23,11) = 0.590998;
MatrixA(23,12) = -33.9765;
MatrixA(23,13) = -34.0843;
MatrixA(23,14) = 41.1446;
MatrixA(23,15) = 41.1923;
MatrixA(23,20) = 5.26786e-12;
MatrixA(23,21) = -0.0452646;
MatrixA(23,22) = -1.00592e-13;
MatrixA(23,23) = -2.10176;
MatrixA(23,24) = -5.67142e-14;
MatrixA(23,25) = -0.665846;
MatrixA(23,26) = -0.0761074;
MatrixA(23,27) = 0.0761074;
MatrixA(23,28) = -0.147221;
MatrixA(23,29) = 0.147221;
MatrixA(23,30) = -0.211532;
MatrixA(23,31) = 0.211532;
MatrixA(23,32) = -0.214574;
MatrixA(23,33) = 0.214574;
MatrixA(24,1) = 23.7247;
MatrixA(24,2) = 6.15949;
MatrixA(24,3) = 0.233548;
MatrixA(24,8) = -14.1197;
MatrixA(24,9) = -14.1197;
MatrixA(24,10) = 30.9844;
MatrixA(24,11) = 30.9844;
MatrixA(24,12) = -3.67552;
MatrixA(24,13) = 3.71008;
MatrixA(24,14) = 8.91105;
MatrixA(24,15) = -8.91933;
MatrixA(24,20) = 0.889111;
MatrixA(24,21) = -9.37366e-07;
MatrixA(24,22) = -0.00424356;
MatrixA(24,23) = -2.78689e-05;
MatrixA(24,24) = -0.50439;
MatrixA(24,25) = -5.36861e-06;
MatrixA(24,26) = -8.36659;
MatrixA(24,27) = -8.36659;
MatrixA(24,28) = 9.12047;
MatrixA(24,29) = 9.12047;
MatrixA(24,30) = -0.0312523;
MatrixA(24,31) = -0.0312523;
MatrixA(24,32) = -0.0384975;
MatrixA(24,33) = -0.0384975;
MatrixA(25,1) = -7.07027e-12;
MatrixA(25,2) = -7.65489e-12;
MatrixA(25,3) = 29.7719;
MatrixA(25,8) = 84.965;
MatrixA(25,9) = -84.965;
MatrixA(25,10) = 77.1622;
MatrixA(25,11) = -77.1622;
MatrixA(25,12) = -53.3788;
MatrixA(25,13) = -53.4389;
MatrixA(25,14) = -47.1985;
MatrixA(25,15) = -47.2137;
MatrixA(25,20) = -3.76311e-13;
MatrixA(25,21) = -0.0686106;
MatrixA(25,22) = -2.8236e-13;
MatrixA(25,23) = 2.26453;
MatrixA(25,24) = 9.38862e-13;
MatrixA(25,25) = -0.150073;
MatrixA(25,26) = 14.5;
MatrixA(25,27) = -14.5;
MatrixA(25,28) = 13.7436;
MatrixA(25,29) = -13.7436;
MatrixA(25,30) = -0.0168336;
MatrixA(25,31) = 0.0168336;
MatrixA(25,32) = 0.0900468;
MatrixA(25,33) = -0.0900468;
MatrixA(26,1) = -6286.12;
MatrixA(26,2) = 33.7304;
MatrixA(26,3) = -4501.29;
MatrixA(26,8) = -7069.2;
MatrixA(26,9) = 182.376;
MatrixA(26,10) = -38.5565;
MatrixA(26,11) = 71.1418;
MatrixA(26,12) = -40.6062;
MatrixA(26,13) = 45.2016;
MatrixA(26,14) = 36.8647;
MatrixA(26,15) = 31.2383;
MatrixA(26,20) = 0.845847;
MatrixA(26,21) = 0.049096;
MatrixA(26,22) = -0.00403707;
MatrixA(26,23) = 0.0212692;
MatrixA(26,24) = -0.501657;
MatrixA(26,25) = 0.985034;
MatrixA(26,26) = -184.768;
MatrixA(26,27) = -6.53606;
MatrixA(26,28) = -6.90834;
MatrixA(26,29) = 12.6144;
MatrixA(26,30) = 0.101481;
MatrixA(26,31) = -0.0389551;
MatrixA(26,32) = -0.158849;
MatrixA(26,33) = -0.0264391;
MatrixA(27,1) = -6286.12;
MatrixA(27,2) = 33.7304;
MatrixA(27,3) = 4500.84;
MatrixA(27,8) = 182.376;
MatrixA(27,9) = -7069.2;
MatrixA(27,10) = 71.1418;
MatrixA(27,11) = -38.5565;
MatrixA(27,12) = -45.1205;
MatrixA(27,13) = 40.6301;
MatrixA(27,14) = -31.25;
MatrixA(27,15) = -36.8988;
MatrixA(27,20) = 0.845847;
MatrixA(27,21) = -0.0490985;
MatrixA(27,22) = -0.00403707;
MatrixA(27,23) = -0.0212468;
MatrixA(27,24) = -0.501657;
MatrixA(27,25) = -0.985582;
MatrixA(27,26) = -6.53606;
MatrixA(27,27) = -184.768;
MatrixA(27,28) = 12.6144;
MatrixA(27,29) = -6.90834;
MatrixA(27,30) = -0.0389551;
MatrixA(27,31) = 0.101481;
MatrixA(27,32) = -0.0264391;
MatrixA(27,33) = -0.158849;
MatrixA(28,1) = -6216.67;
MatrixA(28,2) = -14531.2;
MatrixA(28,3) = -4272.31;
MatrixA(28,8) = -69.0958;
MatrixA(28,9) = 49.2637;
MatrixA(28,10) = -6927.39;
MatrixA(28,11) = 144.137;
MatrixA(28,12) = 40.4752;
MatrixA(28,13) = 38.033;
MatrixA(28,14) = -127.322;
MatrixA(28,15) = 53.5247;
MatrixA(28,20) = 2.13805;
MatrixA(28,21) = 0.0551892;
MatrixA(28,22) = -0.0102045;
MatrixA(28,23) = -2.77071;
MatrixA(28,24) = -1.18496;
MatrixA(28,25) = -0.00431272;
MatrixA(28,26) = -7.05824;
MatrixA(28,27) = 13.0654;
MatrixA(28,28) = -176.483;
MatrixA(28,29) = -9.02415;
MatrixA(28,30) = 0.0990018;
MatrixA(28,31) = 0.0773008;
MatrixA(28,32) = -1.04113;
MatrixA(28,33) = 0.107731;
MatrixA(29,1) = -6216.67;
MatrixA(29,2) = -14531.2;
MatrixA(29,3) = 4270.42;
MatrixA(29,8) = 49.2637;
MatrixA(29,9) = -69.0958;
MatrixA(29,10) = 144.137;
MatrixA(29,11) = -6927.39;
MatrixA(29,12) = -38.0463;
MatrixA(29,13) = -40.5757;
MatrixA(29,14) = -53.5061;
MatrixA(29,15) = 127.038;
MatrixA(29,20) = 2.13805;
MatrixA(29,21) = -0.0551875;
MatrixA(29,22) = -0.0102045;
MatrixA(29,23) = 2.77112;
MatrixA(29,24) = -1.18496;
MatrixA(29,25) = 0.00390614;
MatrixA(29,26) = 13.0654;
MatrixA(29,27) = -7.05824;
MatrixA(29,28) = -9.02415;
MatrixA(29,29) = -176.483;
MatrixA(29,30) = 0.0773008;
MatrixA(29,31) = 0.0990018;
MatrixA(29,32) = 0.107731;
MatrixA(29,33) = -1.04113;
MatrixA(30,1) = 9438.2;
MatrixA(30,2) = 1.26231;
MatrixA(30,3) = 8805.34;
MatrixA(30,8) = 10997.3;
MatrixA(30,9) = -1524;
MatrixA(30,10) = -32.3431;
MatrixA(30,11) = -28.5548;
MatrixA(30,12) = 63.9324;
MatrixA(30,13) = 2.31806;
MatrixA(30,14) = -7.84683;
MatrixA(30,15) = 9.79833;
MatrixA(30,20) = 266.945;
MatrixA(30,21) = -0.428747;
MatrixA(30,22) = -1.27408;
MatrixA(30,23) = -250.988;
MatrixA(30,24) = -147.817;
MatrixA(30,25) = -1.40055;
MatrixA(30,26) = 10.3342;
MatrixA(30,27) = 7.78905;
MatrixA(30,28) = -9.36355;
MatrixA(30,29) = -8.68976;
MatrixA(30,30) = -107.067;
MatrixA(30,31) = -7.39538;
MatrixA(30,32) = 0.0342385;
MatrixA(30,33) = 0.0366708;
MatrixA(31,1) = 9438.2;
MatrixA(31,2) = 1.26231;
MatrixA(31,3) = -8648.2;
MatrixA(31,8) = -1524;
MatrixA(31,9) = 10997.3;
MatrixA(31,10) = -28.5548;
MatrixA(31,11) = -32.3431;
MatrixA(31,12) = -6.48591;
MatrixA(31,13) = -33.9099;
MatrixA(31,14) = -9.79066;
MatrixA(31,15) = 7.85421;
MatrixA(31,20) = 266.945;
MatrixA(31,21) = 0.428749;
MatrixA(31,22) = -1.27408;
MatrixA(31,23) = 250.983;
MatrixA(31,24) = -147.817;
MatrixA(31,25) = 1.40054;
MatrixA(31,26) = 7.78905;
MatrixA(31,27) = 10.3342;
MatrixA(31,28) = -8.68976;
MatrixA(31,29) = -9.36355;
MatrixA(31,30) = -7.39538;
MatrixA(31,31) = -107.067;
MatrixA(31,32) = 0.0366708;
MatrixA(31,33) = 0.0342385;
MatrixA(32,1) = -47.262;
MatrixA(32,2) = -106.513;
MatrixA(32,3) = -12.4834;
MatrixA(32,8) = 14.0802;
MatrixA(32,9) = 14.1583;
MatrixA(32,10) = -54.6054;
MatrixA(32,11) = -30.9888;
MatrixA(32,12) = 3.72742;
MatrixA(32,13) = -3.65809;
MatrixA(32,14) = -19.1116;
MatrixA(32,15) = 8.84725;
MatrixA(32,20) = 370.562;
MatrixA(32,21) = 0.0468061;
MatrixA(32,22) = -1.76862;
MatrixA(32,23) = -255.741;
MatrixA(32,24) = -205.197;
MatrixA(32,25) = -1.1936;
MatrixA(32,26) = 8.36814;
MatrixA(32,27) = 8.36526;
MatrixA(32,28) = -53.3293;
MatrixA(32,29) = -9.12267;
MatrixA(32,30) = 0.0316065;
MatrixA(32,31) = 0.0309049;
MatrixA(32,32) = -105.514;
MatrixA(32,33) = 0.0381336;
MatrixA(33,1) = -47.262;
MatrixA(33,2) = -106.513;
MatrixA(33,3) = 12.0298;
MatrixA(33,8) = 14.1583;
MatrixA(33,9) = 14.0802;
MatrixA(33,10) = -30.9888;
MatrixA(33,11) = -54.6054;
MatrixA(33,12) = 3.62371;
MatrixA(33,13) = -3.76215;
MatrixA(33,14) = -8.83905;
MatrixA(33,15) = -7.5501;
MatrixA(33,20) = 370.562;
MatrixA(33,21) = -0.0468042;
MatrixA(33,22) = -1.76862;
MatrixA(33,23) = 255.733;
MatrixA(33,24) = -205.197;
MatrixA(33,25) = 1.19361;
MatrixA(33,26) = 8.36526;
MatrixA(33,27) = 8.36814;
MatrixA(33,28) = -9.12267;
MatrixA(33,29) = -53.3293;
MatrixA(33,30) = 0.0309049;
MatrixA(33,31) = 0.0316065;
MatrixA(33,32) = 0.0381336;
MatrixA(33,33) = -105.514;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -4.12525;
MatrixB(13,1) = -4.12527;
MatrixB(20,1) = 0.000124968;
MatrixB(21,1) = 0.0359221;
MatrixB(22,1) = -3.8563e-06;
MatrixB(23,1) = 0.0295455;
MatrixB(24,1) = -3.31967e-05;
MatrixB(25,1) = 0.0555113;
MatrixB(26,1) = 1.23652;
MatrixB(27,1) = -1.23627;
MatrixB(28,1) = -0.0408205;
MatrixB(29,1) = 0.0409396;
MatrixB(30,1) = -1.54345;
MatrixB(31,1) = 1.51539;
MatrixB(32,1) = -1.10862e-05;
MatrixB(33,1) = 7.74842e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -5.8685e-12;
MatrixC(2,2) = -6.72896e-12;
MatrixC(2,3) = 3.06157;
MatrixC(2,8) = 4.96499;
MatrixC(2,9) = -4.96499;
MatrixC(2,10) = -0.578355;
MatrixC(2,11) = 0.578355;
MatrixC(2,12) = -35.9277;
MatrixC(2,13) = -35.9642;
MatrixC(2,14) = -37.2615;
MatrixC(2,15) = -37.2554;
MatrixC(2,20) = 4.38165e-14;
MatrixC(2,21) = -0.111019;
MatrixC(2,22) = -4.01095e-15;
MatrixC(2,23) = -0.00359469;
MatrixC(2,24) = -2.25136e-14;
MatrixC(2,25) = -0.00491394;
MatrixC(2,26) = 2.31826e-05;
MatrixC(2,27) = -2.31826e-05;
MatrixC(2,28) = -0.000319796;
MatrixC(2,29) = 0.000319796;
MatrixC(2,30) = -0.000967425;
MatrixC(2,31) = 0.000967425;
MatrixC(2,32) = -2.94684e-05;
MatrixC(2,33) = 2.94684e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0380673;
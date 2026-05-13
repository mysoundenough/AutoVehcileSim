% MATLAB linearized CarSim 2024.1 model, calculated at t = 210.017 s.
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

MatrixA(1,2) = -36.1111;
MatrixA(1,3) = 1.9186e-05;
MatrixA(1,20) = 0.00106261;
MatrixA(1,22) = 0.999999;
MatrixA(1,24) = -1.10057;
MatrixA(2,3) = -1.47818e-13;
MatrixA(2,23) = -2.83286e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 9.07003e-16;
MatrixA(3,3) = -3.12219e-13;
MatrixA(3,23) = -0.00106261;
MatrixA(3,24) = -3.01022e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 4.0981e-09;
MatrixA(12,2) = 0.426073;
MatrixA(12,3) = 0.00108321;
MatrixA(12,8) = 10.2861;
MatrixA(12,12) = -65.6428;
MatrixA(12,20) = 4.25091e-13;
MatrixA(12,21) = 1.80183;
MatrixA(12,22) = 2.50054e-14;
MatrixA(12,23) = 1.98125;
MatrixA(12,24) = -1.75037e-13;
MatrixA(12,25) = 0.995008;
MatrixA(12,26) = 0.105727;
MatrixA(13,1) = -4.09672e-09;
MatrixA(13,2) = -0.426073;
MatrixA(13,3) = 0.00083055;
MatrixA(13,9) = -10.2861;
MatrixA(13,13) = -64.6882;
MatrixA(13,20) = -4.00086e-13;
MatrixA(13,21) = 1.80183;
MatrixA(13,23) = 1.98125;
MatrixA(13,24) = 2.25048e-13;
MatrixA(13,25) = 0.995008;
MatrixA(13,27) = -0.105727;
MatrixA(14,1) = 8.00221e-10;
MatrixA(14,2) = 0.086637;
MatrixA(14,3) = -8.14667e-06;
MatrixA(14,10) = -1.76645;
MatrixA(14,14) = -65.397;
MatrixA(14,20) = 3.4223e-12;
MatrixA(14,21) = 1.80827;
MatrixA(14,22) = -4.70528e-15;
MatrixA(14,23) = -2.26154;
MatrixA(14,24) = -1.8876e-12;
MatrixA(14,25) = 0.994048;
MatrixA(14,28) = 0.302141;
MatrixA(15,1) = -8.01018e-10;
MatrixA(15,2) = -0.086637;
MatrixA(15,3) = -2.57592e-06;
MatrixA(15,11) = 1.76645;
MatrixA(15,15) = -65.4311;
MatrixA(15,20) = -3.42152e-12;
MatrixA(15,21) = 1.80827;
MatrixA(15,22) = 3.13685e-15;
MatrixA(15,23) = -2.26154;
MatrixA(15,24) = 1.88682e-12;
MatrixA(15,25) = 0.994048;
MatrixA(15,29) = -0.302141;
MatrixA(20,1) = -94.5306;
MatrixA(20,2) = -128.24;
MatrixA(20,3) = -0.00291759;
MatrixA(20,8) = -20.3922;
MatrixA(20,9) = -20.3922;
MatrixA(20,10) = -28.9033;
MatrixA(20,11) = -28.9033;
MatrixA(20,12) = -0.428426;
MatrixA(20,13) = 0.370981;
MatrixA(20,14) = -0.44201;
MatrixA(20,15) = 0.522638;
MatrixA(20,20) = -6.49188;
MatrixA(20,21) = -8.26189e-07;
MatrixA(20,22) = 0.00689854;
MatrixA(20,23) = 8.10026e-05;
MatrixA(20,24) = 3.60367;
MatrixA(20,25) = -1.88701e-06;
MatrixA(20,26) = -0.269691;
MatrixA(20,27) = -0.269691;
MatrixA(20,28) = -0.29709;
MatrixA(20,29) = -0.29709;
MatrixA(20,30) = 0.465839;
MatrixA(20,31) = 0.465839;
MatrixA(20,32) = 0.452775;
MatrixA(20,33) = 0.452775;
MatrixA(21,1) = -3.20316e-12;
MatrixA(21,2) = -3.81892e-12;
MatrixA(21,3) = 28.8687;
MatrixA(21,8) = 2.3817;
MatrixA(21,9) = -2.3817;
MatrixA(21,10) = 15.9252;
MatrixA(21,11) = -15.9252;
MatrixA(21,12) = -35.6276;
MatrixA(21,13) = -35.6955;
MatrixA(21,14) = -33.9799;
MatrixA(21,15) = -33.9761;
MatrixA(21,20) = -1.85759e-13;
MatrixA(21,21) = -0.0833316;
MatrixA(21,22) = -1.64294e-14;
MatrixA(21,23) = -36.2226;
MatrixA(21,24) = -4.15336e-14;
MatrixA(21,25) = -0.0436959;
MatrixA(21,26) = -0.640981;
MatrixA(21,27) = 0.640981;
MatrixA(21,28) = -0.127452;
MatrixA(21,29) = 0.127452;
MatrixA(21,30) = -0.00525313;
MatrixA(21,31) = 0.00525313;
MatrixA(21,32) = -0.00456629;
MatrixA(21,33) = 0.00456629;
MatrixA(22,1) = -11.2603;
MatrixA(22,2) = -25.7928;
MatrixA(22,3) = 0.0642515;
MatrixA(22,8) = 22.1567;
MatrixA(22,9) = 22.1567;
MatrixA(22,10) = 18.588;
MatrixA(22,11) = 18.588;
MatrixA(22,12) = 2.7971;
MatrixA(22,13) = -2.80035;
MatrixA(22,14) = 7.16421;
MatrixA(22,15) = -7.1532;
MatrixA(22,20) = -0.297769;
MatrixA(22,21) = 2.46335e-07;
MatrixA(22,22) = 0.000316422;
MatrixA(22,23) = -1.54588e-05;
MatrixA(22,24) = 36.2846;
MatrixA(22,25) = -4.53825e-06;
MatrixA(22,26) = 7.63065;
MatrixA(22,27) = 7.63065;
MatrixA(22,28) = 7.21769;
MatrixA(22,29) = 7.21769;
MatrixA(22,30) = -0.0135806;
MatrixA(22,31) = -0.0135806;
MatrixA(22,32) = 0.0583423;
MatrixA(22,33) = 0.0583423;
MatrixA(23,1) = -3.95448e-13;
MatrixA(23,2) = 4.67833e-12;
MatrixA(23,3) = 22.0153;
MatrixA(23,8) = 16.8778;
MatrixA(23,9) = -16.8778;
MatrixA(23,10) = -1.82381;
MatrixA(23,11) = 1.82381;
MatrixA(23,12) = -35.3685;
MatrixA(23,13) = -35.4735;
MatrixA(23,14) = 40.5531;
MatrixA(23,15) = 40.599;
MatrixA(23,20) = -7.3565e-12;
MatrixA(23,21) = -0.0377981;
MatrixA(23,22) = 2.89807e-15;
MatrixA(23,23) = -2.80462;
MatrixA(23,24) = 2.58383e-14;
MatrixA(23,25) = -0.505016;
MatrixA(23,26) = -0.117268;
MatrixA(23,27) = 0.117268;
MatrixA(23,28) = -0.176014;
MatrixA(23,29) = 0.176014;
MatrixA(23,30) = -0.291327;
MatrixA(23,31) = 0.291327;
MatrixA(23,32) = -0.277013;
MatrixA(23,33) = 0.277013;
MatrixA(24,1) = 13.4199;
MatrixA(24,2) = 4.82273;
MatrixA(24,3) = 0.0436235;
MatrixA(24,8) = -18.2476;
MatrixA(24,9) = -18.2476;
MatrixA(24,10) = 31.284;
MatrixA(24,11) = 31.284;
MatrixA(24,12) = -2.94617;
MatrixA(24,13) = 2.96675;
MatrixA(24,14) = 9.08144;
MatrixA(24,15) = -9.08944;
MatrixA(24,20) = 1.19607;
MatrixA(24,21) = -9.37208e-07;
MatrixA(24,22) = -0.00127099;
MatrixA(24,23) = -3.71477e-05;
MatrixA(24,24) = -0.668524;
MatrixA(24,25) = -6.5547e-06;
MatrixA(24,26) = -8.36122;
MatrixA(24,27) = -8.36122;
MatrixA(24,28) = 9.11167;
MatrixA(24,29) = 9.11167;
MatrixA(24,30) = -0.06345;
MatrixA(24,31) = -0.06345;
MatrixA(24,32) = -0.0492707;
MatrixA(24,33) = -0.0492707;
MatrixA(25,1) = -4.74621e-12;
MatrixA(25,2) = -5.1168e-12;
MatrixA(25,3) = 33.6978;
MatrixA(25,8) = 85.0991;
MatrixA(25,9) = -85.0991;
MatrixA(25,10) = 78.7186;
MatrixA(25,11) = -78.7186;
MatrixA(25,12) = -56.2303;
MatrixA(25,13) = -56.3398;
MatrixA(25,14) = -46.3544;
MatrixA(25,15) = -46.3715;
MatrixA(25,20) = 8.33311e-13;
MatrixA(25,21) = -0.0526329;
MatrixA(25,22) = -1.68341e-13;
MatrixA(25,23) = 1.93764;
MatrixA(25,24) = 1.038e-12;
MatrixA(25,25) = -0.0992967;
MatrixA(25,26) = 14.4763;
MatrixA(25,27) = -14.4763;
MatrixA(25,28) = 13.7496;
MatrixA(25,29) = -13.7496;
MatrixA(25,30) = -0.0211829;
MatrixA(25,31) = 0.0211829;
MatrixA(25,32) = 0.118717;
MatrixA(25,33) = -0.118717;
MatrixA(26,1) = -6288.43;
MatrixA(26,2) = 36.0751;
MatrixA(26,3) = -4500.26;
MatrixA(26,8) = -7047.19;
MatrixA(26,9) = 178.828;
MatrixA(26,10) = -39.2168;
MatrixA(26,11) = 71.8609;
MatrixA(26,12) = -25.1028;
MatrixA(26,13) = 44.7916;
MatrixA(26,14) = 36.1988;
MatrixA(26,15) = 30.4702;
MatrixA(26,20) = 1.09182;
MatrixA(26,21) = 0.0369988;
MatrixA(26,22) = -0.00116022;
MatrixA(26,23) = -0.0310866;
MatrixA(26,24) = -0.629126;
MatrixA(26,25) = 0.650639;
MatrixA(26,26) = -184.761;
MatrixA(26,27) = -6.58552;
MatrixA(26,28) = -6.88575;
MatrixA(26,29) = 12.5624;
MatrixA(26,30) = 0.119686;
MatrixA(26,31) = -0.0715475;
MatrixA(26,32) = -0.208899;
MatrixA(26,33) = -0.0289668;
MatrixA(27,1) = -6288.43;
MatrixA(27,2) = 36.0751;
MatrixA(27,3) = 4499.49;
MatrixA(27,8) = 178.828;
MatrixA(27,9) = -7047.19;
MatrixA(27,10) = 71.8609;
MatrixA(27,11) = -39.2168;
MatrixA(27,12) = -44.6904;
MatrixA(27,13) = 25.1354;
MatrixA(27,14) = -30.4779;
MatrixA(27,15) = -36.233;
MatrixA(27,20) = 1.09182;
MatrixA(27,21) = -0.0370014;
MatrixA(27,22) = -0.00116022;
MatrixA(27,23) = 0.0310716;
MatrixA(27,24) = -0.629126;
MatrixA(27,25) = -0.651195;
MatrixA(27,26) = -6.58552;
MatrixA(27,27) = -184.761;
MatrixA(27,28) = 12.5624;
MatrixA(27,29) = -6.88575;
MatrixA(27,30) = -0.0715475;
MatrixA(27,31) = 0.119686;
MatrixA(27,32) = -0.0289668;
MatrixA(27,33) = -0.208899;
MatrixA(28,1) = -6192.3;
MatrixA(28,2) = -14508.3;
MatrixA(28,3) = -4269.34;
MatrixA(28,8) = -60.4513;
MatrixA(28,9) = 58.1935;
MatrixA(28,10) = -6935.26;
MatrixA(28,11) = 144.641;
MatrixA(28,12) = 42.2815;
MatrixA(28,13) = 40.5119;
MatrixA(28,14) = -130.68;
MatrixA(28,15) = 53.4624;
MatrixA(28,20) = 2.63229;
MatrixA(28,21) = 0.0424946;
MatrixA(28,22) = -0.00279717;
MatrixA(28,23) = -3.51878;
MatrixA(28,24) = -1.45058;
MatrixA(28,25) = -0.00917178;
MatrixA(28,26) = -7.04874;
MatrixA(28,27) = 13.0348;
MatrixA(28,28) = -176.417;
MatrixA(28,29) = -8.98672;
MatrixA(28,30) = 0.159213;
MatrixA(28,31) = 0.133426;
MatrixA(28,32) = -1.33081;
MatrixA(28,33) = 0.141006;
MatrixA(29,1) = -6192.3;
MatrixA(29,2) = -14508.3;
MatrixA(29,3) = 4268.08;
MatrixA(29,8) = 58.1935;
MatrixA(29,9) = -60.4513;
MatrixA(29,10) = 144.641;
MatrixA(29,11) = -6935.26;
MatrixA(29,12) = -40.461;
MatrixA(29,13) = -42.391;
MatrixA(29,14) = -53.4418;
MatrixA(29,15) = 130.432;
MatrixA(29,20) = 2.63229;
MatrixA(29,21) = -0.0424929;
MatrixA(29,22) = -0.00279717;
MatrixA(29,23) = 3.51918;
MatrixA(29,24) = -1.45058;
MatrixA(29,25) = 0.00876853;
MatrixA(29,26) = 13.0348;
MatrixA(29,27) = -7.04874;
MatrixA(29,28) = -8.98672;
MatrixA(29,29) = -176.417;
MatrixA(29,30) = 0.133426;
MatrixA(29,31) = 0.159213;
MatrixA(29,32) = 0.141006;
MatrixA(29,33) = -1.33081;
MatrixA(30,1) = 5293.92;
MatrixA(30,2) = -8.76265;
MatrixA(30,3) = 4986.37;
MatrixA(30,8) = 6178.76;
MatrixA(30,9) = -860.307;
MatrixA(30,10) = -32.9419;
MatrixA(30,11) = -28.3805;
MatrixA(30,12) = 76.5597;
MatrixA(30,13) = 7.25291;
MatrixA(30,14) = -7.86349;
MatrixA(30,15) = 10.0883;
MatrixA(30,20) = 365.321;
MatrixA(30,21) = -1.07437;
MatrixA(30,22) = -0.388206;
MatrixA(30,23) = -344.203;
MatrixA(30,24) = -201.312;
MatrixA(30,25) = -0.930439;
MatrixA(30,26) = 13.1178;
MatrixA(30,27) = 7.35817;
MatrixA(30,28) = -9.40346;
MatrixA(30,29) = -8.60309;
MatrixA(30,30) = -139.656;
MatrixA(30,31) = -2.87575;
MatrixA(30,32) = 0.0428557;
MatrixA(30,33) = 0.0466169;
MatrixA(31,1) = 5293.92;
MatrixA(31,2) = -8.76265;
MatrixA(31,3) = -4986.79;
MatrixA(31,8) = -860.307;
MatrixA(31,9) = 6178.76;
MatrixA(31,10) = -28.3805;
MatrixA(31,11) = -32.9419;
MatrixA(31,12) = -9.32801;
MatrixA(31,13) = -61.6167;
MatrixA(31,14) = -10.0809;
MatrixA(31,15) = 7.87045;
MatrixA(31,20) = 365.321;
MatrixA(31,21) = 1.07437;
MatrixA(31,22) = -0.388206;
MatrixA(31,23) = 344.191;
MatrixA(31,24) = -201.312;
MatrixA(31,25) = 0.930431;
MatrixA(31,26) = 7.35817;
MatrixA(31,27) = 13.1178;
MatrixA(31,28) = -8.60309;
MatrixA(31,29) = -9.40346;
MatrixA(31,30) = -2.87575;
MatrixA(31,31) = -139.656;
MatrixA(31,32) = 0.0466169;
MatrixA(31,33) = 0.0428557;
MatrixA(32,1) = -45.4518;
MatrixA(32,2) = -115.353;
MatrixA(32,3) = -15.8013;
MatrixA(32,8) = 18.2346;
MatrixA(32,9) = 18.2606;
MatrixA(32,10) = -63.398;
MatrixA(32,11) = -31.2881;
MatrixA(32,12) = 2.98044;
MatrixA(32,13) = -2.93242;
MatrixA(32,14) = -19.4278;
MatrixA(32,15) = 9.04449;
MatrixA(32,20) = 478.192;
MatrixA(32,21) = 0.0359493;
MatrixA(32,22) = -0.508146;
MatrixA(32,23) = -329.887;
MatrixA(32,24) = -263.511;
MatrixA(32,25) = -0.330217;
MatrixA(32,26) = 8.36223;
MatrixA(32,27) = 8.36035;
MatrixA(32,28) = -65.5511;
MatrixA(32,29) = -9.1131;
MatrixA(32,30) = 0.0637601;
MatrixA(32,31) = 0.0631473;
MatrixA(32,32) = -136.163;
MatrixA(32,33) = 0.0489729;
MatrixA(33,1) = -45.4518;
MatrixA(33,2) = -115.353;
MatrixA(33,3) = 15.7289;
MatrixA(33,8) = 18.2606;
MatrixA(33,9) = 18.2346;
MatrixA(33,10) = -31.2881;
MatrixA(33,11) = -63.398;
MatrixA(33,12) = 2.91196;
MatrixA(33,13) = -3.00111;
MatrixA(33,14) = -9.03654;
MatrixA(33,15) = -4.83277;
MatrixA(33,20) = 478.192;
MatrixA(33,21) = -0.0359474;
MatrixA(33,22) = -0.508146;
MatrixA(33,23) = 329.875;
MatrixA(33,24) = -263.511;
MatrixA(33,25) = 0.33023;
MatrixA(33,26) = 8.36035;
MatrixA(33,27) = 8.36223;
MatrixA(33,28) = -9.1131;
MatrixA(33,29) = -65.5511;
MatrixA(33,30) = 0.0631473;
MatrixA(33,31) = 0.0637601;
MatrixA(33,32) = 0.0489729;
MatrixA(33,33) = -136.163;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -3.05194;
MatrixB(13,1) = -3.05195;
MatrixB(20,1) = 0.000130352;
MatrixB(21,1) = 0.0222035;
MatrixB(22,1) = -3.6022e-06;
MatrixB(23,1) = 0.0213634;
MatrixB(24,1) = -3.43657e-05;
MatrixB(25,1) = 0.0313319;
MatrixB(26,1) = 1.17465;
MatrixB(27,1) = -1.17439;
MatrixB(28,1) = -0.0231409;
MatrixB(29,1) = 0.0232642;
MatrixB(30,1) = 0.447221;
MatrixB(31,1) = -0.476384;
MatrixB(32,1) = 1.35359e-05;
MatrixB(33,1) = 5.51984e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -3.51881e-12;
MatrixC(2,2) = -4.21002e-12;
MatrixC(2,3) = 8.76127;
MatrixC(2,8) = 8.73999;
MatrixC(2,9) = -8.73999;
MatrixC(2,10) = -0.442389;
MatrixC(2,11) = 0.442389;
MatrixC(2,12) = -37.3999;
MatrixC(2,13) = -37.4708;
MatrixC(2,14) = -36.7689;
MatrixC(2,15) = -36.7658;
MatrixC(2,20) = -5.86543e-14;
MatrixC(2,21) = -0.0849293;
MatrixC(2,22) = -3.55371e-15;
MatrixC(2,23) = -0.011365;
MatrixC(2,24) = 1.84928e-14;
MatrixC(2,25) = -0.00374026;
MatrixC(2,26) = 0.000235418;
MatrixC(2,27) = -0.000235418;
MatrixC(2,28) = -0.000254606;
MatrixC(2,29) = 0.000254606;
MatrixC(2,30) = -0.00245343;
MatrixC(2,31) = 0.00245343;
MatrixC(2,32) = -2.06718e-05;
MatrixC(2,33) = 2.06718e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0223014;
% MATLAB linearized CarSim 2024.1 model, calculated at t = 165.013 s.
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

MatrixA(1,2) = -27.7778;
MatrixA(1,3) = -1.72252e-05;
MatrixA(1,20) = -0.00124022;
MatrixA(1,22) = 0.999999;
MatrixA(1,24) = -1.09933;
MatrixA(2,3) = -4.63819e-13;
MatrixA(2,23) = -1.28908e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 7.28461e-16;
MatrixA(3,3) = 1.14866e-12;
MatrixA(3,23) = 0.00124022;
MatrixA(3,24) = 1.59874e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 1.17094e-08;
MatrixA(12,2) = 0.366309;
MatrixA(12,3) = 0.00115168;
MatrixA(12,8) = 7.10434;
MatrixA(12,12) = -49.7285;
MatrixA(12,20) = 1.84407e-12;
MatrixA(12,21) = 1.77173;
MatrixA(12,22) = -4.91753e-14;
MatrixA(12,23) = 1.94941;
MatrixA(12,24) = -1.08186e-12;
MatrixA(12,25) = 0.971088;
MatrixA(12,26) = 0.0856706;
MatrixA(13,1) = -1.17083e-08;
MatrixA(13,2) = -0.366309;
MatrixA(13,3) = 0.000902565;
MatrixA(13,9) = -7.10434;
MatrixA(13,13) = -48.8456;
MatrixA(13,20) = -1.86866e-12;
MatrixA(13,21) = 1.77173;
MatrixA(13,22) = 2.45876e-14;
MatrixA(13,23) = 1.94941;
MatrixA(13,24) = 1.08186e-12;
MatrixA(13,25) = 0.971088;
MatrixA(13,27) = -0.0856706;
MatrixA(14,1) = 2.50458e-09;
MatrixA(14,2) = 0.0406215;
MatrixA(14,3) = -2.59322e-06;
MatrixA(14,10) = -1.31875;
MatrixA(14,14) = -50.6194;
MatrixA(14,20) = 1.40903e-11;
MatrixA(14,21) = 1.81936;
MatrixA(14,22) = 1.73585e-14;
MatrixA(14,23) = -2.27396;
MatrixA(14,24) = -7.74227e-12;
MatrixA(14,25) = 1.00249;
MatrixA(14,28) = 0.310478;
MatrixA(15,1) = -2.50405e-09;
MatrixA(15,2) = -0.0406215;
MatrixA(15,3) = -2.74985e-07;
MatrixA(15,11) = 1.31875;
MatrixA(15,15) = -50.6347;
MatrixA(15,20) = -1.40891e-11;
MatrixA(15,21) = 1.81936;
MatrixA(15,22) = -1.81475e-14;
MatrixA(15,23) = -2.27396;
MatrixA(15,24) = 7.74108e-12;
MatrixA(15,25) = 1.00249;
MatrixA(15,29) = -0.310478;
MatrixA(20,1) = -75.5714;
MatrixA(20,2) = -128.224;
MatrixA(20,3) = 0.00278535;
MatrixA(20,8) = -10.9701;
MatrixA(20,9) = -10.9701;
MatrixA(20,10) = -28.8809;
MatrixA(20,11) = -28.8809;
MatrixA(20,12) = -0.357303;
MatrixA(20,13) = 0.355007;
MatrixA(20,14) = -0.465244;
MatrixA(20,15) = 0.539473;
MatrixA(20,20) = -8.49996;
MatrixA(20,21) = -8.2478e-07;
MatrixA(20,22) = -0.0105423;
MatrixA(20,23) = 0.000174862;
MatrixA(20,24) = 4.62692;
MatrixA(20,25) = -1.96833e-06;
MatrixA(20,26) = -0.297381;
MatrixA(20,27) = -0.297381;
MatrixA(20,28) = -0.257409;
MatrixA(20,29) = -0.257409;
MatrixA(20,30) = 0.620848;
MatrixA(20,31) = 0.620848;
MatrixA(20,32) = 0.584098;
MatrixA(20,33) = 0.584098;
MatrixA(21,1) = -1.69848e-12;
MatrixA(21,2) = -2.496e-12;
MatrixA(21,3) = 29.9312;
MatrixA(21,8) = 2.1246;
MatrixA(21,9) = -2.1246;
MatrixA(21,10) = 16.6416;
MatrixA(21,11) = -16.6416;
MatrixA(21,12) = -36.4603;
MatrixA(21,13) = -36.5013;
MatrixA(21,14) = -33.7025;
MatrixA(21,15) = -33.7002;
MatrixA(21,20) = 7.46003e-14;
MatrixA(21,21) = -0.0641893;
MatrixA(21,22) = 6.43666e-14;
MatrixA(21,23) = -27.8932;
MatrixA(21,24) = -2.27665e-15;
MatrixA(21,25) = 0.0303791;
MatrixA(21,26) = -0.688468;
MatrixA(21,27) = 0.688468;
MatrixA(21,28) = -0.115088;
MatrixA(21,29) = 0.115088;
MatrixA(21,30) = -0.00769192;
MatrixA(21,31) = 0.00769192;
MatrixA(21,32) = -0.00584963;
MatrixA(21,33) = 0.00584963;
MatrixA(22,1) = -12.2673;
MatrixA(22,2) = -26.6155;
MatrixA(22,3) = 0.0627116;
MatrixA(22,8) = 22.3951;
MatrixA(22,9) = 22.3951;
MatrixA(22,10) = 17.5901;
MatrixA(22,11) = 17.5901;
MatrixA(22,12) = 2.3766;
MatrixA(22,13) = -2.37901;
MatrixA(22,14) = 7.25702;
MatrixA(22,15) = -7.24701;
MatrixA(22,20) = -0.403464;
MatrixA(22,21) = 2.46539e-07;
MatrixA(22,22) = -0.000500402;
MatrixA(22,23) = -1.18495e-05;
MatrixA(22,24) = 28.0067;
MatrixA(22,25) = -4.20574e-06;
MatrixA(22,26) = 7.63046;
MatrixA(22,27) = 7.63046;
MatrixA(22,28) = 7.21953;
MatrixA(22,29) = 7.21953;
MatrixA(22,30) = -0.0169802;
MatrixA(22,31) = -0.0169802;
MatrixA(22,32) = 0.076189;
MatrixA(22,33) = 0.076189;
MatrixA(23,1) = 1.12112e-12;
MatrixA(23,2) = 1.57103e-11;
MatrixA(23,3) = 13.2206;
MatrixA(23,8) = 10.91;
MatrixA(23,9) = -10.91;
MatrixA(23,10) = -2.59743;
MatrixA(23,11) = 2.59743;
MatrixA(23,12) = -36.2704;
MatrixA(23,13) = -36.3138;
MatrixA(23,14) = 40.2136;
MatrixA(23,15) = 40.2572;
MatrixA(23,20) = 4.85094e-14;
MatrixA(23,21) = -0.0331929;
MatrixA(23,22) = 6.23703e-14;
MatrixA(23,23) = -3.68608;
MatrixA(23,24) = 6.05712e-14;
MatrixA(23,25) = -0.383401;
MatrixA(23,26) = -0.136009;
MatrixA(23,27) = 0.136009;
MatrixA(23,28) = -0.209947;
MatrixA(23,29) = 0.209947;
MatrixA(23,30) = -0.389187;
MatrixA(23,31) = 0.389187;
MatrixA(23,32) = -0.357478;
MatrixA(23,33) = 0.357478;
MatrixA(24,1) = 8.06462;
MatrixA(24,2) = 3.93882;
MatrixA(24,3) = 0.0479041;
MatrixA(24,8) = -21.4458;
MatrixA(24,9) = -21.4458;
MatrixA(24,10) = 30.0639;
MatrixA(24,11) = 30.0639;
MatrixA(24,12) = -2.49717;
MatrixA(24,13) = 2.50047;
MatrixA(24,14) = 9.20448;
MatrixA(24,15) = -9.2121;
MatrixA(24,20) = 1.57696;
MatrixA(24,21) = -9.37368e-07;
MatrixA(24,22) = 0.00195587;
MatrixA(24,23) = -5.92112e-05;
MatrixA(24,24) = -0.873862;
MatrixA(24,25) = -7.29132e-06;
MatrixA(24,26) = -8.35426;
MatrixA(24,27) = -8.35426;
MatrixA(24,28) = 9.10264;
MatrixA(24,29) = 9.10264;
MatrixA(24,30) = -0.103153;
MatrixA(24,31) = -0.103153;
MatrixA(24,32) = -0.0631954;
MatrixA(24,33) = -0.0631954;
MatrixA(25,1) = -2.6079e-12;
MatrixA(25,2) = -3.42895e-12;
MatrixA(25,3) = 35.9687;
MatrixA(25,8) = 87.0328;
MatrixA(25,9) = -87.0328;
MatrixA(25,10) = 77.6032;
MatrixA(25,11) = -77.6032;
MatrixA(25,12) = -57.9737;
MatrixA(25,13) = -58.0394;
MatrixA(25,14) = -45.8532;
MatrixA(25,15) = -45.8709;
MatrixA(25,20) = 5.81011e-13;
MatrixA(25,21) = -0.0407229;
MatrixA(25,22) = 2.18413e-13;
MatrixA(25,23) = 1.75257;
MatrixA(25,24) = 1.35286e-12;
MatrixA(25,25) = -0.0701205;
MatrixA(25,26) = 14.4603;
MatrixA(25,27) = -14.4603;
MatrixA(25,28) = 13.7606;
MatrixA(25,29) = -13.7606;
MatrixA(25,30) = -0.0263957;
MatrixA(25,31) = 0.0263957;
MatrixA(25,32) = 0.155335;
MatrixA(25,33) = -0.155335;
MatrixA(26,1) = -6290.16;
MatrixA(26,2) = 37.8349;
MatrixA(26,3) = -4500.04;
MatrixA(26,8) = -7060.2;
MatrixA(26,9) = 176.169;
MatrixA(26,10) = -38.5814;
MatrixA(26,11) = 70.4082;
MatrixA(26,12) = -14.9596;
MatrixA(26,13) = 44.3993;
MatrixA(26,14) = 35.8075;
MatrixA(26,15) = 30.0042;
MatrixA(26,20) = 1.39868;
MatrixA(26,21) = 0.0290614;
MatrixA(26,22) = 0.00173478;
MatrixA(26,23) = -0.0295485;
MatrixA(26,24) = -0.790443;
MatrixA(26,25) = 0.453086;
MatrixA(26,26) = -184.727;
MatrixA(26,27) = -6.60861;
MatrixA(26,28) = -6.88454;
MatrixA(26,29) = 12.5276;
MatrixA(26,30) = 0.14306;
MatrixA(26,31) = -0.111838;
MatrixA(26,32) = -0.272712;
MatrixA(26,33) = -0.033231;
MatrixA(27,1) = -6290.16;
MatrixA(27,2) = 37.8349;
MatrixA(27,3) = 4499.3;
MatrixA(27,8) = 176.169;
MatrixA(27,9) = -7060.2;
MatrixA(27,10) = 70.4082;
MatrixA(27,11) = -38.5814;
MatrixA(27,12) = -44.3489;
MatrixA(27,13) = 14.9716;
MatrixA(27,14) = -30.0098;
MatrixA(27,15) = -35.8406;
MatrixA(27,20) = 1.39868;
MatrixA(27,21) = -0.029064;
MatrixA(27,22) = 0.00173478;
MatrixA(27,23) = 0.0294625;
MatrixA(27,24) = -0.790443;
MatrixA(27,25) = -0.453647;
MatrixA(27,26) = -6.60861;
MatrixA(27,27) = -184.727;
MatrixA(27,28) = 12.5276;
MatrixA(27,29) = -6.88454;
MatrixA(27,30) = -0.111838;
MatrixA(27,31) = 0.14306;
MatrixA(27,32) = -0.033231;
MatrixA(27,33) = -0.272712;
MatrixA(28,1) = -6178.58;
MatrixA(28,2) = -14492.5;
MatrixA(28,3) = -4267.07;
MatrixA(28,8) = -56.9735;
MatrixA(28,9) = 64.418;
MatrixA(28,10) = -6912.67;
MatrixA(28,11) = 146.378;
MatrixA(28,12) = 43.4295;
MatrixA(28,13) = 41.9428;
MatrixA(28,14) = -133.044;
MatrixA(28,15) = 53.4826;
MatrixA(28,20) = 3.30771;
MatrixA(28,21) = 0.0329093;
MatrixA(28,22) = 0.00410238;
MatrixA(28,23) = -4.51253;
MatrixA(28,24) = -1.81716;
MatrixA(28,25) = -0.00417398;
MatrixA(28,26) = -7.04608;
MatrixA(28,27) = 13.0106;
MatrixA(28,28) = -176.444;
MatrixA(28,29) = -8.9524;
MatrixA(28,30) = 0.233435;
MatrixA(28,31) = 0.202857;
MatrixA(28,32) = -1.7087;
MatrixA(28,33) = 0.183605;
MatrixA(29,1) = -6178.58;
MatrixA(29,2) = -14492.5;
MatrixA(29,3) = 4265.77;
MatrixA(29,8) = 64.418;
MatrixA(29,9) = -56.9735;
MatrixA(29,10) = 146.378;
MatrixA(29,11) = -6912.67;
MatrixA(29,12) = -41.8966;
MatrixA(29,13) = -43.4799;
MatrixA(29,14) = -53.4617;
MatrixA(29,15) = 132.821;
MatrixA(29,20) = 3.30771;
MatrixA(29,21) = -0.0329076;
MatrixA(29,22) = 0.00410238;
MatrixA(29,23) = 4.51294;
MatrixA(29,24) = -1.81716;
MatrixA(29,25) = 0.00377294;
MatrixA(29,26) = 13.0106;
MatrixA(29,27) = -7.04608;
MatrixA(29,28) = -8.9524;
MatrixA(29,29) = -176.444;
MatrixA(29,30) = 0.202857;
MatrixA(29,31) = 0.233435;
MatrixA(29,32) = 0.183605;
MatrixA(29,33) = -1.7087;
MatrixA(30,1) = 3162.52;
MatrixA(30,2) = -10.8618;
MatrixA(30,3) = 3030.01;
MatrixA(30,8) = 3700.72;
MatrixA(30,9) = -518.376;
MatrixA(30,10) = -31.8548;
MatrixA(30,11) = -26.9545;
MatrixA(30,12) = 55.5497;
MatrixA(30,13) = 7.00615;
MatrixA(30,14) = -7.89529;
MatrixA(30,15) = 10.2804;
MatrixA(30,20) = 486.562;
MatrixA(30,21) = -1.78927;
MatrixA(30,22) = 0.603473;
MatrixA(30,23) = -458.952;
MatrixA(30,24) = -267.364;
MatrixA(30,25) = -0.392989;
MatrixA(30,26) = 17.0512;
MatrixA(30,27) = 6.78253;
MatrixA(30,28) = -9.42374;
MatrixA(30,29) = -8.54752;
MatrixA(30,30) = -179.759;
MatrixA(30,31) = 2.68607;
MatrixA(30,32) = 0.0541436;
MatrixA(30,33) = 0.0595868;
MatrixA(31,1) = 3162.52;
MatrixA(31,2) = -10.8618;
MatrixA(31,3) = -3030.52;
MatrixA(31,8) = -518.376;
MatrixA(31,9) = 3700.72;
MatrixA(31,10) = -26.9545;
MatrixA(31,11) = -31.8548;
MatrixA(31,12) = -7.09565;
MatrixA(31,13) = -54.9078;
MatrixA(31,14) = -10.2732;
MatrixA(31,15) = 7.90181;
MatrixA(31,20) = 486.562;
MatrixA(31,21) = 1.78927;
MatrixA(31,22) = 0.603473;
MatrixA(31,23) = 458.926;
MatrixA(31,24) = -267.364;
MatrixA(31,25) = 0.39298;
MatrixA(31,26) = 6.78253;
MatrixA(31,27) = 17.0512;
MatrixA(31,28) = -8.54752;
MatrixA(31,29) = -9.42374;
MatrixA(31,30) = 2.68607;
MatrixA(31,31) = -179.759;
MatrixA(31,32) = 0.0595868;
MatrixA(31,33) = 0.0541436;
MatrixA(32,1) = -45.1931;
MatrixA(32,2) = -120.898;
MatrixA(32,3) = -20.1774;
MatrixA(32,8) = 21.4419;
MatrixA(32,9) = 21.4499;
MatrixA(32,10) = -67.2753;
MatrixA(32,11) = -30.0668;
MatrixA(32,12) = 2.51841;
MatrixA(32,13) = -2.47923;
MatrixA(32,14) = -19.3686;
MatrixA(32,15) = 9.1852;
MatrixA(32,20) = 616.934;
MatrixA(32,21) = 0.026867;
MatrixA(32,22) = 0.765159;
MatrixA(32,23) = -425.48;
MatrixA(32,24) = -338.996;
MatrixA(32,25) = 0.542676;
MatrixA(32,26) = 8.35487;
MatrixA(32,27) = 8.35373;
MatrixA(32,28) = -81.5104;
MatrixA(32,29) = -9.10352;
MatrixA(32,30) = 0.103404;
MatrixA(32,31) = 0.102909;
MatrixA(32,32) = -175.67;
MatrixA(32,33) = 0.0629633;
MatrixA(33,1) = -45.1931;
MatrixA(33,2) = -120.898;
MatrixA(33,3) = 18.3899;
MatrixA(33,8) = 21.4499;
MatrixA(33,9) = 21.4419;
MatrixA(33,10) = -30.0668;
MatrixA(33,11) = -67.2753;
MatrixA(33,12) = 2.47595;
MatrixA(33,13) = -2.52174;
MatrixA(33,14) = -9.17761;
MatrixA(33,15) = -2.96328;
MatrixA(33,20) = 616.934;
MatrixA(33,21) = -0.0268651;
MatrixA(33,22) = 0.765159;
MatrixA(33,23) = 425.459;
MatrixA(33,24) = -338.996;
MatrixA(33,25) = -0.542662;
MatrixA(33,26) = 8.35373;
MatrixA(33,27) = 8.35487;
MatrixA(33,28) = -9.10352;
MatrixA(33,29) = -81.5104;
MatrixA(33,30) = 0.102909;
MatrixA(33,31) = 0.103404;
MatrixA(33,32) = 0.0629633;
MatrixA(33,33) = -175.67;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -2.30872;
MatrixB(13,1) = -2.30872;
MatrixB(20,1) = 0.000133345;
MatrixB(21,1) = 0.0143957;
MatrixB(22,1) = -3.44602e-06;
MatrixB(23,1) = 0.0163941;
MatrixB(24,1) = -3.49572e-05;
MatrixB(25,1) = 0.017387;
MatrixB(26,1) = 1.13718;
MatrixB(27,1) = -1.13693;
MatrixB(28,1) = -0.012928;
MatrixB(29,1) = 0.0130535;
MatrixB(30,1) = 1.51829;
MatrixB(31,1) = -1.54807;
MatrixB(32,1) = 2.50683e-05;
MatrixB(33,1) = 4.4848e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -1.81564e-12;
MatrixC(2,2) = -3.25344e-12;
MatrixC(2,3) = 11.9116;
MatrixC(2,8) = 10.7647;
MatrixC(2,9) = -10.7647;
MatrixC(2,10) = -0.36055;
MatrixC(2,11) = 0.36055;
MatrixC(2,12) = -38.2822;
MatrixC(2,13) = -38.3253;
MatrixC(2,14) = -36.4885;
MatrixC(2,15) = -36.4869;
MatrixC(2,20) = 8.41111e-14;
MatrixC(2,21) = -0.0653781;
MatrixC(2,22) = 4.44444e-14;
MatrixC(2,23) = -0.0191191;
MatrixC(2,24) = 5.98597e-14;
MatrixC(2,25) = -0.00285491;
MatrixC(2,26) = 0.000415643;
MatrixC(2,27) = -0.000415643;
MatrixC(2,28) = -0.00020103;
MatrixC(2,29) = 0.00020103;
MatrixC(2,30) = -0.00395331;
MatrixC(2,31) = 0.00395331;
MatrixC(2,32) = -1.44863e-05;
MatrixC(2,33) = 1.44863e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0133514;
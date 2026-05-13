% MATLAB linearized CarSim 2024.1 model, calculated at t = 195.016 s.
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

MatrixA(1,2) = -33.3333;
MatrixA(1,3) = 4.48904e-06;
MatrixA(1,20) = 0.000269342;
MatrixA(1,22) = 1;
MatrixA(1,24) = -1.10015;
MatrixA(2,3) = -1.49307e-13;
MatrixA(2,23) = -3.33944e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 9.93926e-16;
MatrixA(3,3) = -7.98941e-14;
MatrixA(3,23) = -0.000269342;
MatrixA(3,24) = -8.99451e-20;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 3.98921e-09;
MatrixA(12,2) = 0.40982;
MatrixA(12,3) = 0.00113088;
MatrixA(12,8) = 9.14702;
MatrixA(12,12) = -60.2465;
MatrixA(12,20) = 4.22417e-13;
MatrixA(12,21) = 1.7905;
MatrixA(12,22) = 4.96961e-14;
MatrixA(12,23) = 1.96923;
MatrixA(12,24) = -1.73936e-13;
MatrixA(12,25) = 0.986159;
MatrixA(12,26) = 0.0985844;
MatrixA(13,1) = -3.98911e-09;
MatrixA(13,2) = -0.40982;
MatrixA(13,3) = 0.000874364;
MatrixA(13,9) = -9.14702;
MatrixA(13,13) = -59.2997;
MatrixA(13,20) = -4.22417e-13;
MatrixA(13,21) = 1.7905;
MatrixA(13,22) = -4.96961e-14;
MatrixA(13,23) = 1.96923;
MatrixA(13,24) = 1.98785e-13;
MatrixA(13,25) = 0.986159;
MatrixA(13,27) = -0.0985844;
MatrixA(14,1) = 8.06911e-10;
MatrixA(14,2) = 0.0700907;
MatrixA(14,3) = -5.89905e-06;
MatrixA(14,10) = -1.61474;
MatrixA(14,14) = -60.5021;
MatrixA(14,20) = 3.75918e-12;
MatrixA(14,21) = 1.81227;
MatrixA(14,22) = -2.35784e-15;
MatrixA(14,23) = -2.26605;
MatrixA(14,24) = -2.07097e-12;
MatrixA(14,25) = 0.997003;
MatrixA(14,28) = 0.304881;
MatrixA(15,1) = -8.06467e-10;
MatrixA(15,2) = -0.0700907;
MatrixA(15,3) = -1.56175e-06;
MatrixA(15,11) = 1.61474;
MatrixA(15,15) = -60.5293;
MatrixA(15,20) = -3.75761e-12;
MatrixA(15,21) = 1.81227;
MatrixA(15,22) = 1.57189e-15;
MatrixA(15,23) = -2.26605;
MatrixA(15,24) = 2.06783e-12;
MatrixA(15,25) = 0.997003;
MatrixA(15,29) = -0.304881;
MatrixA(20,1) = -87.4155;
MatrixA(20,2) = -128.18;
MatrixA(20,3) = -0.00144518;
MatrixA(20,8) = -16.8588;
MatrixA(20,9) = -16.8588;
MatrixA(20,10) = -28.9017;
MatrixA(20,11) = -28.9017;
MatrixA(20,12) = -0.413754;
MatrixA(20,13) = 0.377941;
MatrixA(20,14) = -0.44936;
MatrixA(20,15) = 0.527881;
MatrixA(20,20) = -7.05179;
MatrixA(20,21) = -8.25883e-07;
MatrixA(20,22) = 0.00189941;
MatrixA(20,23) = 0.000102479;
MatrixA(20,24) = 3.87974;
MatrixA(20,25) = -1.91476e-06;
MatrixA(20,26) = -0.278174;
MatrixA(20,27) = -0.278174;
MatrixA(20,28) = -0.286842;
MatrixA(20,29) = -0.286842;
MatrixA(20,30) = 0.509363;
MatrixA(20,31) = 0.509363;
MatrixA(20,32) = 0.489149;
MatrixA(20,33) = 0.489149;
MatrixA(21,1) = -2.86109e-12;
MatrixA(21,2) = -3.48798e-12;
MatrixA(21,3) = 29.2451;
MatrixA(21,8) = 2.31232;
MatrixA(21,9) = -2.31232;
MatrixA(21,10) = 16.1511;
MatrixA(21,11) = -16.1511;
MatrixA(21,12) = -35.9204;
MatrixA(21,13) = -35.9852;
MatrixA(21,14) = -33.88;
MatrixA(21,15) = -33.8768;
MatrixA(21,20) = -1.00458e-15;
MatrixA(21,21) = -0.076948;
MatrixA(21,22) = 1.03424e-14;
MatrixA(21,23) = -33.4455;
MatrixA(21,24) = 6.00549e-14;
MatrixA(21,25) = -0.0138888;
MatrixA(21,26) = -0.657673;
MatrixA(21,27) = 0.657673;
MatrixA(21,28) = -0.123508;
MatrixA(21,29) = 0.123508;
MatrixA(21,30) = -0.0059971;
MatrixA(21,31) = 0.0059971;
MatrixA(21,32) = -0.00492395;
MatrixA(21,33) = 0.00492395;
MatrixA(22,1) = -11.6228;
MatrixA(22,2) = -26.0469;
MatrixA(22,3) = 0.0635985;
MatrixA(22,8) = 21.9894;
MatrixA(22,9) = 21.9894;
MatrixA(22,10) = 18.5229;
MatrixA(22,11) = 18.5229;
MatrixA(22,12) = 2.6527;
MatrixA(22,13) = -2.6561;
MatrixA(22,14) = 7.19204;
MatrixA(22,15) = -7.18136;
MatrixA(22,20) = -0.327214;
MatrixA(22,21) = 2.46401e-07;
MatrixA(22,22) = 8.81352e-05;
MatrixA(22,23) = -1.46962e-05;
MatrixA(22,24) = 33.5222;
MatrixA(22,25) = -4.41618e-06;
MatrixA(22,26) = 7.63068;
MatrixA(22,27) = 7.63068;
MatrixA(22,28) = 7.21798;
MatrixA(22,29) = 7.21798;
MatrixA(22,30) = -0.0145206;
MatrixA(22,31) = -0.0145206;
MatrixA(22,32) = 0.0632755;
MatrixA(22,33) = 0.0632755;
MatrixA(23,1) = 1.82894e-12;
MatrixA(23,2) = 1.13331e-11;
MatrixA(23,3) = 18.8413;
MatrixA(23,8) = 14.6513;
MatrixA(23,9) = -14.6513;
MatrixA(23,10) = -2.08133;
MatrixA(23,11) = 2.08133;
MatrixA(23,12) = -35.6787;
MatrixA(23,13) = -35.7672;
MatrixA(23,14) = 40.4309;
MatrixA(23,15) = 40.4761;
MatrixA(23,20) = -9.71677e-16;
MatrixA(23,21) = -0.0361223;
MatrixA(23,22) = 5.59752e-14;
MatrixA(23,23) = -3.05091;
MatrixA(23,24) = 8.14493e-12;
MatrixA(23,25) = -0.464705;
MatrixA(23,26) = -0.124674;
MatrixA(23,27) = 0.124674;
MatrixA(23,28) = -0.185357;
MatrixA(23,29) = 0.185357;
MatrixA(23,30) = -0.318866;
MatrixA(23,31) = 0.318866;
MatrixA(23,32) = -0.299297;
MatrixA(23,33) = 0.299297;
MatrixA(24,1) = 11.4302;
MatrixA(24,2) = 4.53602;
MatrixA(24,3) = 0.0451449;
MatrixA(24,8) = -19.1688;
MatrixA(24,9) = -19.1688;
MatrixA(24,10) = 31.2131;
MatrixA(24,11) = 31.2131;
MatrixA(24,12) = -2.78911;
MatrixA(24,13) = 2.80339;
MatrixA(24,14) = 9.11846;
MatrixA(24,15) = -9.12633;
MatrixA(24,20) = 1.30283;
MatrixA(24,21) = -9.37215e-07;
MatrixA(24,22) = -0.000350921;
MatrixA(24,23) = -4.19407e-05;
MatrixA(24,24) = -0.725929;
MatrixA(24,25) = -6.80732e-06;
MatrixA(24,26) = -8.35922;
MatrixA(24,27) = -8.35922;
MatrixA(24,28) = 9.10909;
MatrixA(24,29) = 9.10909;
MatrixA(24,30) = -0.0745946;
MatrixA(24,31) = -0.0745946;
MatrixA(24,32) = -0.0531334;
MatrixA(24,33) = -0.0531334;
MatrixA(25,1) = -3.09707e-12;
MatrixA(25,2) = -4.9849e-12;
MatrixA(25,3) = 34.502;
MatrixA(25,8) = 85.3022;
MatrixA(25,9) = -85.3022;
MatrixA(25,10) = 78.8459;
MatrixA(25,11) = -78.8459;
MatrixA(25,12) = -56.8393;
MatrixA(25,13) = -56.9434;
MatrixA(25,14) = -46.1787;
MatrixA(25,15) = -46.196;
MatrixA(25,20) = 1.81368e-12;
MatrixA(25,21) = -0.0486557;
MatrixA(25,22) = 1.11291e-12;
MatrixA(25,23) = 1.8672;
MatrixA(25,24) = 4.43238e-12;
MatrixA(25,25) = -0.0888346;
MatrixA(25,26) = 14.4708;
MatrixA(25,27) = -14.4708;
MatrixA(25,28) = 13.7524;
MatrixA(25,29) = -13.7524;
MatrixA(25,30) = -0.0227167;
MatrixA(25,31) = 0.0227167;
MatrixA(25,32) = 0.128841;
MatrixA(25,33) = -0.128841;
MatrixA(26,1) = -6289.07;
MatrixA(26,2) = 36.6275;
MatrixA(26,3) = -4500.13;
MatrixA(26,8) = -7045.92;
MatrixA(26,9) = 178.02;
MatrixA(26,10) = -39.251;
MatrixA(26,11) = 71.8265;
MatrixA(26,12) = -21.6086;
MatrixA(26,13) = 44.6667;
MatrixA(26,14) = 36.0597;
MatrixA(26,15) = 30.3089;
MatrixA(26,20) = 1.17818;
MatrixA(26,21) = 0.0342421;
MatrixA(26,22) = -0.000317346;
MatrixA(26,23) = -0.0341863;
MatrixA(26,24) = -0.674259;
MatrixA(26,25) = 0.580553;
MatrixA(26,26) = -184.751;
MatrixA(26,27) = -6.59432;
MatrixA(26,28) = -6.8835;
MatrixA(26,29) = 12.5505;
MatrixA(26,30) = 0.12605;
MatrixA(26,31) = -0.0828963;
MatrixA(26,32) = -0.22658;
MatrixA(26,33) = -0.0301055;
MatrixA(27,1) = -6289.07;
MatrixA(27,2) = 36.6275;
MatrixA(27,3) = 4499.37;
MatrixA(27,8) = 178.02;
MatrixA(27,9) = -7045.92;
MatrixA(27,10) = 71.8265;
MatrixA(27,11) = -39.251;
MatrixA(27,12) = -44.5764;
MatrixA(27,13) = 21.6355;
MatrixA(27,14) = -30.3159;
MatrixA(27,15) = -36.0935;
MatrixA(27,20) = 1.17818;
MatrixA(27,21) = -0.0342446;
MatrixA(27,22) = -0.000317346;
MatrixA(27,23) = 0.034158;
MatrixA(27,24) = -0.674259;
MatrixA(27,25) = -0.581111;
MatrixA(27,26) = -6.59432;
MatrixA(27,27) = -184.751;
MatrixA(27,28) = 12.5505;
MatrixA(27,29) = -6.8835;
MatrixA(27,30) = -0.0828963;
MatrixA(27,31) = 0.12605;
MatrixA(27,32) = -0.0301055;
MatrixA(27,33) = -0.22658;
MatrixA(28,1) = -6187.45;
MatrixA(28,2) = -14503.3;
MatrixA(28,3) = -4268.7;
MatrixA(28,8) = -58.883;
MatrixA(28,9) = 60.0642;
MatrixA(28,10) = -6934.28;
MatrixA(28,11) = 144.882;
MatrixA(28,12) = 42.678;
MatrixA(28,13) = 41.0233;
MatrixA(28,14) = -131.404;
MatrixA(28,15) = 53.453;
MatrixA(28,20) = 2.81563;
MatrixA(28,21) = 0.0393069;
MatrixA(28,22) = -0.000758387;
MatrixA(28,23) = -3.79131;
MatrixA(28,24) = -1.54985;
MatrixA(28,25) = -0.00839456;
MatrixA(28,26) = -7.04735;
MatrixA(28,27) = 13.027;
MatrixA(28,28) = -176.419;
MatrixA(28,29) = -8.97669;
MatrixA(28,30) = 0.180085;
MatrixA(28,31) = 0.152824;
MatrixA(28,32) = -1.43488;
MatrixA(28,33) = 0.152796;
MatrixA(29,1) = -6187.45;
MatrixA(29,2) = -14503.3;
MatrixA(29,3) = 4267.43;
MatrixA(29,8) = 60.0642;
MatrixA(29,9) = -58.883;
MatrixA(29,10) = 144.882;
MatrixA(29,11) = -6934.28;
MatrixA(29,12) = -40.9657;
MatrixA(29,13) = -42.7731;
MatrixA(29,14) = -53.4323;
MatrixA(29,15) = 131.165;
MatrixA(29,20) = 2.81563;
MatrixA(29,21) = -0.0393053;
MatrixA(29,22) = -0.000758387;
MatrixA(29,23) = 3.79171;
MatrixA(29,24) = -1.54985;
MatrixA(29,25) = 0.00799203;
MatrixA(29,26) = 13.027;
MatrixA(29,27) = -7.04735;
MatrixA(29,28) = -8.97669;
MatrixA(29,29) = -176.419;
MatrixA(29,30) = 0.152824;
MatrixA(29,31) = 0.180085;
MatrixA(29,32) = 0.152796;
MatrixA(29,33) = -1.43488;
MatrixA(30,1) = 4496.88;
MatrixA(30,2) = -9.82883;
MatrixA(30,3) = 4267.69;
MatrixA(30,8) = 5252.14;
MatrixA(30,9) = -732.654;
MatrixA(30,10) = -32.93;
MatrixA(30,11) = -28.2158;
MatrixA(30,12) = 71.7707;
MatrixA(30,13) = 7.60379;
MatrixA(30,14) = -7.86835;
MatrixA(30,15) = 10.15;
MatrixA(30,20) = 399.35;
MatrixA(30,21) = -1.28015;
MatrixA(30,22) = -0.107566;
MatrixA(30,23) = -376.417;
MatrixA(30,24) = -219.838;
MatrixA(30,25) = -0.780819;
MatrixA(30,26) = 14.1823;
MatrixA(30,27) = 7.20022;
MatrixA(30,28) = -9.41114;
MatrixA(30,29) = -8.58411;
MatrixA(30,30) = -150.916;
MatrixA(30,31) = -1.31406;
MatrixA(30,32) = 0.0459808;
MatrixA(30,33) = 0.0502077;
MatrixA(31,1) = 4496.88;
MatrixA(31,2) = -9.82883;
MatrixA(31,3) = -4268.15;
MatrixA(31,8) = -732.654;
MatrixA(31,9) = 5252.14;
MatrixA(31,10) = -28.2158;
MatrixA(31,11) = -32.93;
MatrixA(31,12) = -8.90127;
MatrixA(31,13) = -62.4289;
MatrixA(31,14) = -10.1426;
MatrixA(31,15) = 7.87517;
MatrixA(31,20) = 399.35;
MatrixA(31,21) = 1.28015;
MatrixA(31,22) = -0.107566;
MatrixA(31,23) = 376.403;
MatrixA(31,24) = -219.838;
MatrixA(31,25) = 0.780811;
MatrixA(31,26) = 7.20022;
MatrixA(31,27) = 14.1823;
MatrixA(31,28) = -8.58411;
MatrixA(31,29) = -9.41114;
MatrixA(31,30) = -1.31406;
MatrixA(31,31) = -150.916;
MatrixA(31,32) = 0.0502077;
MatrixA(31,33) = 0.0459808;
MatrixA(32,1) = -45.2717;
MatrixA(32,2) = -117.317;
MatrixA(32,3) = -17.1136;
MatrixA(32,8) = 19.1595;
MatrixA(32,9) = 19.1782;
MatrixA(32,10) = -65.1371;
MatrixA(32,11) = -31.2169;
MatrixA(32,12) = 2.81931;
MatrixA(32,13) = -2.77315;
MatrixA(32,14) = -19.4104;
MatrixA(32,15) = 9.08719;
MatrixA(32,20) = 516.616;
MatrixA(32,21) = 0.0334564;
MatrixA(32,22) = -0.139151;
MatrixA(32,23) = -356.363;
MatrixA(32,24) = -284.39;
MatrixA(32,25) = -0.0771535;
MatrixA(32,26) = 8.3601;
MatrixA(32,27) = 8.35845;
MatrixA(32,28) = -69.9459;
MatrixA(32,29) = -9.11034;
MatrixA(32,30) = 0.0748913;
MatrixA(32,31) = 0.0743053;
MatrixA(32,32) = -147.104;
MatrixA(32,33) = 0.0528523;
MatrixA(33,1) = -45.2717;
MatrixA(33,2) = -117.317;
MatrixA(33,3) = 16.6147;
MatrixA(33,8) = 19.1782;
MatrixA(33,9) = 19.1595;
MatrixA(33,10) = -31.2169;
MatrixA(33,11) = -65.1371;
MatrixA(33,12) = 2.75895;
MatrixA(33,13) = -2.83367;
MatrixA(33,14) = -9.07936;
MatrixA(33,15) = -4.21466;
MatrixA(33,20) = 516.616;
MatrixA(33,21) = -0.0334545;
MatrixA(33,22) = -0.139151;
MatrixA(33,23) = 356.348;
MatrixA(33,24) = -284.39;
MatrixA(33,25) = 0.0771671;
MatrixA(33,26) = 8.35845;
MatrixA(33,27) = 8.3601;
MatrixA(33,28) = -9.11034;
MatrixA(33,29) = -69.9459;
MatrixA(33,30) = 0.0743053;
MatrixA(33,31) = 0.0748913;
MatrixA(33,32) = 0.0528523;
MatrixA(33,33) = -147.104;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -2.79958;
MatrixB(13,1) = -2.79959;
MatrixB(20,1) = 0.000131456;
MatrixB(21,1) = 0.0193713;
MatrixB(22,1) = -3.54744e-06;
MatrixB(23,1) = 0.0195812;
MatrixB(24,1) = -3.4592e-05;
MatrixB(25,1) = 0.0262869;
MatrixB(26,1) = 1.1618;
MatrixB(27,1) = -1.16155;
MatrixB(28,1) = -0.0194474;
MatrixB(29,1) = 0.0195715;
MatrixB(30,1) = 0.837934;
MatrixB(31,1) = -0.867323;
MatrixB(32,1) = 1.77888e-05;
MatrixB(33,1) = 5.13979e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -3.04394e-12;
MatrixC(2,2) = -4.07253e-12;
MatrixC(2,3) = 9.89475;
MatrixC(2,8) = 9.45013;
MatrixC(2,9) = -9.45013;
MatrixC(2,10) = -0.415135;
MatrixC(2,11) = 0.415135;
MatrixC(2,12) = -37.7096;
MatrixC(2,13) = -37.7774;
MatrixC(2,14) = -36.6673;
MatrixC(2,15) = -36.6647;
MatrixC(2,20) = 5.25908e-14;
MatrixC(2,21) = -0.078411;
MatrixC(2,22) = 2.62504e-14;
MatrixC(2,23) = -0.0138655;
MatrixC(2,24) = 1.13757e-13;
MatrixC(2,25) = -0.00344647;
MatrixC(2,26) = 0.000294516;
MatrixC(2,27) = -0.000294516;
MatrixC(2,28) = -0.000237115;
MatrixC(2,29) = 0.000237115;
MatrixC(2,30) = -0.00293587;
MatrixC(2,31) = 0.00293587;
MatrixC(2,32) = -1.88426e-05;
MatrixC(2,33) = 1.88426e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0190566;
% MATLAB linearized CarSim 2024.1 model, calculated at t = 135.01 s.
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

MatrixA(1,2) = -22.2222;
MatrixA(1,3) = -2.72701e-05;
MatrixA(1,20) = -0.00245432;
MatrixA(1,22) = 0.999997;
MatrixA(1,24) = -1.09867;
MatrixA(2,3) = -1.65038e-12;
MatrixA(2,23) = -1.03825e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 2.88588e-16;
MatrixA(3,3) = 8.09973e-12;
MatrixA(3,23) = 0.00245432;
MatrixA(3,24) = 2.5482e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 3.94298e-08;
MatrixA(12,2) = 0.308508;
MatrixA(12,3) = 0.0010614;
MatrixA(12,8) = 5.35314;
MatrixA(12,12) = -39.4849;
MatrixA(12,20) = 9.14445e-12;
MatrixA(12,21) = 1.75715;
MatrixA(12,22) = 4.87704e-14;
MatrixA(12,23) = 1.93401;
MatrixA(12,24) = -4.99897e-12;
MatrixA(12,25) = 0.959259;
MatrixA(12,26) = 0.0753466;
MatrixA(13,1) = -3.94306e-08;
MatrixA(13,2) = -0.308508;
MatrixA(13,3) = 0.000839873;
MatrixA(13,9) = -5.35314;
MatrixA(13,13) = -38.7231;
MatrixA(13,20) = -9.16884e-12;
MatrixA(13,21) = 1.75715;
MatrixA(13,22) = -4.87704e-14;
MatrixA(13,23) = 1.93401;
MatrixA(13,24) = 5.04774e-12;
MatrixA(13,25) = 0.959259;
MatrixA(13,27) = -0.0753466;
MatrixA(14,1) = 9.34211e-09;
MatrixA(14,2) = 0.021436;
MatrixA(14,3) = -1.0215e-06;
MatrixA(14,10) = -1.03727;
MatrixA(14,14) = -40.6275;
MatrixA(14,20) = 6.32811e-11;
MatrixA(14,21) = 1.82519;
MatrixA(14,22) = 1.5554e-13;
MatrixA(14,23) = -2.28048;
MatrixA(14,24) = -3.47172e-11;
MatrixA(14,25) = 1.00693;
MatrixA(14,28) = 0.314853;
MatrixA(15,1) = -9.34253e-09;
MatrixA(15,2) = -0.021436;
MatrixA(15,3) = 1.18944e-07;
MatrixA(15,11) = 1.03727;
MatrixA(15,15) = -40.6354;
MatrixA(15,20) = -6.32809e-11;
MatrixA(15,21) = 1.82519;
MatrixA(15,22) = -1.55935e-13;
MatrixA(15,23) = -2.28048;
MatrixA(15,24) = 3.47168e-11;
MatrixA(15,25) = 1.00693;
MatrixA(15,29) = -0.314853;
MatrixA(20,1) = -66.2619;
MatrixA(20,2) = -128.33;
MatrixA(20,3) = 0.00558278;
MatrixA(20,8) = -6.32845;
MatrixA(20,9) = -6.32845;
MatrixA(20,10) = -28.8907;
MatrixA(20,11) = -28.8907;
MatrixA(20,12) = -0.295542;
MatrixA(20,13) = 0.301459;
MatrixA(20,14) = -0.478029;
MatrixA(20,15) = 0.547832;
MatrixA(20,20) = -10.6615;
MatrixA(20,21) = -8.22878e-07;
MatrixA(20,22) = -0.0261682;
MatrixA(20,23) = 0.000293287;
MatrixA(20,24) = 5.78758;
MatrixA(20,25) = -2.01049e-06;
MatrixA(20,26) = -0.320865;
MatrixA(20,27) = -0.320865;
MatrixA(20,28) = -0.206333;
MatrixA(20,29) = -0.206333;
MatrixA(20,30) = 0.785495;
MatrixA(20,31) = 0.785495;
MatrixA(20,32) = 0.727198;
MatrixA(20,33) = 0.727198;
MatrixA(21,1) = -7.59911e-13;
MatrixA(21,2) = -6.52338e-13;
MatrixA(21,3) = 30.3793;
MatrixA(21,8) = 1.94535;
MatrixA(21,9) = -1.94535;
MatrixA(21,10) = 17.01;
MatrixA(21,11) = -17.01;
MatrixA(21,12) = -36.9404;
MatrixA(21,13) = -36.955;
MatrixA(21,14) = -33.5581;
MatrixA(21,15) = -33.5565;
MatrixA(21,20) = 2.49593e-13;
MatrixA(21,21) = -0.0514353;
MatrixA(21,22) = 1.2793e-13;
MatrixA(21,23) = -22.3437;
MatrixA(21,24) = -3.1657e-14;
MatrixA(21,25) = 0.0513362;
MatrixA(21,26) = -0.713547;
MatrixA(21,27) = 0.713547;
MatrixA(21,28) = -0.10893;
MatrixA(21,29) = 0.10893;
MatrixA(21,30) = -0.00947318;
MatrixA(21,31) = 0.00947318;
MatrixA(21,32) = -0.00726051;
MatrixA(21,33) = 0.00726051;
MatrixA(22,1) = -12.7433;
MatrixA(22,2) = -27.0605;
MatrixA(22,3) = 0.0618529;
MatrixA(22,8) = 22.65;
MatrixA(22,9) = 22.65;
MatrixA(22,10) = 17.0734;
MatrixA(22,11) = 17.0734;
MatrixA(22,12) = 2.14599;
MatrixA(22,13) = -2.14694;
MatrixA(22,14) = 7.30414;
MatrixA(22,15) = -7.29478;
MatrixA(22,20) = -0.514966;
MatrixA(22,21) = 2.4668e-07;
MatrixA(22,22) = -0.00126397;
MatrixA(22,23) = -4.06346e-06;
MatrixA(22,24) = 22.5105;
MatrixA(22,25) = -4.02941e-06;
MatrixA(22,26) = 7.63014;
MatrixA(22,27) = 7.63014;
MatrixA(22,28) = 7.22452;
MatrixA(22,29) = 7.22452;
MatrixA(22,30) = -0.0207784;
MatrixA(22,31) = -0.0207784;
MatrixA(22,32) = 0.0954507;
MatrixA(22,33) = 0.0954507;
MatrixA(23,1) = 1.15947e-12;
MatrixA(23,2) = 1.02675e-12;
MatrixA(23,3) = 8.71323;
MatrixA(23,8) = 7.92906;
MatrixA(23,9) = -7.92906;
MatrixA(23,10) = -2.98148;
MatrixA(23,11) = 2.98148;
MatrixA(23,12) = -36.8037;
MatrixA(23,13) = -36.815;
MatrixA(23,14) = 40.0373;
MatrixA(23,15) = 40.079;
MatrixA(23,20) = 1.24328e-11;
MatrixA(23,21) = -0.0310588;
MatrixA(23,22) = 6.1938e-12;
MatrixA(23,23) = -4.62894;
MatrixA(23,24) = 3.09102e-14;
MatrixA(23,25) = -0.301306;
MatrixA(23,26) = -0.139674;
MatrixA(23,27) = 0.139674;
MatrixA(23,28) = -0.244883;
MatrixA(23,29) = 0.244883;
MatrixA(23,30) = -0.492311;
MatrixA(23,31) = 0.492311;
MatrixA(23,32) = -0.445134;
MatrixA(23,33) = 0.445134;
MatrixA(24,1) = 5.42684;
MatrixA(24,2) = 3.48721;
MatrixA(24,3) = 0.0501118;
MatrixA(24,8) = -23.1499;
MatrixA(24,9) = -23.1499;
MatrixA(24,10) = 29.4381;
MatrixA(24,11) = 29.4381;
MatrixA(24,12) = -2.25745;
MatrixA(24,13) = 2.25676;
MatrixA(24,14) = 9.26717;
MatrixA(24,15) = -9.27445;
MatrixA(24,20) = 1.98417;
MatrixA(24,21) = -9.37828e-07;
MatrixA(24,22) = 0.00487013;
MatrixA(24,23) = -8.91341e-05;
MatrixA(24,24) = -1.09455;
MatrixA(24,25) = -7.67813e-06;
MatrixA(24,26) = -8.34786;
MatrixA(24,27) = -8.34786;
MatrixA(24,28) = 9.09462;
MatrixA(24,29) = 9.09462;
MatrixA(24,30) = -0.145429;
MatrixA(24,31) = -0.145429;
MatrixA(24,32) = -0.0784425;
MatrixA(24,33) = -0.0784425;
MatrixA(25,1) = -9.38104e-13;
MatrixA(25,2) = -2.49923e-12;
MatrixA(25,3) = 37.0703;
MatrixA(25,8) = 88.2446;
MatrixA(25,9) = -88.2446;
MatrixA(25,10) = 77.0229;
MatrixA(25,11) = -77.0229;
MatrixA(25,12) = -58.9706;
MatrixA(25,13) = -58.9939;
MatrixA(25,14) = -45.5935;
MatrixA(25,15) = -45.611;
MatrixA(25,20) = -1.29827e-13;
MatrixA(25,21) = -0.0328224;
MatrixA(25,22) = -7.41028e-13;
MatrixA(25,23) = 1.69503;
MatrixA(25,24) = 5.05399e-13;
MatrixA(25,25) = -0.0543697;
MatrixA(25,26) = 14.4524;
MatrixA(25,27) = -14.4524;
MatrixA(25,28) = 13.7743;
MatrixA(25,29) = -13.7743;
MatrixA(25,30) = -0.031024;
MatrixA(25,31) = 0.031024;
MatrixA(25,32) = 0.194798;
MatrixA(25,33) = -0.194798;
MatrixA(26,1) = -6291.07;
MatrixA(26,2) = 38.8227;
MatrixA(26,3) = -4499.94;
MatrixA(26,8) = -7069.57;
MatrixA(26,9) = 174.793;
MatrixA(26,10) = -38.241;
MatrixA(26,11) = 69.6564;
MatrixA(26,12) = -9.37984;
MatrixA(26,13) = 44.2091;
MatrixA(26,14) = 35.6031;
MatrixA(26,15) = 29.7618;
MatrixA(26,20) = 1.72956;
MatrixA(26,21) = 0.024402;
MatrixA(26,22) = 0.00424546;
MatrixA(26,23) = -0.0105354;
MatrixA(26,24) = -0.966811;
MatrixA(26,25) = 0.342797;
MatrixA(26,26) = -184.701;
MatrixA(26,27) = -6.6165;
MatrixA(26,28) = -6.89769;
MatrixA(26,29) = 12.5071;
MatrixA(26,30) = 0.167398;
MatrixA(26,31) = -0.15442;
MatrixA(26,32) = -0.341602;
MatrixA(26,33) = -0.038662;
MatrixA(27,1) = -6291.07;
MatrixA(27,2) = 38.8227;
MatrixA(27,3) = 4499.22;
MatrixA(27,8) = 174.793;
MatrixA(27,9) = -7069.57;
MatrixA(27,10) = 69.6564;
MatrixA(27,11) = -38.241;
MatrixA(27,12) = -44.1933;
MatrixA(27,13) = 9.38282;
MatrixA(27,14) = -29.7663;
MatrixA(27,15) = -35.6349;
MatrixA(27,20) = 1.72956;
MatrixA(27,21) = -0.0244046;
MatrixA(27,22) = 0.00424546;
MatrixA(27,23) = 0.0102988;
MatrixA(27,24) = -0.966811;
MatrixA(27,25) = -0.343361;
MatrixA(27,26) = -6.6165;
MatrixA(27,27) = -184.701;
MatrixA(27,28) = 12.5071;
MatrixA(27,29) = -6.89769;
MatrixA(27,30) = -0.15442;
MatrixA(27,31) = 0.167398;
MatrixA(27,32) = -0.038662;
MatrixA(27,33) = -0.341602;
MatrixA(28,1) = -6171.62;
MatrixA(28,2) = -14484;
MatrixA(28,3) = -4265.77;
MatrixA(28,8) = -55.4085;
MatrixA(28,9) = 67.705;
MatrixA(28,10) = -6900.99;
MatrixA(28,11) = 147.266;
MatrixA(28,12) = 44.0991;
MatrixA(28,13) = 42.7218;
MatrixA(28,14) = -134.248;
MatrixA(28,15) = 53.4892;
MatrixA(28,20) = 4.06155;
MatrixA(28,21) = 0.0264941;
MatrixA(28,22) = 0.00996864;
MatrixA(28,23) = -5.6092;
MatrixA(28,24) = -2.22789;
MatrixA(28,25) = 0.00363943;
MatrixA(28,26) = -7.04918;
MatrixA(28,27) = 12.9936;
MatrixA(28,28) = -176.545;
MatrixA(28,29) = -8.92493;
MatrixA(28,30) = 0.311857;
MatrixA(28,31) = 0.277374;
MatrixA(28,32) = -2.12175;
MatrixA(28,33) = 0.229686;
MatrixA(29,1) = -6171.62;
MatrixA(29,2) = -14484;
MatrixA(29,3) = 4264.44;
MatrixA(29,8) = 67.705;
MatrixA(29,9) = -55.4085;
MatrixA(29,10) = 147.266;
MatrixA(29,11) = -6900.99;
MatrixA(29,12) = -42.7022;
MatrixA(29,13) = -44.1138;
MatrixA(29,14) = -53.4685;
MatrixA(29,15) = 134.041;
MatrixA(29,20) = 4.06155;
MatrixA(29,21) = -0.0264925;
MatrixA(29,22) = 0.00996864;
MatrixA(29,23) = 5.60958;
MatrixA(29,24) = -2.22789;
MatrixA(29,25) = -0.00403931;
MatrixA(29,26) = 12.9936;
MatrixA(29,27) = -7.04918;
MatrixA(29,28) = -8.92493;
MatrixA(29,29) = -176.545;
MatrixA(29,30) = 0.277374;
MatrixA(29,31) = 0.311857;
MatrixA(29,32) = 0.229686;
MatrixA(29,33) = -2.12175;
MatrixA(30,1) = 2104.34;
MatrixA(30,2) = -10.8729;
MatrixA(30,3) = 2039.5;
MatrixA(30,8) = 2470.71;
MatrixA(30,9) = -348.653;
MatrixA(30,10) = -31.2959;
MatrixA(30,11) = -26.224;
MatrixA(30,12) = 38.4426;
MatrixA(30,13) = 5.29877;
MatrixA(30,14) = -7.91031;
MatrixA(30,15) = 10.3786;
MatrixA(30,20) = 615.456;
MatrixA(30,21) = -2.4888;
MatrixA(30,22) = 1.51063;
MatrixA(30,23) = -580.855;
MatrixA(30,24) = -337.683;
MatrixA(30,25) = 0.0767915;
MatrixA(30,26) = 21.4201;
MatrixA(30,27) = 6.15981;
MatrixA(30,28) = -9.43154;
MatrixA(30,29) = -8.51525;
MatrixA(30,30) = -222.357;
MatrixA(30,31) = 8.59397;
MatrixA(30,32) = 0.0666437;
MatrixA(30,33) = 0.0738438;
MatrixA(31,1) = 2104.34;
MatrixA(31,2) = -10.8729;
MatrixA(31,3) = -2040.02;
MatrixA(31,8) = -348.653;
MatrixA(31,9) = 2470.71;
MatrixA(31,10) = -26.224;
MatrixA(31,11) = -31.2959;
MatrixA(31,12) = -5.08884;
MatrixA(31,13) = -39.9562;
MatrixA(31,14) = -10.3718;
MatrixA(31,15) = 7.91649;
MatrixA(31,20) = 615.456;
MatrixA(31,21) = 2.4888;
MatrixA(31,22) = 1.51063;
MatrixA(31,23) = 580.812;
MatrixA(31,24) = -337.683;
MatrixA(31,25) = -0.0768004;
MatrixA(31,26) = 6.15981;
MatrixA(31,27) = 21.4201;
MatrixA(31,28) = -8.51525;
MatrixA(31,29) = -9.43154;
MatrixA(31,30) = 8.59397;
MatrixA(31,31) = -222.357;
MatrixA(31,32) = 0.0738438;
MatrixA(31,33) = 0.0666437;
MatrixA(32,1) = -45.4447;
MatrixA(32,2) = -124.251;
MatrixA(32,3) = -22.8428;
MatrixA(32,8) = 23.1486;
MatrixA(32,9) = 23.1514;
MatrixA(32,10) = -69.5406;
MatrixA(32,11) = -29.4401;
MatrixA(32,12) = 2.27161;
MatrixA(32,13) = -2.24261;
MatrixA(32,14) = -19.1376;
MatrixA(32,15) = 9.25688;
MatrixA(32,20) = 768.111;
MatrixA(32,21) = 0.0214661;
MatrixA(32,22) = 1.88528;
MatrixA(32,23) = -529.666;
MatrixA(32,24) = -421.424;
MatrixA(32,25) = 1.31184;
MatrixA(32,26) = 8.34826;
MatrixA(32,27) = 8.34751;
MatrixA(32,28) = -98.9688;
MatrixA(32,29) = -9.09521;
MatrixA(32,30) = 0.145637;
MatrixA(32,31) = 0.145226;
MatrixA(32,32) = -218.717;
MatrixA(32,33) = 0.0782527;
MatrixA(33,1) = -45.4447;
MatrixA(33,2) = -124.251;
MatrixA(33,3) = 20.1725;
MatrixA(33,8) = 23.1514;
MatrixA(33,9) = 23.1486;
MatrixA(33,10) = -29.4401;
MatrixA(33,11) = -69.5406;
MatrixA(33,12) = 2.2433;
MatrixA(33,13) = -2.27092;
MatrixA(33,14) = -9.24962;
MatrixA(33,15) = -1.86118;
MatrixA(33,20) = 768.111;
MatrixA(33,21) = -0.0214642;
MatrixA(33,22) = 1.88528;
MatrixA(33,23) = 529.634;
MatrixA(33,24) = -421.424;
MatrixA(33,25) = -1.31182;
MatrixA(33,26) = 8.34751;
MatrixA(33,27) = 8.34826;
MatrixA(33,28) = -9.09521;
MatrixA(33,29) = -98.9688;
MatrixA(33,30) = 0.145226;
MatrixA(33,31) = 0.145637;
MatrixA(33,32) = 0.0782527;
MatrixA(33,33) = -218.717;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -1.83189;
MatrixB(13,1) = -1.83189;
MatrixB(20,1) = 0.000134842;
MatrixB(21,1) = 0.0103246;
MatrixB(22,1) = -3.36738e-06;
MatrixB(23,1) = 0.0136876;
MatrixB(24,1) = -3.52295e-05;
MatrixB(25,1) = 0.0100475;
MatrixB(26,1) = 1.11793;
MatrixB(27,1) = -1.11767;
MatrixB(28,1) = -0.00754787;
MatrixB(29,1) = 0.0076744;
MatrixB(30,1) = 2.05021;
MatrixB(31,1) = -2.08029;
MatrixB(32,1) = 2.97097e-05;
MatrixB(33,1) = 4.07506e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -8.28087e-13;
MatrixC(2,2) = -8.14492e-13;
MatrixC(2,3) = 13.467;
MatrixC(2,8) = 11.8025;
MatrixC(2,9) = -11.8025;
MatrixC(2,10) = -0.320889;
MatrixC(2,11) = 0.320889;
MatrixC(2,12) = -38.7929;
MatrixC(2,13) = -38.8082;
MatrixC(2,14) = -36.3427;
MatrixC(2,15) = -36.3417;
MatrixC(2,20) = 8.5161e-14;
MatrixC(2,21) = -0.0523417;
MatrixC(2,22) = 7.96971e-15;
MatrixC(2,23) = -0.0229992;
MatrixC(2,24) = -3.08046e-14;
MatrixC(2,25) = -0.00226125;
MatrixC(2,26) = 0.000503966;
MatrixC(2,27) = -0.000503966;
MatrixC(2,28) = -0.00016306;
MatrixC(2,29) = 0.00016306;
MatrixC(2,30) = -0.00470281;
MatrixC(2,31) = 0.00470281;
MatrixC(2,32) = -1.11703e-05;
MatrixC(2,33) = 1.11703e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.00869929;
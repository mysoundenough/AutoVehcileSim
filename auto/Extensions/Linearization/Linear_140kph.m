% MATLAB linearized CarSim 2024.1 model, calculated at t = 225.019 s.
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

MatrixA(1,2) = -38.8889;
MatrixA(1,3) = 3.70826e-05;
MatrixA(1,20) = 0.00190711;
MatrixA(1,22) = 0.999998;
MatrixA(1,24) = -1.10103;
MatrixA(2,3) = -2.0616e-13;
MatrixA(2,23) = -1.78925e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 5.371e-16;
MatrixA(3,3) = -7.84291e-13;
MatrixA(3,23) = -0.00190711;
MatrixA(3,24) = -3.41229e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 5.94491e-09;
MatrixA(12,2) = 0.437756;
MatrixA(12,3) = 0.00100811;
MatrixA(12,8) = 11.5197;
MatrixA(12,12) = -71.1468;
MatrixA(12,20) = 4.53279e-13;
MatrixA(12,21) = 1.81457;
MatrixA(12,22) = 5.03644e-14;
MatrixA(12,23) = 1.99479;
MatrixA(12,24) = -2.2664e-13;
MatrixA(12,25) = 1.00484;
MatrixA(12,26) = 0.113474;
MatrixA(13,1) = -5.94499e-09;
MatrixA(13,2) = -0.437756;
MatrixA(13,3) = 0.000765409;
MatrixA(13,9) = -11.5197;
MatrixA(13,13) = -70.2055;
MatrixA(13,20) = -4.53279e-13;
MatrixA(13,21) = 1.81457;
MatrixA(13,22) = -2.51822e-14;
MatrixA(13,23) = 1.99479;
MatrixA(13,24) = 2.01458e-13;
MatrixA(13,25) = 1.00484;
MatrixA(13,27) = -0.113474;
MatrixA(14,1) = 1.12629e-09;
MatrixA(14,2) = 0.105313;
MatrixA(14,3) = -1.10155e-05;
MatrixA(14,10) = -1.92145;
MatrixA(14,14) = -70.2571;
MatrixA(14,20) = 4.43121e-12;
MatrixA(14,21) = 1.80397;
MatrixA(14,22) = -7.82346e-15;
MatrixA(14,23) = -2.25667;
MatrixA(14,24) = -2.44327e-12;
MatrixA(14,25) = 0.990886;
MatrixA(14,28) = 0.299247;
MatrixA(15,1) = -1.12579e-09;
MatrixA(15,2) = -0.105313;
MatrixA(15,3) = -3.97282e-06;
MatrixA(15,11) = 1.92145;
MatrixA(15,15) = -70.2993;
MatrixA(15,20) = -4.43042e-12;
MatrixA(15,21) = 1.80397;
MatrixA(15,22) = 7.04111e-15;
MatrixA(15,23) = -2.25667;
MatrixA(15,24) = 2.44092e-12;
MatrixA(15,25) = 0.990886;
MatrixA(15,29) = -0.299247;
MatrixA(20,1) = -102.451;
MatrixA(20,2) = -128.332;
MatrixA(20,3) = -0.00304267;
MatrixA(20,8) = -24.3238;
MatrixA(20,9) = -24.3238;
MatrixA(20,10) = -28.9061;
MatrixA(20,11) = -28.9061;
MatrixA(20,12) = -0.42993;
MatrixA(20,13) = 0.352078;
MatrixA(20,14) = -0.434407;
MatrixA(20,15) = 0.517105;
MatrixA(20,20) = -6.01029;
MatrixA(20,21) = -8.26408e-07;
MatrixA(20,22) = 0.0114626;
MatrixA(20,23) = 6.57522e-05;
MatrixA(20,24) = 3.3768;
MatrixA(20,25) = -1.85749e-06;
MatrixA(20,26) = -0.261592;
MatrixA(20,27) = -0.261592;
MatrixA(20,28) = -0.304925;
MatrixA(20,29) = -0.304925;
MatrixA(20,30) = 0.428145;
MatrixA(20,31) = 0.428145;
MatrixA(20,32) = 0.421695;
MatrixA(20,33) = 0.421695;
MatrixA(21,1) = -1.57494e-12;
MatrixA(21,2) = -1.88282e-12;
MatrixA(21,3) = 28.4337;
MatrixA(21,8) = 2.41578;
MatrixA(21,9) = -2.41578;
MatrixA(21,10) = 15.6876;
MatrixA(21,11) = -15.6876;
MatrixA(21,12) = -35.3153;
MatrixA(21,13) = -35.3801;
MatrixA(21,14) = -34.0879;
MatrixA(21,15) = -34.0836;
MatrixA(21,20) = 1.32783e-13;
MatrixA(21,21) = -0.089718;
MatrixA(21,22) = 3.92294e-14;
MatrixA(21,23) = -39.0004;
MatrixA(21,24) = 3.23166e-13;
MatrixA(21,25) = -0.0799045;
MatrixA(21,26) = -0.623141;
MatrixA(21,27) = 0.623141;
MatrixA(21,28) = -0.131621;
MatrixA(21,29) = 0.131621;
MatrixA(21,30) = -0.00459043;
MatrixA(21,31) = 0.00459043;
MatrixA(21,32) = -0.00426145;
MatrixA(21,33) = 0.00426145;
MatrixA(22,1) = -10.8481;
MatrixA(22,2) = -25.5295;
MatrixA(22,3) = 0.0652004;
MatrixA(22,8) = 22.4326;
MatrixA(22,9) = 22.4326;
MatrixA(22,10) = 18.5912;
MatrixA(22,11) = 18.5912;
MatrixA(22,12) = 2.94758;
MatrixA(22,13) = -2.95024;
MatrixA(22,14) = 7.13511;
MatrixA(22,15) = -7.12376;
MatrixA(22,20) = -0.272308;
MatrixA(22,21) = 2.46255e-07;
MatrixA(22,22) = 0.000519335;
MatrixA(22,23) = -1.60783e-05;
MatrixA(22,24) = 39.0492;
MatrixA(22,25) = -4.66969e-06;
MatrixA(22,26) = 7.63049;
MatrixA(22,27) = 7.63049;
MatrixA(22,28) = 7.21777;
MatrixA(22,29) = 7.21777;
MatrixA(22,30) = -0.0127793;
MatrixA(22,31) = -0.0127793;
MatrixA(22,32) = 0.0541138;
MatrixA(22,33) = 0.0541138;
MatrixA(23,1) = -1.70332e-13;
MatrixA(23,2) = 8.84822e-13;
MatrixA(23,3) = 25.47;
MatrixA(23,8) = 19.318;
MatrixA(23,9) = -19.318;
MatrixA(23,10) = -1.54787;
MatrixA(23,11) = 1.54787;
MatrixA(23,12) = -35.0467;
MatrixA(23,13) = -35.1611;
MatrixA(23,14) = 40.6853;
MatrixA(23,15) = 40.7319;
MatrixA(23,20) = 6.65821e-12;
MatrixA(23,21) = -0.039567;
MatrixA(23,22) = 6.58547e-12;
MatrixA(23,23) = -2.5925;
MatrixA(23,24) = 1.34615e-11;
MatrixA(23,25) = -0.545248;
MatrixA(23,26) = -0.108664;
MatrixA(23,27) = 0.108664;
MatrixA(23,28) = -0.167793;
MatrixA(23,29) = 0.167793;
MatrixA(23,30) = -0.267458;
MatrixA(23,31) = 0.267458;
MatrixA(23,32) = -0.25797;
MatrixA(23,33) = 0.25797;
MatrixA(24,1) = 15.6262;
MatrixA(24,2) = 5.12641;
MatrixA(24,3) = 0.0418987;
MatrixA(24,8) = -17.3129;
MatrixA(24,9) = -17.3129;
MatrixA(24,10) = 31.2775;
MatrixA(24,11) = 31.2775;
MatrixA(24,12) = -3.11398;
MatrixA(24,13) = 3.14009;
MatrixA(24,14) = 9.04275;
MatrixA(24,15) = -9.05085;
MatrixA(24,20) = 1.10386;
MatrixA(24,21) = -9.37229e-07;
MatrixA(24,22) = -0.00210523;
MatrixA(24,23) = -3.38338e-05;
MatrixA(24,24) = -0.619062;
MatrixA(24,25) = -6.28557e-06;
MatrixA(24,26) = -8.36296;
MatrixA(24,27) = -8.36296;
MatrixA(24,28) = 9.11406;
MatrixA(24,29) = 9.11406;
MatrixA(24,30) = -0.0538057;
MatrixA(24,31) = -0.0538057;
MatrixA(24,32) = -0.0459748;
MatrixA(24,33) = -0.0459748;
MatrixA(25,1) = -2.12585e-12;
MatrixA(25,2) = -3.51365e-12;
MatrixA(25,3) = 32.8131;
MatrixA(25,8) = 85.0095;
MatrixA(25,9) = -85.0095;
MatrixA(25,10) = 78.4597;
MatrixA(25,11) = -78.4597;
MatrixA(25,12) = -55.5847;
MatrixA(25,13) = -55.6898;
MatrixA(25,14) = -46.5435;
MatrixA(25,15) = -46.5604;
MatrixA(25,20) = -7.91375e-13;
MatrixA(25,21) = -0.0566176;
MatrixA(25,22) = 5.75759e-13;
MatrixA(25,23) = 2.01371;
MatrixA(25,24) = 1.97524e-13;
MatrixA(25,25) = -0.110587;
MatrixA(25,26) = 14.482;
MatrixA(25,27) = -14.482;
MatrixA(25,28) = 13.7475;
MatrixA(25,29) = -13.7475;
MatrixA(25,30) = -0.0198548;
MatrixA(25,31) = 0.0198548;
MatrixA(25,32) = 0.110034;
MatrixA(25,33) = -0.110034;
MatrixA(26,1) = -6287.79;
MatrixA(26,2) = 35.5121;
MatrixA(26,3) = -4500.43;
MatrixA(26,8) = -7050.62;
MatrixA(26,9) = 179.645;
MatrixA(26,10) = -39.1172;
MatrixA(26,11) = 71.785;
MatrixA(26,12) = -28.7585;
MatrixA(26,13) = 44.9112;
MatrixA(26,14) = 36.3486;
MatrixA(26,15) = 30.6431;
MatrixA(26,20) = 1.01751;
MatrixA(26,21) = 0.0398621;
MatrixA(26,22) = -0.00194056;
MatrixA(26,23) = -0.0241685;
MatrixA(26,24) = -0.590474;
MatrixA(26,25) = 0.725707;
MatrixA(26,26) = -184.768;
MatrixA(26,27) = -6.57538;
MatrixA(26,28) = -6.88954;
MatrixA(26,29) = 12.5747;
MatrixA(26,30) = 0.114201;
MatrixA(26,31) = -0.0617445;
MatrixA(26,32) = -0.193734;
MatrixA(26,33) = -0.0280687;
MatrixA(27,1) = -6287.79;
MatrixA(27,2) = 35.5121;
MatrixA(27,3) = 4499.66;
MatrixA(27,8) = 179.645;
MatrixA(27,9) = -7050.62;
MatrixA(27,10) = 71.785;
MatrixA(27,11) = -39.1172;
MatrixA(27,12) = -44.807;
MatrixA(27,13) = 28.7938;
MatrixA(27,14) = -30.6517;
MatrixA(27,15) = -36.3829;
MatrixA(27,20) = 1.01751;
MatrixA(27,21) = -0.0398646;
MatrixA(27,22) = -0.00194056;
MatrixA(27,23) = 0.0241635;
MatrixA(27,24) = -0.590474;
MatrixA(27,25) = -0.726262;
MatrixA(27,26) = -6.57538;
MatrixA(27,27) = -184.768;
MatrixA(27,28) = 12.5747;
MatrixA(27,29) = -6.88954;
MatrixA(27,30) = -0.0617445;
MatrixA(27,31) = 0.114201;
MatrixA(27,32) = -0.0280687;
MatrixA(27,33) = -0.193734;
MatrixA(28,1) = -6197.61;
MatrixA(28,2) = -14513.6;
MatrixA(28,3) = -4269.97;
MatrixA(28,8) = -62.2624;
MatrixA(28,9) = 56.2355;
MatrixA(28,10) = -6934.69;
MatrixA(28,11) = 144.465;
MatrixA(28,12) = 41.867;
MatrixA(28,13) = 39.9579;
MatrixA(28,14) = -129.92;
MatrixA(28,15) = 53.4754;
MatrixA(28,20) = 2.47805;
MatrixA(28,21) = 0.0456775;
MatrixA(28,22) = -0.00472604;
MatrixA(28,23) = -3.28765;
MatrixA(28,24) = -1.36729;
MatrixA(28,25) = -0.00916227;
MatrixA(28,26) = -7.05061;
MatrixA(28,27) = 13.0426;
MatrixA(28,28) = -176.424;
MatrixA(28,29) = -8.99631;
MatrixA(28,30) = 0.141154;
MatrixA(28,31) = 0.116639;
MatrixA(28,32) = -1.24213;
MatrixA(28,33) = 0.130905;
MatrixA(29,1) = -6197.61;
MatrixA(29,2) = -14513.6;
MatrixA(29,3) = 4268.73;
MatrixA(29,8) = 56.2355;
MatrixA(29,9) = -62.2624;
MatrixA(29,10) = 144.465;
MatrixA(29,11) = -6934.69;
MatrixA(29,12) = -39.9201;
MatrixA(29,13) = -41.9828;
MatrixA(29,14) = -53.4551;
MatrixA(29,15) = 129.663;
MatrixA(29,20) = 2.47805;
MatrixA(29,21) = -0.0456758;
MatrixA(29,22) = -0.00472604;
MatrixA(29,23) = 3.28805;
MatrixA(29,24) = -1.36729;
MatrixA(29,25) = 0.00875826;
MatrixA(29,26) = 13.0426;
MatrixA(29,27) = -7.05061;
MatrixA(29,28) = -8.99631;
MatrixA(29,29) = -176.424;
MatrixA(29,30) = 0.116639;
MatrixA(29,31) = 0.141154;
MatrixA(29,32) = 0.130905;
MatrixA(29,33) = -1.24213;
MatrixA(30,1) = 6179.01;
MatrixA(30,2) = -7.22334;
MatrixA(30,3) = 5776.61;
MatrixA(30,8) = 7207.77;
MatrixA(30,9) = -1002.03;
MatrixA(30,10) = -32.8693;
MatrixA(30,11) = -28.4786;
MatrixA(30,12) = 78.0991;
MatrixA(30,13) = 6.48215;
MatrixA(30,14) = -7.85932;
MatrixA(30,15) = 10.0231;
MatrixA(30,20) = 335.863;
MatrixA(30,21) = -0.890283;
MatrixA(30,22) = -0.640545;
MatrixA(30,23) = -316.306;
MatrixA(30,24) = -185.284;
MatrixA(30,25) = -1.065;
MatrixA(30,26) = 12.2286;
MatrixA(30,27) = 7.49221;
MatrixA(30,28) = -9.39486;
MatrixA(30,29) = -8.62305;
MatrixA(30,30) = -129.903;
MatrixA(30,31) = -4.22826;
MatrixA(30,32) = 0.0402009;
MatrixA(30,33) = 0.0435605;
MatrixA(31,1) = 6179.01;
MatrixA(31,2) = -7.22334;
MatrixA(31,3) = -5776.98;
MatrixA(31,8) = -1002.03;
MatrixA(31,9) = 7207.77;
MatrixA(31,10) = -28.4786;
MatrixA(31,11) = -32.8693;
MatrixA(31,12) = -9.2899;
MatrixA(31,13) = -57.8784;
MatrixA(31,14) = -10.0155;
MatrixA(31,15) = 7.8664;
MatrixA(31,20) = 335.863;
MatrixA(31,21) = 0.890284;
MatrixA(31,22) = -0.640545;
MatrixA(31,23) = 316.297;
MatrixA(31,24) = -185.284;
MatrixA(31,25) = 1.06499;
MatrixA(31,26) = 7.49221;
MatrixA(31,27) = 12.2286;
MatrixA(31,28) = -8.62305;
MatrixA(31,29) = -9.39486;
MatrixA(31,30) = -4.22826;
MatrixA(31,31) = -129.903;
MatrixA(31,32) = 0.0435605;
MatrixA(31,33) = 0.0402009;
MatrixA(32,1) = -45.7298;
MatrixA(32,2) = -113.294;
MatrixA(32,3) = -14.9157;
MatrixA(32,8) = 17.2952;
MatrixA(32,9) = 17.3305;
MatrixA(32,10) = -61.463;
MatrixA(32,11) = -31.2818;
MatrixA(32,12) = 3.15243;
MatrixA(32,13) = -3.10156;
MatrixA(32,14) = -19.4126;
MatrixA(32,15) = 8.99975;
MatrixA(32,20) = 445.36;
MatrixA(32,21) = 0.0384841;
MatrixA(32,22) = -0.849373;
MatrixA(32,23) = -307.266;
MatrixA(32,24) = -245.691;
MatrixA(32,25) = -0.564132;
MatrixA(32,26) = 8.36409;
MatrixA(32,27) = 8.36198;
MatrixA(32,28) = -61.8073;
MatrixA(32,29) = -9.11566;
MatrixA(32,30) = 0.0541279;
MatrixA(32,31) = 0.0534908;
MatrixA(32,32) = -126.814;
MatrixA(32,33) = 0.0456607;
MatrixA(33,1) = -45.7298;
MatrixA(33,2) = -113.294;
MatrixA(33,3) = 14.8464;
MatrixA(33,8) = 17.3305;
MatrixA(33,9) = 17.2952;
MatrixA(33,10) = -31.2818;
MatrixA(33,11) = -61.463;
MatrixA(33,12) = 3.07559;
MatrixA(33,13) = -3.17866;
MatrixA(33,14) = -8.99171;
MatrixA(33,15) = -5.47205;
MatrixA(33,20) = 445.36;
MatrixA(33,21) = -0.0384822;
MatrixA(33,22) = -0.849373;
MatrixA(33,23) = 307.255;
MatrixA(33,24) = -245.691;
MatrixA(33,25) = 0.564144;
MatrixA(33,26) = 8.36198;
MatrixA(33,27) = 8.36409;
MatrixA(33,28) = -9.11566;
MatrixA(33,29) = -61.8073;
MatrixA(33,30) = 0.0534908;
MatrixA(33,31) = 0.0541279;
MatrixA(33,32) = 0.0456607;
MatrixA(33,33) = -126.814;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -3.30979;
MatrixB(13,1) = -3.3098;
MatrixB(20,1) = 0.000129146;
MatrixB(21,1) = 0.0252713;
MatrixB(22,1) = -3.66025e-06;
MatrixB(23,1) = 0.0232591;
MatrixB(24,1) = -3.41122e-05;
MatrixB(25,1) = 0.0367757;
MatrixB(26,1) = 1.18845;
MatrixB(27,1) = -1.1882;
MatrixB(28,1) = -0.0271247;
MatrixB(29,1) = 0.027247;
MatrixB(30,1) = 0.0167718;
MatrixB(31,1) = -0.0456887;
MatrixB(32,1) = 8.60445e-06;
MatrixB(33,1) = 5.96233e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -1.69466e-12;
MatrixC(2,2) = -2.18061e-12;
MatrixC(2,3) = 7.51295;
MatrixC(2,8) = 7.94667;
MatrixC(2,9) = -7.94667;
MatrixC(2,10) = -0.471983;
MatrixC(2,11) = 0.471983;
MatrixC(2,12) = -37.0702;
MatrixC(2,13) = -37.1377;
MatrixC(2,14) = -36.879;
MatrixC(2,15) = -36.8752;
MatrixC(2,20) = 1.91943e-14;
MatrixC(2,21) = -0.0914494;
MatrixC(2,22) = -6.67443e-16;
MatrixC(2,23) = -0.00909484;
MatrixC(2,24) = 1.329e-13;
MatrixC(2,25) = -0.00403359;
MatrixC(2,26) = 0.000179254;
MatrixC(2,27) = -0.000179254;
MatrixC(2,28) = -0.000271652;
MatrixC(2,29) = 0.000271652;
MatrixC(2,30) = -0.00201691;
MatrixC(2,31) = 0.00201691;
MatrixC(2,32) = -2.26102e-05;
MatrixC(2,33) = 2.26102e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0258191;
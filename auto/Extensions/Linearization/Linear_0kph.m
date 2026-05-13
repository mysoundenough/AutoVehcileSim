% MATLAB linearized CarSim 2024.1 model, calculated at t = 15.001 s.
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

MatrixA(1,2) = -0.00224775;
MatrixA(1,3) = 2.54916e-07;
MatrixA(1,20) = -0.00410377;
MatrixA(1,22) = 0.999992;
MatrixA(1,24) = -1.09777;
MatrixA(2,3) = -2.57075e-07;
MatrixA(2,24) = 1;
MatrixA(3,2) = 3.58392e-15;
MatrixA(3,3) = 2.10998e-06;
MatrixA(3,23) = 0.00410381;
MatrixA(3,24) = -6.90558e-20;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 0.000103493;
MatrixA(12,2) = 3.75454e-05;
MatrixA(12,3) = 0.00122778;
MatrixA(12,8) = 0.00118597;
MatrixA(12,12) = -0.00382933;
MatrixA(12,20) = 0.00394921;
MatrixA(12,21) = 1.70202;
MatrixA(12,22) = 1.62068e-05;
MatrixA(12,23) = 1.87142;
MatrixA(12,24) = -0.00215799;
MatrixA(12,25) = 0.922366;
MatrixA(12,26) = 0.0560145;
MatrixA(13,1) = -0.000103493;
MatrixA(13,2) = -3.75454e-05;
MatrixA(13,3) = 0.00110337;
MatrixA(13,9) = -0.00118597;
MatrixA(13,13) = -0.00380405;
MatrixA(13,20) = -0.00394921;
MatrixA(13,21) = 1.70202;
MatrixA(13,22) = -1.62068e-05;
MatrixA(13,23) = 1.87142;
MatrixA(13,24) = 0.00215799;
MatrixA(13,25) = 0.922366;
MatrixA(13,27) = -0.0560145;
MatrixA(14,1) = 0.0151319;
MatrixA(14,2) = 0.0425155;
MatrixA(14,3) = 0.00769876;
MatrixA(14,10) = 0.0121329;
MatrixA(14,14) = -0.00368339;
MatrixA(14,20) = -0.000295073;
MatrixA(14,21) = 1.83692;
MatrixA(14,22) = -1.21092e-06;
MatrixA(14,23) = -2.29412;
MatrixA(14,24) = 0.000161238;
MatrixA(14,25) = 1.01317;
MatrixA(14,28) = 0.315916;
MatrixA(15,1) = -0.0151319;
MatrixA(15,2) = -0.0425155;
MatrixA(15,3) = 0.00649851;
MatrixA(15,11) = -0.0121329;
MatrixA(15,15) = -0.00423428;
MatrixA(15,20) = 0.000295073;
MatrixA(15,21) = 1.83692;
MatrixA(15,22) = 1.21092e-06;
MatrixA(15,23) = -2.29412;
MatrixA(15,24) = -0.000161238;
MatrixA(15,25) = 1.01317;
MatrixA(15,29) = -0.315916;
MatrixA(16,1) = 0.364727;
MatrixA(16,2) = 0.0110826;
MatrixA(16,3) = 0.252582;
MatrixA(16,8) = 0.354597;
MatrixA(16,16) = -0.0603497;
MatrixA(16,20) = -17.857;
MatrixA(16,21) = 0.0630393;
MatrixA(16,22) = -0.0732819;
MatrixA(16,23) = 12.7471;
MatrixA(16,24) = 9.75774;
MatrixA(16,25) = -0.0178647;
MatrixA(16,26) = -0.51935;
MatrixA(16,30) = 5.07148;
MatrixA(17,1) = 0.364727;
MatrixA(17,2) = 0.0110826;
MatrixA(17,3) = -0.22531;
MatrixA(17,9) = 0.354597;
MatrixA(17,17) = -0.0603497;
MatrixA(17,20) = -17.857;
MatrixA(17,21) = -0.0630393;
MatrixA(17,22) = -0.0732819;
MatrixA(17,23) = -12.7471;
MatrixA(17,24) = 9.75774;
MatrixA(17,25) = 0.0178647;
MatrixA(17,27) = -0.51935;
MatrixA(17,31) = 5.07148;
MatrixA(18,1) = 3.34022;
MatrixA(18,2) = 8.98148;
MatrixA(18,3) = 2.23044;
MatrixA(18,10) = 3.31619;
MatrixA(18,18) = -1.21037;
MatrixA(18,20) = -19.9938;
MatrixA(18,21) = -0.00063467;
MatrixA(18,22) = -0.0820507;
MatrixA(18,23) = 13.7514;
MatrixA(18,24) = 10.9253;
MatrixA(18,25) = -0.0567799;
MatrixA(18,28) = 2.29488;
MatrixA(18,32) = 5.67829;
MatrixA(19,1) = 3.34022;
MatrixA(19,2) = 8.98148;
MatrixA(19,3) = -1.97721;
MatrixA(19,11) = 3.31619;
MatrixA(19,19) = -1.21037;
MatrixA(19,20) = -19.9938;
MatrixA(19,21) = 0.00063467;
MatrixA(19,22) = -0.0820507;
MatrixA(19,23) = -13.7514;
MatrixA(19,24) = 10.9253;
MatrixA(19,25) = 0.0567799;
MatrixA(19,29) = 2.29488;
MatrixA(19,33) = 5.67829;
MatrixA(20,1) = -38.4282;
MatrixA(20,2) = -4.7759;
MatrixA(20,3) = 0.245481;
MatrixA(20,8) = -18.4303;
MatrixA(20,9) = -18.4303;
MatrixA(20,10) = -2.947;
MatrixA(20,11) = -2.947;
MatrixA(20,12) = -0.406927;
MatrixA(20,13) = 0.309556;
MatrixA(20,14) = -0.390311;
MatrixA(20,15) = 0.58907;
MatrixA(20,16) = 63.0123;
MatrixA(20,17) = 63.0123;
MatrixA(20,18) = 56.4678;
MatrixA(20,19) = 56.4678;
MatrixA(20,20) = -0.000177239;
MatrixA(20,21) = -5.52074e-07;
MatrixA(20,22) = -0.000514878;
MatrixA(20,23) = -1.12306e-05;
MatrixA(20,24) = -4.91809e-05;
MatrixA(20,25) = -2.05914e-06;
MatrixA(20,26) = -0.252385;
MatrixA(20,27) = -0.252385;
MatrixA(20,28) = -0.50674;
MatrixA(20,29) = -0.50674;
MatrixA(20,30) = 0.00605567;
MatrixA(20,31) = 0.00605567;
MatrixA(20,32) = -4.03844e-12;
MatrixA(20,33) = -4.01068e-12;
MatrixA(21,1) = 2.15464e-12;
MatrixA(21,2) = -3.58752e-12;
MatrixA(21,3) = 19.2087;
MatrixA(21,8) = -6.40004;
MatrixA(21,9) = 6.40004;
MatrixA(21,10) = 17.1873;
MatrixA(21,11) = -17.1873;
MatrixA(21,12) = -38.0149;
MatrixA(21,13) = -38.0783;
MatrixA(21,14) = -33.8419;
MatrixA(21,15) = -33.8455;
MatrixA(21,16) = -0.723048;
MatrixA(21,17) = 0.723048;
MatrixA(21,18) = -0.555449;
MatrixA(21,19) = 0.555449;
MatrixA(21,20) = -5.60324e-14;
MatrixA(21,21) = -5.91573e-06;
MatrixA(21,22) = -2.73134e-14;
MatrixA(21,23) = -0.00246966;
MatrixA(21,24) = 1.5765e-14;
MatrixA(21,25) = 0.000116656;
MatrixA(21,26) = -0.761519;
MatrixA(21,27) = 0.761519;
MatrixA(21,28) = -0.109029;
MatrixA(21,29) = 0.109029;
MatrixA(21,30) = -1.38817e-09;
MatrixA(21,31) = 1.38812e-09;
MatrixA(21,32) = -3.31395e-09;
MatrixA(21,33) = 3.31395e-09;
MatrixA(22,1) = -4.82396;
MatrixA(22,2) = -11.2893;
MatrixA(22,3) = 0.0907837;
MatrixA(22,8) = 23.573;
MatrixA(22,9) = 23.573;
MatrixA(22,10) = 20.6495;
MatrixA(22,11) = 20.6495;
MatrixA(22,12) = 1.575;
MatrixA(22,13) = -1.57515;
MatrixA(22,14) = 7.38042;
MatrixA(22,15) = -7.35567;
MatrixA(22,16) = -1.55392;
MatrixA(22,17) = -1.55392;
MatrixA(22,18) = 7.38309;
MatrixA(22,19) = 7.38309;
MatrixA(22,20) = 0.00556144;
MatrixA(22,21) = 2.95948e-07;
MatrixA(22,22) = 2.07346e-05;
MatrixA(22,23) = -2.04487e-05;
MatrixA(22,24) = -0.000276571;
MatrixA(22,25) = -3.52034e-06;
MatrixA(22,26) = 7.62219;
MatrixA(22,27) = 7.62219;
MatrixA(22,28) = 7.20083;
MatrixA(22,29) = 7.20083;
MatrixA(22,30) = 2.90518e-05;
MatrixA(22,31) = 2.90518e-05;
MatrixA(22,32) = 9.82877e-11;
MatrixA(22,33) = 9.80184e-11;
MatrixA(23,1) = 1.44589e-10;
MatrixA(23,2) = 1.62659e-11;
MatrixA(23,3) = -14.1393;
MatrixA(23,8) = 7.2879;
MatrixA(23,9) = -7.2879;
MatrixA(23,10) = -19.3831;
MatrixA(23,11) = 19.3831;
MatrixA(23,12) = -38.7488;
MatrixA(23,13) = -38.8737;
MatrixA(23,14) = 39.4556;
MatrixA(23,15) = 39.5838;
MatrixA(23,16) = -39.5208;
MatrixA(23,17) = 39.5208;
MatrixA(23,18) = -34.5796;
MatrixA(23,19) = 34.5796;
MatrixA(23,20) = -3.90148e-14;
MatrixA(23,21) = -0.000116464;
MatrixA(23,22) = -4.84761e-15;
MatrixA(23,23) = -0.0250684;
MatrixA(23,24) = 2.41754e-14;
MatrixA(23,25) = -0.000417578;
MatrixA(23,26) = -0.206284;
MatrixA(23,27) = 0.206284;
MatrixA(23,28) = -0.0383419;
MatrixA(23,29) = 0.0383419;
MatrixA(23,30) = 3.14388e-08;
MatrixA(23,31) = -3.14388e-08;
MatrixA(23,32) = -1.45324e-07;
MatrixA(23,33) = 1.45324e-07;
MatrixA(24,1) = 4.98764;
MatrixA(24,2) = -10.4386;
MatrixA(24,3) = 0.0221173;
MatrixA(24,8) = -20.6036;
MatrixA(24,9) = -20.6036;
MatrixA(24,10) = 26.586;
MatrixA(24,11) = 26.586;
MatrixA(24,12) = -1.57811;
MatrixA(24,13) = 1.60606;
MatrixA(24,14) = 9.33896;
MatrixA(24,15) = -9.36203;
MatrixA(24,16) = -16.3131;
MatrixA(24,17) = -16.3131;
MatrixA(24,18) = -6.11395;
MatrixA(24,19) = -6.11395;
MatrixA(24,20) = -0.00612237;
MatrixA(24,21) = -5.77743e-07;
MatrixA(24,22) = -2.51525e-05;
MatrixA(24,23) = -1.76865e-05;
MatrixA(24,24) = 0.00332824;
MatrixA(24,25) = -8.16153e-06;
MatrixA(24,26) = -8.36674;
MatrixA(24,27) = -8.36674;
MatrixA(24,28) = 9.14634;
MatrixA(24,29) = 9.14634;
MatrixA(24,30) = 0.202084;
MatrixA(24,31) = 0.202084;
MatrixA(24,32) = 2.21101e-10;
MatrixA(24,33) = 2.20747e-10;
MatrixA(25,1) = 6.0494e-12;
MatrixA(25,2) = -8.20244e-12;
MatrixA(25,3) = 31.4862;
MatrixA(25,8) = 77.0204;
MatrixA(25,9) = -77.0204;
MatrixA(25,10) = 85.134;
MatrixA(25,11) = -85.134;
MatrixA(25,12) = -61.3876;
MatrixA(25,13) = -61.4914;
MatrixA(25,14) = -45.8998;
MatrixA(25,15) = -45.9606;
MatrixA(25,16) = -2.13649;
MatrixA(25,17) = 2.13649;
MatrixA(25,18) = 15.1147;
MatrixA(25,19) = -15.1147;
MatrixA(25,20) = 6.97596e-13;
MatrixA(25,21) = -3.68105e-05;
MatrixA(25,22) = 2.22422e-13;
MatrixA(25,23) = -0.0063762;
MatrixA(25,24) = -2.2573e-13;
MatrixA(25,25) = 2.13022e-05;
MatrixA(25,26) = 14.4429;
MatrixA(25,27) = -14.4429;
MatrixA(25,28) = 13.7123;
MatrixA(25,29) = -13.7123;
MatrixA(25,30) = 4.32982e-08;
MatrixA(25,31) = -4.32972e-08;
MatrixA(25,32) = 3.62185e-08;
MatrixA(25,33) = -3.6218e-08;
MatrixA(26,1) = -6312.56;
MatrixA(26,2) = 12.8192;
MatrixA(26,3) = -4508.57;
MatrixA(26,8) = -7077.77;
MatrixA(26,9) = 168.929;
MatrixA(26,10) = -51.3255;
MatrixA(26,11) = 68.6816;
MatrixA(26,12) = 4.70908;
MatrixA(26,13) = 43.9351;
MatrixA(26,14) = 35.7128;
MatrixA(26,15) = 29.8776;
MatrixA(26,16) = 7.81588;
MatrixA(26,17) = -16.9914;
MatrixA(26,18) = -26.6191;
MatrixA(26,19) = -2.71351;
MatrixA(26,20) = -0.0648143;
MatrixA(26,21) = 0.000207687;
MatrixA(26,22) = -0.000266272;
MatrixA(26,23) = 0.0411195;
MatrixA(26,24) = 0.0349841;
MatrixA(26,25) = -0.000322171;
MatrixA(26,26) = -184.546;
MatrixA(26,27) = -6.65137;
MatrixA(26,28) = -6.74057;
MatrixA(26,29) = 12.5081;
MatrixA(26,30) = 0.222304;
MatrixA(26,31) = 0.222304;
MatrixA(26,32) = -3.096e-08;
MatrixA(26,33) = 3.12501e-08;
MatrixA(27,1) = -6312.56;
MatrixA(27,2) = 12.8192;
MatrixA(27,3) = 4507.98;
MatrixA(27,8) = 168.929;
MatrixA(27,9) = -7077.77;
MatrixA(27,10) = 68.6816;
MatrixA(27,11) = -51.3255;
MatrixA(27,12) = -43.8369;
MatrixA(27,13) = -4.72909;
MatrixA(27,14) = -29.8822;
MatrixA(27,15) = -35.8124;
MatrixA(27,16) = -16.9914;
MatrixA(27,17) = 7.81588;
MatrixA(27,18) = -2.71351;
MatrixA(27,19) = -26.6191;
MatrixA(27,20) = -0.0648143;
MatrixA(27,21) = -0.000209537;
MatrixA(27,22) = -0.000266272;
MatrixA(27,23) = -0.0410845;
MatrixA(27,24) = 0.0349841;
MatrixA(27,25) = -0.000246368;
MatrixA(27,26) = -6.65137;
MatrixA(27,27) = -184.546;
MatrixA(27,28) = 12.5081;
MatrixA(27,29) = -6.74057;
MatrixA(27,30) = 0.222304;
MatrixA(27,31) = 0.222304;
MatrixA(27,32) = 3.12506e-08;
MatrixA(27,33) = -3.09598e-08;
MatrixA(28,1) = -6246.35;
MatrixA(28,2) = -14637.9;
MatrixA(28,3) = -4309.56;
MatrixA(28,8) = -52.4994;
MatrixA(28,9) = 53.7761;
MatrixA(28,10) = -6981.22;
MatrixA(28,11) = 156.204;
MatrixA(28,12) = 45.5306;
MatrixA(28,13) = 44.7766;
MatrixA(28,14) = -135.763;
MatrixA(28,15) = 53.8999;
MatrixA(28,16) = 30.4898;
MatrixA(28,17) = 28.1986;
MatrixA(28,18) = -161.944;
MatrixA(28,19) = 17.8604;
MatrixA(28,20) = 0.00360202;
MatrixA(28,21) = 2.53135e-05;
MatrixA(28,22) = 1.47978e-05;
MatrixA(28,23) = 0.00359498;
MatrixA(28,24) = -0.00215062;
MatrixA(28,25) = -0.000141003;
MatrixA(28,26) = -7.00026;
MatrixA(28,27) = 13.0234;
MatrixA(28,28) = -176.031;
MatrixA(28,29) = -9.04887;
MatrixA(28,30) = -0.253086;
MatrixA(28,31) = -0.253086;
MatrixA(28,32) = -2.8847e-08;
MatrixA(28,33) = 2.60804e-08;
MatrixA(29,1) = -6246.35;
MatrixA(29,2) = -14637.9;
MatrixA(29,3) = 4307.66;
MatrixA(29,8) = 53.7761;
MatrixA(29,9) = -52.4994;
MatrixA(29,10) = 156.204;
MatrixA(29,11) = -6981.22;
MatrixA(29,12) = -44.7472;
MatrixA(29,13) = -45.6525;
MatrixA(29,14) = -53.8281;
MatrixA(29,15) = 135.215;
MatrixA(29,16) = 28.1986;
MatrixA(29,17) = 30.4898;
MatrixA(29,18) = 17.8604;
MatrixA(29,19) = -161.944;
MatrixA(29,20) = 0.00360202;
MatrixA(29,21) = -2.45708e-05;
MatrixA(29,22) = 1.47978e-05;
MatrixA(29,23) = -0.00312306;
MatrixA(29,24) = -0.00215062;
MatrixA(29,25) = -0.000258847;
MatrixA(29,26) = 13.0234;
MatrixA(29,27) = -7.00026;
MatrixA(29,28) = -9.04887;
MatrixA(29,29) = -176.031;
MatrixA(29,30) = -0.253086;
MatrixA(29,31) = -0.253086;
MatrixA(29,32) = 2.608e-08;
MatrixA(29,33) = -2.88405e-08;
MatrixA(30,1) = 4524.93;
MatrixA(30,2) = 4.83945;
MatrixA(30,3) = 4259;
MatrixA(30,8) = 5248.47;
MatrixA(30,9) = -706.545;
MatrixA(30,10) = -29.0904;
MatrixA(30,11) = -23.2752;
MatrixA(30,12) = 58.8948;
MatrixA(30,13) = 5.09744;
MatrixA(30,14) = -7.86842;
MatrixA(30,15) = 10.5605;
MatrixA(30,16) = -16383.6;
MatrixA(30,17) = 2183.28;
MatrixA(30,18) = 5.12977;
MatrixA(30,19) = 5.73891;
MatrixA(30,20) = -181.059;
MatrixA(30,21) = 0.840982;
MatrixA(30,22) = -0.749267;
MatrixA(30,23) = 170.636;
MatrixA(30,24) = 100.136;
MatrixA(30,25) = -0.238306;
MatrixA(30,26) = -3.22883;
MatrixA(30,27) = 12.0353;
MatrixA(30,28) = -9.50574;
MatrixA(30,29) = -8.51899;
MatrixA(30,30) = -67.5405;
MatrixA(30,31) = -67.5405;
MatrixA(30,32) = -5.1309e-10;
MatrixA(30,33) = 8.45157e-11;
MatrixA(31,1) = 4524.93;
MatrixA(31,2) = 4.83945;
MatrixA(31,3) = -4259.13;
MatrixA(31,8) = -706.545;
MatrixA(31,9) = 5248.47;
MatrixA(31,10) = -23.2752;
MatrixA(31,11) = -29.0904;
MatrixA(31,12) = -8.48043;
MatrixA(31,13) = -33.5005;
MatrixA(31,14) = -10.5386;
MatrixA(31,15) = 7.88778;
MatrixA(31,16) = 2183.28;
MatrixA(31,17) = -16383.6;
MatrixA(31,18) = 5.73891;
MatrixA(31,19) = 5.12977;
MatrixA(31,20) = -181.059;
MatrixA(31,21) = -0.840948;
MatrixA(31,22) = -0.749267;
MatrixA(31,23) = -169.28;
MatrixA(31,24) = 100.136;
MatrixA(31,25) = 0.238299;
MatrixA(31,26) = 12.0353;
MatrixA(31,27) = -3.22883;
MatrixA(31,28) = -8.51899;
MatrixA(31,29) = -9.50574;
MatrixA(31,30) = -67.5405;
MatrixA(31,31) = -67.5405;
MatrixA(31,32) = 8.42382e-11;
MatrixA(31,33) = -5.12645e-10;
MatrixA(32,1) = -8108.39;
MatrixA(32,2) = -19313.4;
MatrixA(32,3) = -5506.22;
MatrixA(32,8) = 20.602;
MatrixA(32,9) = 20.6052;
MatrixA(32,10) = -8134.82;
MatrixA(32,11) = -26.5965;
MatrixA(32,12) = 1.59549;
MatrixA(32,13) = -1.58863;
MatrixA(32,14) = -47.4657;
MatrixA(32,15) = 9.34178;
MatrixA(32,16) = 16.3327;
MatrixA(32,17) = 16.2942;
MatrixA(32,18) = -16979.5;
MatrixA(32,19) = 6.09677;
MatrixA(32,20) = -214.958;
MatrixA(32,21) = -0.00687924;
MatrixA(32,22) = -0.889385;
MatrixA(32,23) = 149.719;
MatrixA(32,24) = 118.85;
MatrixA(32,25) = -0.615466;
MatrixA(32,26) = 8.36724;
MatrixA(32,27) = 8.3663;
MatrixA(32,28) = 15.7487;
MatrixA(32,29) = -9.14693;
MatrixA(32,30) = -0.202087;
MatrixA(32,31) = -0.202087;
MatrixA(32,32) = -1.49658e-10;
MatrixA(32,33) = -2.92877e-10;
MatrixA(33,1) = -8108.39;
MatrixA(33,2) = -19313.4;
MatrixA(33,3) = 5431.37;
MatrixA(33,8) = 20.6052;
MatrixA(33,9) = 20.602;
MatrixA(33,10) = -26.5965;
MatrixA(33,11) = -8134.82;
MatrixA(33,12) = 1.56073;
MatrixA(33,13) = -1.6235;
MatrixA(33,14) = -9.31877;
MatrixA(33,15) = -12.2721;
MatrixA(33,16) = 16.2942;
MatrixA(33,17) = 16.3327;
MatrixA(33,18) = 6.09677;
MatrixA(33,19) = -16979.5;
MatrixA(33,20) = -214.958;
MatrixA(33,21) = 0.0068804;
MatrixA(33,22) = -0.889385;
MatrixA(33,23) = -148.263;
MatrixA(33,24) = 118.85;
MatrixA(33,25) = 0.615507;
MatrixA(33,26) = 8.3663;
MatrixA(33,27) = 8.36724;
MatrixA(33,28) = -9.14693;
MatrixA(33,29) = 15.7487;
MatrixA(33,30) = -0.202087;
MatrixA(33,31) = -0.202087;
MatrixA(33,32) = -2.93543e-10;
MatrixA(33,33) = -1.4988e-10;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -0.000179264;
MatrixB(13,1) = -0.000179263;
MatrixB(16,1) = -6.0799e-05;
MatrixB(17,1) = 6.08743e-05;
MatrixB(20,1) = -1.97911e-06;
MatrixB(21,1) = 0.0243152;
MatrixB(22,1) = 2.38792e-05;
MatrixB(23,1) = -0.0329578;
MatrixB(24,1) = -7.48328e-05;
MatrixB(25,1) = 0.0321543;
MatrixB(26,1) = 1.12982;
MatrixB(27,1) = -1.13024;
MatrixB(28,1) = -0.0244242;
MatrixB(29,1) = 0.0245649;
MatrixB(30,1) = -1.05846;
MatrixB(31,1) = 1.0584;
MatrixB(32,1) = 9.17246e-05;
MatrixB(33,1) = 5.79426e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = 6.88969e-13;
MatrixC(2,2) = -4.10897e-12;
MatrixC(2,3) = 4.83228;
MatrixC(2,8) = 5.10322;
MatrixC(2,9) = -5.10322;
MatrixC(2,10) = 0.283995;
MatrixC(2,11) = -0.283995;
MatrixC(2,12) = -39.944;
MatrixC(2,13) = -40.0099;
MatrixC(2,14) = -36.6389;
MatrixC(2,15) = -36.645;
MatrixC(2,16) = -0.331978;
MatrixC(2,17) = 0.331978;
MatrixC(2,18) = 0.0206943;
MatrixC(2,19) = -0.0206943;
MatrixC(2,20) = -1.42447e-14;
MatrixC(2,21) = -6.32886e-06;
MatrixC(2,22) = -1.45035e-14;
MatrixC(2,23) = 4.00813e-08;
MatrixC(2,24) = 1.44229e-14;
MatrixC(2,25) = -2.51142e-07;
MatrixC(2,26) = 4.8114e-08;
MatrixC(2,27) = -4.8114e-08;
MatrixC(2,28) = -1.53236e-08;
MatrixC(2,29) = 1.53236e-08;
MatrixC(2,30) = 1.9404e-16;
MatrixC(2,31) = -1.60717e-16;
MatrixC(2,32) = -6.51449e-16;
MatrixC(2,33) = 6.04805e-16;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0234577;
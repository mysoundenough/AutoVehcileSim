% MATLAB linearized CarSim 2024.1 model, calculated at t = 45.0035 s.
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

MatrixA(1,2) = -5.55555;
MatrixA(1,3) = -1.22637e-05;
MatrixA(1,20) = -0.00441498;
MatrixA(1,22) = 0.99999;
MatrixA(1,24) = -1.09761;
MatrixA(2,3) = -5.0254e-12;
MatrixA(2,23) = 6.72647e-17;
MatrixA(2,24) = 1;
MatrixA(3,2) = 1.36386e-16;
MatrixA(3,3) = 4.43733e-11;
MatrixA(3,23) = 0.00441502;
MatrixA(3,24) = -2.96978e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 1.13573e-07;
MatrixA(12,2) = 0.0831111;
MatrixA(12,3) = 0.000323695;
MatrixA(12,8) = 1.20572;
MatrixA(12,12) = -9.75152;
MatrixA(12,20) = 1.36471e-10;
MatrixA(12,21) = 1.7339;
MatrixA(12,22) = 5.95547e-13;
MatrixA(12,23) = 1.90945;
MatrixA(12,24) = -7.4684e-11;
MatrixA(12,25) = 0.940339;
MatrixA(12,26) = 0.0587481;
MatrixA(13,1) = -1.13573e-07;
MatrixA(13,2) = -0.0831111;
MatrixA(13,3) = 0.000259691;
MatrixA(13,9) = -1.20572;
MatrixA(13,13) = -9.54096;
MatrixA(13,20) = -1.36483e-10;
MatrixA(13,21) = 1.7339;
MatrixA(13,22) = -6.13594e-13;
MatrixA(13,23) = 1.90945;
MatrixA(13,24) = 7.466e-11;
MatrixA(13,25) = 0.940339;
MatrixA(13,27) = -0.0587481;
MatrixA(14,1) = 6.41702e-08;
MatrixA(14,2) = 0.00111614;
MatrixA(14,3) = 3.20528e-08;
MatrixA(14,10) = -0.252032;
MatrixA(14,14) = -10.2131;
MatrixA(14,20) = 8.53573e-10;
MatrixA(14,21) = 1.83514;
MatrixA(14,22) = 3.76865e-12;
MatrixA(14,23) = -2.29169;
MatrixA(14,24) = -4.67065e-10;
MatrixA(14,25) = 1.01429;
MatrixA(14,28) = 0.321692;
MatrixA(15,1) = -6.41702e-08;
MatrixA(15,2) = -0.00111614;
MatrixA(15,3) = 7.6605e-08;
MatrixA(15,11) = 0.252032;
MatrixA(15,15) = -10.2134;
MatrixA(15,20) = -8.53572e-10;
MatrixA(15,21) = 1.83514;
MatrixA(15,22) = -3.76841e-12;
MatrixA(15,23) = -2.29169;
MatrixA(15,24) = 4.67065e-10;
MatrixA(15,25) = 1.01429;
MatrixA(15,29) = -0.321692;
MatrixA(16,1) = 2.87613e-07;
MatrixA(16,2) = 0.0499139;
MatrixA(16,3) = 1.54838e-05;
MatrixA(16,8) = 0.0419982;
MatrixA(16,16) = -166.667;
MatrixA(16,20) = -30.0028;
MatrixA(16,21) = 0.0590464;
MatrixA(16,22) = -0.132487;
MatrixA(16,23) = 12.0977;
MatrixA(16,24) = 9.27428;
MatrixA(16,25) = -0.0373662;
MatrixA(16,26) = -0.884694;
MatrixA(16,30) = 4.81222;
MatrixA(17,1) = 2.87613e-07;
MatrixA(17,2) = 0.0499139;
MatrixA(17,3) = -1.66422e-05;
MatrixA(17,9) = 0.0419982;
MatrixA(17,17) = -166.667;
MatrixA(17,20) = -30.0028;
MatrixA(17,21) = -0.104534;
MatrixA(17,22) = -0.132487;
MatrixA(17,23) = -21.4164;
MatrixA(17,24) = 9.27428;
MatrixA(17,25) = 0.0211095;
MatrixA(17,27) = -0.884694;
MatrixA(17,31) = 4.81222;
MatrixA(18,1) = 3.01454e-07;
MatrixA(18,2) = 0.083316;
MatrixA(18,3) = 2.07336e-07;
MatrixA(18,10) = 6.39111e-05;
MatrixA(18,18) = -102.524;
MatrixA(18,20) = -18.4002;
MatrixA(18,21) = -0.000102114;
MatrixA(18,22) = -0.0812374;
MatrixA(18,23) = 20.6244;
MatrixA(18,24) = 16.4136;
MatrixA(18,25) = -0.0559106;
MatrixA(18,28) = 3.47986;
MatrixA(18,32) = 8.52;
MatrixA(19,1) = 3.01454e-07;
MatrixA(19,2) = 0.083316;
MatrixA(19,3) = -2.07203e-07;
MatrixA(19,11) = 6.3911e-05;
MatrixA(19,19) = -102.524;
MatrixA(19,20) = -18.4002;
MatrixA(19,21) = 0.000166282;
MatrixA(19,22) = -0.0812374;
MatrixA(19,23) = -12.6511;
MatrixA(19,24) = 16.4136;
MatrixA(19,25) = 0.091137;
MatrixA(19,29) = 3.47986;
MatrixA(19,33) = 8.52;
MatrixA(20,1) = -51.3433;
MatrixA(20,2) = -129.318;
MatrixA(20,3) = 0.00788301;
MatrixA(20,8) = 1.24527;
MatrixA(20,9) = 1.24527;
MatrixA(20,10) = -29.095;
MatrixA(20,11) = -29.095;
MatrixA(20,12) = -0.211374;
MatrixA(20,13) = 0.211117;
MatrixA(20,14) = -0.500791;
MatrixA(20,15) = 0.55684;
MatrixA(20,16) = 62.6803;
MatrixA(20,17) = 62.6803;
MatrixA(20,18) = 56.5167;
MatrixA(20,19) = 56.5167;
MatrixA(20,20) = -0.00369644;
MatrixA(20,21) = -8.26238e-07;
MatrixA(20,22) = -1.63285e-05;
MatrixA(20,23) = -1.12484e-05;
MatrixA(20,24) = -0.0243868;
MatrixA(20,25) = -2.0791e-06;
MatrixA(20,26) = -0.251748;
MatrixA(20,27) = -0.251748;
MatrixA(20,28) = -0.515738;
MatrixA(20,29) = -0.515738;
MatrixA(20,30) = 0.00366034;
MatrixA(20,31) = 0.00366034;
MatrixA(20,32) = -5.32254e-15;
MatrixA(20,33) = -8.41273e-15;
MatrixA(21,1) = 1.74705e-13;
MatrixA(21,2) = -6.85878e-13;
MatrixA(21,3) = 30.9192;
MatrixA(21,8) = 1.60592;
MatrixA(21,9) = -1.60592;
MatrixA(21,10) = 17.5519;
MatrixA(21,11) = -17.5519;
MatrixA(21,12) = -37.8044;
MatrixA(21,13) = -37.8047;
MatrixA(21,14) = -33.3144;
MatrixA(21,15) = -33.3137;
MatrixA(21,16) = -0.653557;
MatrixA(21,17) = 0.653557;
MatrixA(21,18) = -0.562229;
MatrixA(21,19) = 0.562229;
MatrixA(21,20) = 1.14076e-14;
MatrixA(21,21) = -0.0128085;
MatrixA(21,22) = -2.47804e-14;
MatrixA(21,23) = -5.56509;
MatrixA(21,24) = -5.39244e-14;
MatrixA(21,25) = 0.0236787;
MatrixA(21,26) = -0.756316;
MatrixA(21,27) = 0.756316;
MatrixA(21,28) = -0.095633;
MatrixA(21,29) = 0.095633;
MatrixA(21,30) = 1.71908e-13;
MatrixA(21,31) = -1.96243e-13;
MatrixA(21,32) = 8.18309e-14;
MatrixA(21,33) = -8.12808e-14;
MatrixA(22,1) = -13.4742;
MatrixA(22,2) = -27.8293;
MatrixA(22,3) = 0.0600263;
MatrixA(22,8) = 22.6077;
MatrixA(22,9) = 22.6077;
MatrixA(22,10) = 16.8947;
MatrixA(22,11) = 16.8947;
MatrixA(22,12) = 1.75602;
MatrixA(22,13) = -1.75602;
MatrixA(22,14) = 7.36776;
MatrixA(22,15) = -7.3603;
MatrixA(22,16) = -1.56924;
MatrixA(22,17) = -1.56924;
MatrixA(22,18) = 7.48716;
MatrixA(22,19) = 7.48716;
MatrixA(22,20) = 0.00260509;
MatrixA(22,21) = 2.46851e-07;
MatrixA(22,22) = 1.15005e-05;
MatrixA(22,23) = -1.84656e-05;
MatrixA(22,24) = 5.55551;
MatrixA(22,25) = -3.73052e-06;
MatrixA(22,26) = 7.62621;
MatrixA(22,27) = 7.62621;
MatrixA(22,28) = 7.18107;
MatrixA(22,29) = 7.18107;
MatrixA(22,30) = 1.20403e-05;
MatrixA(22,31) = 1.20403e-05;
MatrixA(22,32) = 7.4109e-14;
MatrixA(22,33) = 1.17137e-13;
MatrixA(23,1) = -2.70117e-14;
MatrixA(23,2) = 6.32945e-13;
MatrixA(23,3) = 1.41697;
MatrixA(23,8) = 2.99761;
MatrixA(23,9) = -2.99761;
MatrixA(23,10) = -3.46799;
MatrixA(23,11) = 3.46799;
MatrixA(23,12) = -37.7466;
MatrixA(23,13) = -37.747;
MatrixA(23,14) = 39.7422;
MatrixA(23,15) = 39.7763;
MatrixA(23,16) = -39.251;
MatrixA(23,17) = 39.251;
MatrixA(23,18) = -34.604;
MatrixA(23,19) = 34.604;
MatrixA(23,20) = -3.01342e-15;
MatrixA(23,21) = -0.00513274;
MatrixA(23,22) = -7.13061e-15;
MatrixA(23,23) = 0.000720694;
MatrixA(23,24) = -4.15183e-14;
MatrixA(23,25) = -0.0757003;
MatrixA(23,26) = -0.207281;
MatrixA(23,27) = 0.207281;
MatrixA(23,28) = -0.0523347;
MatrixA(23,29) = 0.0523347;
MatrixA(23,30) = -2.36291e-12;
MatrixA(23,31) = 2.3564e-12;
MatrixA(23,32) = 3.6292e-12;
MatrixA(23,33) = -3.63065e-12;
MatrixA(24,1) = 1.18754;
MatrixA(24,2) = 2.90385;
MatrixA(24,3) = 0.0537388;
MatrixA(24,8) = -25.385;
MatrixA(24,9) = -25.385;
MatrixA(24,10) = 29.2985;
MatrixA(24,11) = 29.2985;
MatrixA(24,12) = -1.84587;
MatrixA(24,13) = 1.84595;
MatrixA(24,14) = 9.3533;
MatrixA(24,15) = -9.35928;
MatrixA(24,16) = -16.2402;
MatrixA(24,17) = -16.2402;
MatrixA(24,18) = -6.06973;
MatrixA(24,19) = -6.06973;
MatrixA(24,20) = -0.00263834;
MatrixA(24,21) = -9.3647e-07;
MatrixA(24,22) = -1.16473e-05;
MatrixA(24,23) = -2.07412e-05;
MatrixA(24,24) = -4.15287e-05;
MatrixA(24,25) = -8.29671e-06;
MatrixA(24,26) = -8.36766;
MatrixA(24,27) = -8.36766;
MatrixA(24,28) = 9.12405;
MatrixA(24,29) = 9.12405;
MatrixA(24,30) = 0.122318;
MatrixA(24,31) = 0.122318;
MatrixA(24,32) = 9.41604e-14;
MatrixA(24,33) = 1.4883e-13;
MatrixA(25,1) = 6.76811e-13;
MatrixA(25,2) = -2.74137e-13;
MatrixA(25,3) = 38.673;
MatrixA(25,8) = 89.2182;
MatrixA(25,9) = -89.2182;
MatrixA(25,10) = 77.2804;
MatrixA(25,11) = -77.2804;
MatrixA(25,12) = -60.7441;
MatrixA(25,13) = -60.7446;
MatrixA(25,14) = -45.1691;
MatrixA(25,15) = -45.1841;
MatrixA(25,16) = -2.05568;
MatrixA(25,17) = 2.05568;
MatrixA(25,18) = 15.3038;
MatrixA(25,19) = -15.3038;
MatrixA(25,20) = 9.15542e-15;
MatrixA(25,21) = -0.00802457;
MatrixA(25,22) = 4.93072e-13;
MatrixA(25,23) = 0.224533;
MatrixA(25,24) = 1.20518e-12;
MatrixA(25,25) = -0.0114186;
MatrixA(25,26) = 14.4454;
MatrixA(25,27) = -14.4454;
MatrixA(25,28) = 13.6883;
MatrixA(25,29) = -13.6883;
MatrixA(25,30) = -5.02601e-12;
MatrixA(25,31) = 5.49087e-12;
MatrixA(25,32) = -7.63957e-13;
MatrixA(25,33) = 6.81943e-13;
MatrixA(26,1) = -6292.6;
MatrixA(26,2) = 40.565;
MatrixA(26,3) = -4499.63;
MatrixA(26,8) = -7073.08;
MatrixA(26,9) = 172.958;
MatrixA(26,10) = -38.2174;
MatrixA(26,11) = 69.5782;
MatrixA(26,12) = 0.125699;
MatrixA(26,13) = 43.9755;
MatrixA(26,14) = 35.2631;
MatrixA(26,15) = 29.3697;
MatrixA(26,16) = 8.58198;
MatrixA(26,17) = -16.8874;
MatrixA(26,18) = -26.7976;
MatrixA(26,19) = -2.66628;
MatrixA(26,20) = -0.00546756;
MatrixA(26,21) = 0.00509501;
MatrixA(26,22) = -2.41372e-05;
MatrixA(26,23) = -0.0281089;
MatrixA(26,24) = -0.00166298;
MatrixA(26,25) = 0.0749837;
MatrixA(26,26) = -184.641;
MatrixA(26,27) = -6.65289;
MatrixA(26,28) = -6.73111;
MatrixA(26,29) = 12.4901;
MatrixA(26,30) = 0.13457;
MatrixA(26,31) = 0.13457;
MatrixA(26,32) = 7.05501e-13;
MatrixA(26,33) = -5.713e-13;
MatrixA(27,1) = -6292.6;
MatrixA(27,2) = 40.565;
MatrixA(27,3) = 4498.94;
MatrixA(27,8) = 172.958;
MatrixA(27,9) = -7073.08;
MatrixA(27,10) = 69.5782;
MatrixA(27,11) = -38.2174;
MatrixA(27,12) = -43.9751;
MatrixA(27,13) = -0.125737;
MatrixA(27,14) = -29.3725;
MatrixA(27,15) = -35.2896;
MatrixA(27,16) = -16.8874;
MatrixA(27,17) = 8.58198;
MatrixA(27,18) = -2.66628;
MatrixA(27,19) = -26.7976;
MatrixA(27,20) = -0.00546756;
MatrixA(27,21) = -0.00509755;
MatrixA(27,22) = -2.41372e-05;
MatrixA(27,23) = 0.0280853;
MatrixA(27,24) = -0.00166298;
MatrixA(27,25) = -0.0755519;
MatrixA(27,26) = -6.65289;
MatrixA(27,27) = -184.641;
MatrixA(27,28) = 12.4901;
MatrixA(27,29) = -6.73111;
MatrixA(27,30) = 0.13457;
MatrixA(27,31) = 0.13457;
MatrixA(27,32) = -6.46068e-13;
MatrixA(27,33) = 6.65239e-13;
MatrixA(28,1) = -6160.22;
MatrixA(28,2) = -14470;
MatrixA(28,3) = -4263.45;
MatrixA(28,8) = -52.3852;
MatrixA(28,9) = 72.1534;
MatrixA(28,10) = -6898.17;
MatrixA(28,11) = 147.774;
MatrixA(28,12) = 45.2837;
MatrixA(28,13) = 44.1371;
MatrixA(28,14) = -135.918;
MatrixA(28,15) = 53.4518;
MatrixA(28,16) = 30.3334;
MatrixA(28,17) = 28.2854;
MatrixA(28,18) = -164.055;
MatrixA(28,19) = 17.981;
MatrixA(28,20) = 0.00032636;
MatrixA(28,21) = 0.00648675;
MatrixA(28,22) = 1.44076e-06;
MatrixA(28,23) = 0.00248533;
MatrixA(28,24) = -6.65934e-05;
MatrixA(28,25) = -0.00390347;
MatrixA(28,26) = -7.00483;
MatrixA(28,27) = 13.0243;
MatrixA(28,28) = -175.57;
MatrixA(28,29) = -9.00775;
MatrixA(28,30) = -0.153118;
MatrixA(28,31) = -0.153118;
MatrixA(28,32) = -1.14481e-12;
MatrixA(28,33) = -8.14029e-13;
MatrixA(29,1) = -6160.22;
MatrixA(29,2) = -14470;
MatrixA(29,3) = 4262.1;
MatrixA(29,8) = 72.1534;
MatrixA(29,9) = -52.3852;
MatrixA(29,10) = 147.774;
MatrixA(29,11) = -6898.17;
MatrixA(29,12) = -44.1369;
MatrixA(29,13) = -45.2842;
MatrixA(29,14) = -53.4342;
MatrixA(29,15) = 135.755;
MatrixA(29,16) = 28.2854;
MatrixA(29,17) = 30.3334;
MatrixA(29,18) = 17.981;
MatrixA(29,19) = -164.055;
MatrixA(29,20) = 0.00032636;
MatrixA(29,21) = -0.00648508;
MatrixA(29,22) = 1.44076e-06;
MatrixA(29,23) = -0.00200281;
MatrixA(29,24) = -6.65934e-05;
MatrixA(29,25) = 0.00350535;
MatrixA(29,26) = 13.0243;
MatrixA(29,27) = -7.00483;
MatrixA(29,28) = -9.00775;
MatrixA(29,29) = -175.57;
MatrixA(29,30) = -0.153118;
MatrixA(29,31) = -0.153118;
MatrixA(29,32) = -7.60035e-13;
MatrixA(29,33) = -2.19677e-12;
MatrixA(30,1) = 349.266;
MatrixA(30,2) = -1.93224;
MatrixA(30,3) = 383.107;
MatrixA(30,8) = 427.753;
MatrixA(30,9) = -59.3328;
MatrixA(30,10) = -31.2908;
MatrixA(30,11) = -25.8617;
MatrixA(30,12) = 15.335;
MatrixA(30,13) = 2.34368;
MatrixA(30,14) = -7.91946;
MatrixA(30,15) = 10.5211;
MatrixA(30,16) = -16376.3;
MatrixA(30,17) = 2092.13;
MatrixA(30,18) = 5.08375;
MatrixA(30,19) = 5.70042;
MatrixA(30,20) = -0.0502382;
MatrixA(30,21) = 0.000543741;
MatrixA(30,22) = -0.000221804;
MatrixA(30,23) = 0.0464101;
MatrixA(30,24) = 0.0287609;
MatrixA(30,25) = 0.00406535;
MatrixA(30,26) = 1.7232;
MatrixA(30,27) = 10.0052;
MatrixA(30,28) = -9.47986;
MatrixA(30,29) = -8.50265;
MatrixA(30,30) = -41.3415;
MatrixA(30,31) = -41.3415;
MatrixA(30,32) = -9.04623e-14;
MatrixA(30,33) = -1.46052e-13;
MatrixA(31,1) = 349.266;
MatrixA(31,2) = -1.93224;
MatrixA(31,3) = -383.662;
MatrixA(31,8) = -59.3328;
MatrixA(31,9) = 427.753;
MatrixA(31,10) = -25.8617;
MatrixA(31,11) = -31.2908;
MatrixA(31,12) = -2.3523;
MatrixA(31,13) = -15.2675;
MatrixA(31,14) = -10.5155;
MatrixA(31,15) = 7.92447;
MatrixA(31,16) = 2092.13;
MatrixA(31,17) = -16376.3;
MatrixA(31,18) = 5.70042;
MatrixA(31,19) = 5.08375;
MatrixA(31,20) = -0.0502382;
MatrixA(31,21) = -0.000541984;
MatrixA(31,22) = -0.000221804;
MatrixA(31,23) = -0.0463697;
MatrixA(31,24) = 0.0287609;
MatrixA(31,25) = -0.00407489;
MatrixA(31,26) = 10.0052;
MatrixA(31,27) = 1.7232;
MatrixA(31,28) = -8.50265;
MatrixA(31,29) = -9.47986;
MatrixA(31,30) = -41.3415;
MatrixA(31,31) = -41.3415;
MatrixA(31,32) = -9.51184e-14;
MatrixA(31,33) = -1.47275e-13;
MatrixA(32,1) = -47.952;
MatrixA(32,2) = -126.843;
MatrixA(32,3) = -28.927;
MatrixA(32,8) = 25.3851;
MatrixA(32,9) = 25.3849;
MatrixA(32,10) = -76.1475;
MatrixA(32,11) = -29.299;
MatrixA(32,12) = 1.84887;
MatrixA(32,13) = -1.84295;
MatrixA(32,14) = -17.6684;
MatrixA(32,15) = 9.35568;
MatrixA(32,16) = 16.2436;
MatrixA(32,17) = 16.2368;
MatrixA(32,18) = -16999.2;
MatrixA(32,19) = 6.06668;
MatrixA(32,20) = -0.059218;
MatrixA(32,21) = 1.00378e-06;
MatrixA(32,22) = -0.00026145;
MatrixA(32,23) = 0.0425514;
MatrixA(32,24) = 0.0338886;
MatrixA(32,25) = -0.000173182;
MatrixA(32,26) = 8.36775;
MatrixA(32,27) = 8.36759;
MatrixA(32,28) = -9.11714;
MatrixA(32,29) = -9.12415;
MatrixA(32,30) = -0.122318;
MatrixA(32,31) = -0.122318;
MatrixA(32,32) = -9.4484e-14;
MatrixA(32,33) = -1.48515e-13;
MatrixA(33,1) = -47.952;
MatrixA(33,2) = -126.843;
MatrixA(33,3) = 25.5053;
MatrixA(33,8) = 25.3849;
MatrixA(33,9) = 25.3851;
MatrixA(33,10) = -29.299;
MatrixA(33,11) = -76.1475;
MatrixA(33,12) = 1.84287;
MatrixA(33,13) = -1.84895;
MatrixA(33,14) = -9.34971;
MatrixA(33,15) = 0.80904;
MatrixA(33,16) = 16.2368;
MatrixA(33,17) = 16.2436;
MatrixA(33,18) = 6.06668;
MatrixA(33,19) = -16999.2;
MatrixA(33,20) = -0.059218;
MatrixA(33,21) = 8.69166e-07;
MatrixA(33,22) = -0.00026145;
MatrixA(33,23) = -0.0425099;
MatrixA(33,24) = 0.0338886;
MatrixA(33,25) = 0.000189775;
MatrixA(33,26) = 8.36759;
MatrixA(33,27) = 8.36775;
MatrixA(33,28) = -9.12415;
MatrixA(33,29) = -9.11714;
MatrixA(33,30) = -0.122318;
MatrixA(33,31) = -0.122318;
MatrixA(33,32) = -9.38436e-14;
MatrixA(33,33) = -1.49154e-13;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -0.45196;
MatrixB(13,1) = -0.451959;
MatrixB(16,1) = -0.0270647;
MatrixB(17,1) = 0.0154982;
MatrixB(20,1) = 9.62491e-08;
MatrixB(21,1) = 0.0032231;
MatrixB(22,1) = 2.24795e-07;
MatrixB(23,1) = -0.00393628;
MatrixB(24,1) = -1.50606e-07;
MatrixB(25,1) = -0.00326594;
MatrixB(26,1) = 1.09242;
MatrixB(27,1) = -1.09214;
MatrixB(28,1) = 0.00199074;
MatrixB(29,1) = -0.00199078;
MatrixB(30,1) = -0.103906;
MatrixB(31,1) = 0.10391;
MatrixB(32,1) = 4.76127e-07;
MatrixB(33,1) = -1.74916e-07;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = 6.08321e-13;
MatrixC(2,2) = 8.18839e-13;
MatrixC(2,3) = 15.871;
MatrixC(2,8) = 13.4129;
MatrixC(2,9) = -13.4129;
MatrixC(2,10) = -0.264788;
MatrixC(2,11) = 0.264788;
MatrixC(2,12) = -39.715;
MatrixC(2,13) = -39.7153;
MatrixC(2,14) = -36.0949;
MatrixC(2,15) = -36.0948;
MatrixC(2,16) = -0.263614;
MatrixC(2,17) = 0.263614;
MatrixC(2,18) = 0.000392176;
MatrixC(2,19) = -0.000392176;
MatrixC(2,20) = 1.4478e-14;
MatrixC(2,21) = -0.0130601;
MatrixC(2,22) = 1.91437e-17;
MatrixC(2,23) = 0.000166313;
MatrixC(2,24) = -1.44737e-14;
MatrixC(2,25) = -0.00056346;
MatrixC(2,26) = 1.34937e-05;
MatrixC(2,27) = -1.34937e-05;
MatrixC(2,28) = -4.05247e-05;
MatrixC(2,29) = 4.05247e-05;
MatrixC(2,30) = 6.1964e-20;
MatrixC(2,31) = -1.07227e-19;
MatrixC(2,32) = -1.96585e-19;
MatrixC(2,33) = 1.9687e-19;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.000781257;
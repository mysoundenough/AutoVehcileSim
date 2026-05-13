% MATLAB linearized CarSim 2024.1 model, calculated at t = 255.022 s.
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

MatrixA(1,2) = -44.4444;
MatrixA(1,3) = 8.3656e-05;
MatrixA(1,20) = 0.00376455;
MatrixA(1,22) = 0.999993;
MatrixA(1,24) = -1.10203;
MatrixA(2,3) = -5.83655e-13;
MatrixA(2,23) = -4.47198e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 1.19719e-15;
MatrixA(3,3) = -4.38541e-12;
MatrixA(3,23) = -0.00376458;
MatrixA(3,24) = -1.68351e-18;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 1.81594e-08;
MatrixA(12,2) = 0.444867;
MatrixA(12,3) = 0.000777039;
MatrixA(12,8) = 14.3193;
MatrixA(12,12) = -82.5441;
MatrixA(12,20) = 8.96096e-13;
MatrixA(12,21) = 1.84487;
MatrixA(12,23) = 2.02703;
MatrixA(12,24) = -4.86452e-13;
MatrixA(12,25) = 1.02789;
MatrixA(12,26) = 0.13102;
MatrixA(13,1) = -1.81607e-08;
MatrixA(13,2) = -0.444867;
MatrixA(13,3) = 0.00057497;
MatrixA(13,9) = -14.3193;
MatrixA(13,13) = -81.709;
MatrixA(13,20) = -9.21699e-13;
MatrixA(13,21) = 1.84487;
MatrixA(13,22) = -2.56028e-14;
MatrixA(13,23) = 2.02703;
MatrixA(13,24) = 4.35247e-13;
MatrixA(13,25) = 1.02789;
MatrixA(13,27) = -0.13102;
MatrixA(14,1) = 3.21876e-09;
MatrixA(14,2) = 0.149986;
MatrixA(14,3) = -1.92661e-05;
MatrixA(14,10) = -2.24206;
MatrixA(14,14) = -79.8627;
MatrixA(14,20) = 1.08826e-11;
MatrixA(14,21) = 1.79444;
MatrixA(14,22) = -4.04672e-14;
MatrixA(14,23) = -2.24588;
MatrixA(14,24) = -6.0156e-12;
MatrixA(14,25) = 0.98391;
MatrixA(14,28) = 0.292911;
MatrixA(15,1) = -3.21827e-09;
MatrixA(15,2) = -0.149986;
MatrixA(15,3) = -8.38045e-06;
MatrixA(15,11) = 2.24206;
MatrixA(15,15) = -79.9248;
MatrixA(15,20) = -1.08794e-11;
MatrixA(15,21) = 1.79444;
MatrixA(15,22) = 3.89107e-14;
MatrixA(15,23) = -2.24588;
MatrixA(15,24) = 6.0156e-12;
MatrixA(15,25) = 0.98391;
MatrixA(15,29) = -0.292911;
MatrixA(20,1) = -120.965;
MatrixA(20,2) = -128.605;
MatrixA(20,3) = -0.380948;
MatrixA(20,8) = -33.5099;
MatrixA(20,9) = -33.5099;
MatrixA(20,10) = -28.9191;
MatrixA(20,11) = -28.9191;
MatrixA(20,12) = -0.392912;
MatrixA(20,13) = 0.285509;
MatrixA(20,14) = -0.418167;
MatrixA(20,15) = 0.504851;
MatrixA(20,20) = -5.22374;
MatrixA(20,21) = -8.26741e-07;
MatrixA(20,22) = 0.0196656;
MatrixA(20,23) = 4.58122e-05;
MatrixA(20,24) = 3.04116;
MatrixA(20,25) = -1.79239e-06;
MatrixA(20,26) = -0.246014;
MatrixA(20,27) = -0.246014;
MatrixA(20,28) = -0.314809;
MatrixA(20,29) = -0.314809;
MatrixA(20,30) = 0.365929;
MatrixA(20,31) = 0.365929;
MatrixA(20,32) = 0.37145;
MatrixA(20,33) = 0.37145;
MatrixA(21,1) = -4.01133e-12;
MatrixA(21,2) = -4.69386e-12;
MatrixA(21,3) = 27.4103;
MatrixA(21,8) = 2.35866;
MatrixA(21,9) = -2.35866;
MatrixA(21,10) = 15.1648;
MatrixA(21,11) = -15.1648;
MatrixA(21,12) = -34.6181;
MatrixA(21,13) = -34.6648;
MatrixA(21,14) = -34.3293;
MatrixA(21,15) = -34.3236;
MatrixA(21,20) = 2.96192e-14;
MatrixA(21,21) = -0.102498;
MatrixA(21,22) = -1.17313e-14;
MatrixA(21,23) = -44.5575;
MatrixA(21,24) = 1.14202e-13;
MatrixA(21,25) = -0.173909;
MatrixA(21,26) = -0.58378;
MatrixA(21,27) = 0.58378;
MatrixA(21,28) = -0.14082;
MatrixA(21,29) = 0.14082;
MatrixA(21,30) = -0.00348022;
MatrixA(21,31) = 0.00348022;
MatrixA(21,32) = -0.00377228;
MatrixA(21,33) = 0.00377228;
MatrixA(22,1) = -9.83522;
MatrixA(22,2) = -24.9622;
MatrixA(22,3) = 0.0733803;
MatrixA(22,8) = 23.2102;
MatrixA(22,9) = 23.2102;
MatrixA(22,10) = 18.5052;
MatrixA(22,11) = 18.5052;
MatrixA(22,12) = 3.2652;
MatrixA(22,13) = -3.26586;
MatrixA(22,14) = 7.07073;
MatrixA(22,15) = -7.0587;
MatrixA(22,20) = -0.230287;
MatrixA(22,21) = 2.46082e-07;
MatrixA(22,22) = 0.000866957;
MatrixA(22,23) = -1.71372e-05;
MatrixA(22,24) = 44.583;
MatrixA(22,25) = -4.96093e-06;
MatrixA(22,26) = 7.62965;
MatrixA(22,27) = 7.62965;
MatrixA(22,28) = 7.21887;
MatrixA(22,29) = 7.21887;
MatrixA(22,30) = -0.011487;
MatrixA(22,31) = -0.011487;
MatrixA(22,32) = 0.0472326;
MatrixA(22,33) = 0.0472326;
MatrixA(23,1) = -3.85959e-13;
MatrixA(23,2) = -6.043e-12;
MatrixA(23,3) = 33.5836;
MatrixA(23,8) = 24.8935;
MatrixA(23,9) = -24.8935;
MatrixA(23,10) = -0.930231;
MatrixA(23,11) = 0.930231;
MatrixA(23,12) = -34.3542;
MatrixA(23,13) = -34.4682;
MatrixA(23,14) = 40.981;
MatrixA(23,15) = 41.0284;
MatrixA(23,20) = -1.02092e-13;
MatrixA(23,21) = -0.0433112;
MatrixA(23,22) = 1.22098e-14;
MatrixA(23,23) = -2.24557;
MatrixA(23,24) = 5.75518e-12;
MatrixA(23,25) = -0.625642;
MatrixA(23,26) = -0.0879978;
MatrixA(23,27) = 0.0879978;
MatrixA(23,28) = -0.153555;
MatrixA(23,29) = 0.153555;
MatrixA(23,30) = -0.228043;
MatrixA(23,31) = 0.228043;
MatrixA(23,32) = -0.227178;
MatrixA(23,33) = 0.227178;
MatrixA(24,1) = 20.7605;
MatrixA(24,2) = 5.79659;
MatrixA(24,3) = 0.145127;
MatrixA(24,8) = -15.2421;
MatrixA(24,9) = -15.2421;
MatrixA(24,10) = 31.1481;
MatrixA(24,11) = 31.1481;
MatrixA(24,12) = -3.48055;
MatrixA(24,13) = 3.51362;
MatrixA(24,14) = 8.95726;
MatrixA(24,15) = -8.9655;
MatrixA(24,20) = 0.952309;
MatrixA(24,21) = -9.37305e-07;
MatrixA(24,22) = -0.00358512;
MatrixA(24,23) = -2.94735e-05;
MatrixA(24,24) = -0.538055;
MatrixA(24,25) = -5.69179e-06;
MatrixA(24,26) = -8.36566;
MatrixA(24,27) = -8.36566;
MatrixA(24,28) = 9.11844;
MatrixA(24,29) = 9.11844;
MatrixA(24,30) = -0.0379056;
MatrixA(24,31) = -0.0379056;
MatrixA(24,32) = -0.0406638;
MatrixA(24,33) = -0.0406638;
MatrixA(25,1) = -6.49788e-12;
MatrixA(25,2) = -7.51814e-12;
MatrixA(25,3) = 30.8856;
MatrixA(25,8) = 84.9185;
MatrixA(25,9) = -84.9185;
MatrixA(25,10) = 77.7109;
MatrixA(25,11) = -77.7109;
MatrixA(25,12) = -54.1618;
MatrixA(25,13) = -54.2391;
MatrixA(25,14) = -46.9657;
MatrixA(25,15) = -46.9815;
MatrixA(25,20) = -1.92355e-12;
MatrixA(25,21) = -0.064607;
MatrixA(25,22) = 4.70035e-13;
MatrixA(25,23) = 2.17791;
MatrixA(25,24) = 1.34367e-13;
MatrixA(25,25) = -0.135924;
MatrixA(25,26) = 14.494;
MatrixA(25,27) = -14.494;
MatrixA(25,28) = 13.7445;
MatrixA(25,29) = -13.7445;
MatrixA(25,30) = -0.0177121;
MatrixA(25,31) = 0.0177121;
MatrixA(25,32) = 0.0958862;
MatrixA(25,33) = -0.0958862;
MatrixA(26,1) = -6286.6;
MatrixA(26,2) = 34.334;
MatrixA(26,3) = -4500.92;
MatrixA(26,8) = -7061.23;
MatrixA(26,9) = 181.425;
MatrixA(26,10) = -38.802;
MatrixA(26,11) = 71.4533;
MatrixA(26,12) = -36.5377;
MatrixA(26,13) = 45.121;
MatrixA(26,14) = 36.6815;
MatrixA(26,15) = 31.0274;
MatrixA(26,20) = 0.896208;
MatrixA(26,21) = 0.04591;
MatrixA(26,22) = -0.00337392;
MatrixA(26,23) = 0.00191017;
MatrixA(26,24) = -0.527688;
MatrixA(26,25) = 0.89259;
MatrixA(26,26) = -184.773;
MatrixA(26,27) = -6.55068;
MatrixA(26,28) = -6.90101;
MatrixA(26,29) = 12.6008;
MatrixA(26,30) = 0.105197;
MatrixA(26,31) = -0.0456609;
MatrixA(26,32) = -0.169039;
MatrixA(26,33) = -0.0268395;
MatrixA(27,1) = -6286.6;
MatrixA(27,2) = 34.334;
MatrixA(27,3) = 4500.35;
MatrixA(27,8) = 181.425;
MatrixA(27,9) = -7061.23;
MatrixA(27,10) = 71.4533;
MatrixA(27,11) = -38.802;
MatrixA(27,12) = -45.0289;
MatrixA(27,13) = 36.5682;
MatrixA(27,14) = -31.038;
MatrixA(27,15) = -36.7159;
MatrixA(27,20) = 0.896208;
MatrixA(27,21) = -0.0459125;
MatrixA(27,22) = -0.00337392;
MatrixA(27,23) = -0.00189698;
MatrixA(27,24) = -0.527688;
MatrixA(27,25) = -0.89314;
MatrixA(27,26) = -6.55068;
MatrixA(27,27) = -184.773;
MatrixA(27,28) = 12.6008;
MatrixA(27,29) = -6.90101;
MatrixA(27,30) = -0.0456609;
MatrixA(27,31) = 0.105197;
MatrixA(27,32) = -0.0268395;
MatrixA(27,33) = -0.169039;
MatrixA(28,1) = -6209.76;
MatrixA(28,2) = -14525.1;
MatrixA(28,3) = -4271.5;
MatrixA(28,8) = -66.5539;
MatrixA(28,9) = 51.7677;
MatrixA(28,10) = -6931.15;
MatrixA(28,11) = 144.192;
MatrixA(28,12) = 40.9671;
MatrixA(28,13) = 38.7168;
MatrixA(28,14) = -128.236;
MatrixA(28,15) = 53.5058;
MatrixA(28,20) = 2.23474;
MatrixA(28,21) = 0.0520256;
MatrixA(28,22) = -0.00841305;
MatrixA(28,23) = -2.91891;
MatrixA(28,24) = -1.23656;
MatrixA(28,25) = -0.00675413;
MatrixA(28,26) = -7.05546;
MatrixA(28,27) = 13.0579;
MatrixA(28,28) = -176.457;
MatrixA(28,29) = -9.01498;
MatrixA(28,30) = 0.111425;
MatrixA(28,31) = 0.0889157;
MatrixA(28,32) = -1.09931;
MatrixA(28,33) = 0.114489;
MatrixA(29,1) = -6209.76;
MatrixA(29,2) = -14525.1;
MatrixA(29,3) = 4269.92;
MatrixA(29,8) = 51.7677;
MatrixA(29,9) = -66.5539;
MatrixA(29,10) = 144.192;
MatrixA(29,11) = -6931.15;
MatrixA(29,12) = -38.7136;
MatrixA(29,13) = -41.0764;
MatrixA(29,14) = -53.4865;
MatrixA(29,15) = 127.961;
MatrixA(29,20) = 2.23474;
MatrixA(29,21) = -0.0520239;
MatrixA(29,22) = -0.00841305;
MatrixA(29,23) = 2.91932;
MatrixA(29,24) = -1.23656;
MatrixA(29,25) = 0.00634845;
MatrixA(29,26) = 13.0579;
MatrixA(29,27) = -7.05546;
MatrixA(29,28) = -9.01498;
MatrixA(29,29) = -176.457;
MatrixA(29,30) = 0.0889157;
MatrixA(29,31) = 0.111425;
MatrixA(29,32) = 0.114489;
MatrixA(29,33) = -1.09931;
MatrixA(30,1) = 8242.64;
MatrixA(30,2) = -2.32074;
MatrixA(30,3) = 7687.43;
MatrixA(30,8) = 9607.13;
MatrixA(30,9) = -1332.51;
MatrixA(30,10) = -32.5907;
MatrixA(30,11) = -28.5858;
MatrixA(30,12) = 71.379;
MatrixA(30,13) = 3.94445;
MatrixA(30,14) = -7.85071;
MatrixA(30,15) = 9.87779;
MatrixA(30,20) = 287.274;
MatrixA(30,21) = -0.570049;
MatrixA(30,22) = -1.08149;
MatrixA(30,23) = -270.265;
MatrixA(30,24) = -158.864;
MatrixA(30,25) = -1.29957;
MatrixA(30,26) = 10.8574;
MatrixA(30,27) = 7.70488;
MatrixA(30,28) = -9.37488;
MatrixA(30,29) = -8.66639;
MatrixA(30,30) = -113.807;
MatrixA(30,31) = -6.46063;
MatrixA(30,32) = 0.035956;
MatrixA(30,33) = 0.0386583;
MatrixA(31,1) = 8242.64;
MatrixA(31,2) = -2.32074;
MatrixA(31,3) = -7603.42;
MatrixA(31,8) = -1332.51;
MatrixA(31,9) = 9607.13;
MatrixA(31,10) = -28.5858;
MatrixA(31,11) = -32.5907;
MatrixA(31,12) = -7.8111;
MatrixA(31,13) = -43.5283;
MatrixA(31,14) = -9.87015;
MatrixA(31,15) = 7.85801;
MatrixA(31,20) = 287.274;
MatrixA(31,21) = 0.570051;
MatrixA(31,22) = -1.08149;
MatrixA(31,23) = 270.258;
MatrixA(31,24) = -158.864;
MatrixA(31,25) = 1.29956;
MatrixA(31,26) = 7.70488;
MatrixA(31,27) = 10.8574;
MatrixA(31,28) = -8.66639;
MatrixA(31,29) = -9.37488;
MatrixA(31,30) = -6.46063;
MatrixA(31,31) = -113.807;
MatrixA(31,32) = 0.0386583;
MatrixA(31,33) = 0.035956;
MatrixA(32,1) = -46.6239;
MatrixA(32,2) = -108.881;
MatrixA(32,3) = -13.2642;
MatrixA(32,8) = 15.2113;
MatrixA(32,9) = 15.2723;
MatrixA(32,10) = -57.0942;
MatrixA(32,11) = -31.1526;
MatrixA(32,12) = 3.52786;
MatrixA(32,13) = -3.46622;
MatrixA(32,14) = -19.2563;
MatrixA(32,15) = 8.90081;
MatrixA(32,20) = 392.284;
MatrixA(32,21) = 0.0439321;
MatrixA(32,22) = -1.47682;
MatrixA(32,23) = -270.703;
MatrixA(32,24) = -216.938;
MatrixA(32,25) = -0.993886;
MatrixA(32,26) = 8.36706;
MatrixA(32,27) = 8.36445;
MatrixA(32,28) = -55.7819;
MatrixA(32,29) = -9.12043;
MatrixA(32,30) = 0.0382501;
MatrixA(32,31) = 0.0375681;
MatrixA(32,32) = -111.7;
MatrixA(32,33) = 0.0403165;
MatrixA(33,1) = -46.6239;
MatrixA(33,2) = -108.881;
MatrixA(33,3) = 12.9879;
MatrixA(33,8) = 15.2723;
MatrixA(33,9) = 15.2113;
MatrixA(33,10) = -31.1526;
MatrixA(33,11) = -57.0942;
MatrixA(33,12) = 3.43331;
MatrixA(33,13) = -3.5611;
MatrixA(33,14) = -8.89264;
MatrixA(33,15) = -6.83132;
MatrixA(33,20) = 392.284;
MatrixA(33,21) = -0.0439302;
MatrixA(33,22) = -1.47682;
MatrixA(33,23) = 270.694;
MatrixA(33,24) = -216.938;
MatrixA(33,25) = 0.993897;
MatrixA(33,26) = 8.36445;
MatrixA(33,27) = 8.36706;
MatrixA(33,28) = -9.12043;
MatrixA(33,29) = -55.7819;
MatrixA(33,30) = 0.0375681;
MatrixA(33,31) = 0.0382501;
MatrixA(33,32) = 0.0403165;
MatrixA(33,33) = -111.7;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -3.84537;
MatrixB(13,1) = -3.84539;
MatrixB(20,1) = 0.000126449;
MatrixB(21,1) = 0.0321274;
MatrixB(22,1) = -3.78726e-06;
MatrixB(23,1) = 0.0273581;
MatrixB(24,1) = -3.35276e-05;
MatrixB(25,1) = 0.0488646;
MatrixB(26,1) = 1.21939;
MatrixB(27,1) = -1.21914;
MatrixB(28,1) = -0.0359645;
MatrixB(29,1) = 0.0360847;
MatrixB(30,1) = -0.976093;
MatrixB(31,1) = 0.947727;
MatrixB(32,1) = -3.66454e-06;
MatrixB(33,1) = 7.0724e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -4.36558e-12;
MatrixC(2,2) = -4.99252e-12;
MatrixC(2,3) = 4.69168;
MatrixC(2,8) = 6.06646;
MatrixC(2,9) = -6.06646;
MatrixC(2,10) = -0.539975;
MatrixC(2,11) = 0.539975;
MatrixC(2,12) = -36.3366;
MatrixC(2,13) = -36.385;
MatrixC(2,14) = -37.1251;
MatrixC(2,15) = -37.1199;
MatrixC(2,20) = -4.47956e-14;
MatrixC(2,21) = -0.104494;
MatrixC(2,22) = -5.62156e-15;
MatrixC(2,23) = -0.00524402;
MatrixC(2,24) = 1.66864e-14;
MatrixC(2,25) = -0.00462026;
MatrixC(2,26) = 7.40542e-05;
MatrixC(2,27) = -7.40542e-05;
MatrixC(2,28) = -0.00030426;
MatrixC(2,29) = 0.00030426;
MatrixC(2,30) = -0.00128074;
MatrixC(2,31) = 0.00128074;
MatrixC(2,32) = -2.70126e-05;
MatrixC(2,33) = 2.70126e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0336975;
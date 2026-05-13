% MATLAB linearized CarSim 2024.1 model, calculated at t = 150.011 s.
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

MatrixA(1,2) = -25;
MatrixA(1,3) = -2.30175e-05;
MatrixA(1,20) = -0.0018414;
MatrixA(1,22) = 0.999998;
MatrixA(1,24) = -1.099;
MatrixA(2,3) = -4.59508e-13;
MatrixA(2,23) = -1.90051e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 7.49978e-16;
MatrixA(3,3) = 1.68952e-12;
MatrixA(3,23) = 0.0018414;
MatrixA(3,24) = 3.49961e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 1.12979e-08;
MatrixA(12,2) = 0.33845;
MatrixA(12,3) = 0.00111522;
MatrixA(12,8) = 6.20365;
MatrixA(12,12) = -44.5737;
MatrixA(12,20) = 2.15409e-12;
MatrixA(12,21) = 1.76385;
MatrixA(12,22) = -2.44782e-14;
MatrixA(12,23) = 1.94106;
MatrixA(12,24) = -1.27287e-12;
MatrixA(12,25) = 0.964822;
MatrixA(12,26) = 0.0804228;
MatrixA(13,1) = -1.12986e-08;
MatrixA(13,2) = -0.33845;
MatrixA(13,3) = 0.000878423;
MatrixA(13,9) = -6.20365;
MatrixA(13,13) = -43.7471;
MatrixA(13,20) = -2.17856e-12;
MatrixA(13,21) = 1.76385;
MatrixA(13,22) = 2.44782e-14;
MatrixA(13,23) = 1.94106;
MatrixA(13,24) = 1.19943e-12;
MatrixA(13,25) = 0.964822;
MatrixA(13,27) = -0.0804228;
MatrixA(14,1) = 2.55567e-09;
MatrixA(14,2) = 0.0308996;
MatrixA(14,3) = -1.74676e-06;
MatrixA(14,10) = -1.17735;
MatrixA(14,14) = -45.6353;
MatrixA(14,20) = 1.55839e-11;
MatrixA(14,21) = 1.82242;
MatrixA(14,22) = 2.8255e-14;
MatrixA(14,23) = -2.27741;
MatrixA(14,24) = -8.55573e-12;
MatrixA(14,25) = 1.00475;
MatrixA(14,28) = 0.312547;
MatrixA(15,1) = -2.55523e-09;
MatrixA(15,2) = -0.0308996;
MatrixA(15,3) = -3.97244e-08;
MatrixA(15,11) = 1.17735;
MatrixA(15,15) = -45.6468;
MatrixA(15,20) = -1.55827e-11;
MatrixA(15,21) = 1.82242;
MatrixA(15,22) = -2.88478e-14;
MatrixA(15,23) = -2.27741;
MatrixA(15,24) = 8.55435e-12;
MatrixA(15,25) = 1.00475;
MatrixA(15,29) = -0.312547;
MatrixA(20,1) = -70.6263;
MatrixA(20,2) = -128.244;
MatrixA(20,3) = 0.00434163;
MatrixA(20,8) = -8.50273;
MatrixA(20,9) = -8.50273;
MatrixA(20,10) = -28.8939;
MatrixA(20,11) = -28.8939;
MatrixA(20,12) = -0.324854;
MatrixA(20,13) = 0.329443;
MatrixA(20,14) = -0.471094;
MatrixA(20,15) = 0.543116;
MatrixA(20,20) = -9.46171;
MatrixA(20,21) = -8.23924e-07;
MatrixA(20,22) = -0.0174237;
MatrixA(20,23) = 0.0002285;
MatrixA(20,24) = 5.14064;
MatrixA(20,25) = -1.98902e-06;
MatrixA(20,26) = -0.308134;
MatrixA(20,27) = -0.308134;
MatrixA(20,28) = -0.234957;
MatrixA(20,29) = -0.234957;
MatrixA(20,30) = 0.694284;
MatrixA(20,31) = 0.694284;
MatrixA(20,32) = 0.647635;
MatrixA(20,33) = 0.647635;
MatrixA(21,1) = -1.54416e-12;
MatrixA(21,2) = -1.97445e-12;
MatrixA(21,3) = 30.1436;
MatrixA(21,8) = 2.0636;
MatrixA(21,9) = -2.0636;
MatrixA(21,10) = 16.8068;
MatrixA(21,11) = -16.8068;
MatrixA(21,12) = -36.7091;
MatrixA(21,13) = -36.7356;
MatrixA(21,14) = -33.6271;
MatrixA(21,15) = -33.6251;
MatrixA(21,20) = 2.61426e-14;
MatrixA(21,21) = -0.0578113;
MatrixA(21,22) = 3.63195e-15;
MatrixA(21,23) = -25.118;
MatrixA(21,24) = -1.43413e-14;
MatrixA(21,25) = 0.0423906;
MatrixA(21,26) = -0.701133;
MatrixA(21,27) = 0.701133;
MatrixA(21,28) = -0.112291;
MatrixA(21,29) = 0.112291;
MatrixA(21,30) = -0.008571;
MatrixA(21,31) = 0.008571;
MatrixA(21,32) = -0.00647944;
MatrixA(21,33) = 0.00647944;
MatrixA(22,1) = -12.5063;
MatrixA(22,2) = -26.8136;
MatrixA(22,3) = 0.0622836;
MatrixA(22,8) = 22.251;
MatrixA(22,9) = 22.251;
MatrixA(22,10) = 17.5707;
MatrixA(22,11) = 17.5707;
MatrixA(22,12) = 2.26161;
MatrixA(22,13) = -2.26325;
MatrixA(22,14) = 7.27674;
MatrixA(22,15) = -7.26706;
MatrixA(22,20) = -0.452941;
MatrixA(22,21) = 2.46598e-07;
MatrixA(22,22) = -0.000834087;
MatrixA(22,23) = -8.90094e-06;
MatrixA(22,24) = 25.2552;
MatrixA(22,25) = -4.11265e-06;
MatrixA(22,26) = 7.63032;
MatrixA(22,27) = 7.63032;
MatrixA(22,28) = 7.22171;
MatrixA(22,29) = 7.22171;
MatrixA(22,30) = -0.0186682;
MatrixA(22,31) = -0.0186682;
MatrixA(22,32) = 0.0847171;
MatrixA(22,33) = 0.0847171;
MatrixA(23,1) = 1.30343e-12;
MatrixA(23,2) = 2.34959e-12;
MatrixA(23,3) = 10.8683;
MatrixA(23,8) = 9.34401;
MatrixA(23,9) = -9.34401;
MatrixA(23,10) = -2.77871;
MatrixA(23,11) = 2.77871;
MatrixA(23,12) = -36.5465;
MatrixA(23,13) = -36.5709;
MatrixA(23,14) = 40.1216;
MatrixA(23,15) = 40.1643;
MatrixA(23,20) = -1.94764e-14;
MatrixA(23,21) = -0.0319683;
MatrixA(23,22) = -3.19808e-14;
MatrixA(23,23) = -4.10618;
MatrixA(23,24) = -2.96678e-14;
MatrixA(23,25) = -0.342655;
MatrixA(23,26) = -0.13852;
MatrixA(23,27) = 0.13852;
MatrixA(23,28) = -0.225186;
MatrixA(23,29) = 0.225186;
MatrixA(23,30) = -0.43527;
MatrixA(23,31) = 0.43527;
MatrixA(23,32) = -0.396393;
MatrixA(23,33) = 0.396393;
MatrixA(24,1) = 6.68014;
MatrixA(24,2) = 3.73071;
MatrixA(24,3) = 0.0489868;
MatrixA(24,8) = -22.0442;
MatrixA(24,9) = -22.0442;
MatrixA(24,10) = 30.0513;
MatrixA(24,11) = 30.0513;
MatrixA(24,12) = -2.37813;
MatrixA(24,13) = 2.37857;
MatrixA(24,14) = 9.23086;
MatrixA(24,15) = -9.23831;
MatrixA(24,20) = 1.75859;
MatrixA(24,21) = -9.37561e-07;
MatrixA(24,22) = 0.00323848;
MatrixA(24,23) = -7.26198e-05;
MatrixA(24,24) = -0.972197;
MatrixA(24,25) = -7.48158e-06;
MatrixA(24,26) = -8.35135;
MatrixA(24,27) = -8.35135;
MatrixA(24,28) = 9.09909;
MatrixA(24,29) = 9.09909;
MatrixA(24,30) = -0.122013;
MatrixA(24,31) = -0.122013;
MatrixA(24,32) = -0.0699766;
MatrixA(24,33) = -0.0699766;
MatrixA(25,1) = -2.41227e-12;
MatrixA(25,2) = -4.09076e-12;
MatrixA(25,3) = 36.5155;
MatrixA(25,8) = 87.1359;
MatrixA(25,9) = -87.1359;
MatrixA(25,10) = 77.7503;
MatrixA(25,11) = -77.7503;
MatrixA(25,12) = -58.4856;
MatrixA(25,13) = -58.528;
MatrixA(25,14) = -45.7217;
MatrixA(25,15) = -45.7393;
MatrixA(25,20) = -1.13789e-12;
MatrixA(25,21) = -0.0367689;
MatrixA(25,22) = -5.67341e-13;
MatrixA(25,23) = 1.71354;
MatrixA(25,24) = 2.06454e-13;
MatrixA(25,25) = -0.0619511;
MatrixA(25,26) = 14.4565;
MatrixA(25,27) = -14.4565;
MatrixA(25,28) = 13.7665;
MatrixA(25,29) = -13.7665;
MatrixA(25,30) = -0.028595;
MatrixA(25,31) = 0.028595;
MatrixA(25,32) = 0.172805;
MatrixA(25,33) = -0.172805;
MatrixA(26,1) = -6290.63;
MatrixA(26,2) = 38.2807;
MatrixA(26,3) = -4499.95;
MatrixA(26,8) = -7058.43;
MatrixA(26,9) = 175.674;
MatrixA(26,10) = -38.6264;
MatrixA(26,11) = 70.4317;
MatrixA(26,12) = -12.1692;
MatrixA(26,13) = 44.312;
MatrixA(26,14) = 35.7023;
MatrixA(26,15) = 29.8833;
MatrixA(26,20) = 1.54698;
MatrixA(26,21) = 0.0266597;
MatrixA(26,22) = 0.00284887;
MatrixA(26,23) = -0.0215584;
MatrixA(26,24) = -0.869263;
MatrixA(26,25) = 0.396547;
MatrixA(26,26) = -184.715;
MatrixA(26,27) = -6.61292;
MatrixA(26,28) = -6.88947;
MatrixA(26,29) = 12.5174;
MatrixA(26,30) = 0.153718;
MatrixA(26,31) = -0.130934;
MatrixA(26,32) = -0.303256;
MatrixA(26,33) = -0.0356574;
MatrixA(27,1) = -6290.63;
MatrixA(27,2) = 38.2807;
MatrixA(27,3) = 4499.22;
MatrixA(27,8) = 175.674;
MatrixA(27,9) = -7058.43;
MatrixA(27,10) = 70.4317;
MatrixA(27,11) = -38.6264;
MatrixA(27,12) = -44.2813;
MatrixA(27,13) = 12.1758;
MatrixA(27,14) = -29.8884;
MatrixA(27,15) = -35.7348;
MatrixA(27,20) = 1.54698;
MatrixA(27,21) = -0.0266622;
MatrixA(27,22) = 0.00284887;
MatrixA(27,23) = 0.0214131;
MatrixA(27,24) = -0.869263;
MatrixA(27,25) = -0.39711;
MatrixA(27,26) = -6.61292;
MatrixA(27,27) = -184.715;
MatrixA(27,28) = 12.5174;
MatrixA(27,29) = -6.88947;
MatrixA(27,30) = -0.130934;
MatrixA(27,31) = 0.153718;
MatrixA(27,32) = -0.0356574;
MatrixA(27,33) = -0.303256;
MatrixA(28,1) = -6175.09;
MatrixA(28,2) = -14488.6;
MatrixA(28,3) = -4266.52;
MatrixA(28,8) = -55.879;
MatrixA(28,9) = 65.677;
MatrixA(28,10) = -6912.65;
MatrixA(28,11) = 146.514;
MatrixA(28,12) = 43.7745;
MatrixA(28,13) = 42.3406;
MatrixA(28,14) = -133.562;
MatrixA(28,15) = 53.4714;
MatrixA(28,20) = 3.63977;
MatrixA(28,21) = 0.0297085;
MatrixA(28,22) = 0.00670245;
MatrixA(28,23) = -4.99728;
MatrixA(28,24) = -1.99798;
MatrixA(28,25) = -0.000899553;
MatrixA(28,26) = -7.04723;
MatrixA(28,27) = 13.0026;
MatrixA(28,28) = -176.488;
MatrixA(28,29) = -8.94028;
MatrixA(28,30) = 0.268507;
MatrixA(28,31) = 0.235953;
MatrixA(28,32) = -1.89156;
MatrixA(28,33) = 0.20403;
MatrixA(29,1) = -6175.09;
MatrixA(29,2) = -14488.6;
MatrixA(29,3) = 4265.21;
MatrixA(29,8) = 65.677;
MatrixA(29,9) = -55.879;
MatrixA(29,10) = 146.514;
MatrixA(29,11) = -6912.65;
MatrixA(29,12) = -42.3078;
MatrixA(29,13) = -43.8042;
MatrixA(29,14) = -53.4507;
MatrixA(29,15) = 133.347;
MatrixA(29,20) = 3.63977;
MatrixA(29,21) = -0.0297068;
MatrixA(29,22) = 0.00670245;
MatrixA(29,23) = 4.99768;
MatrixA(29,24) = -1.99798;
MatrixA(29,25) = 0.000499049;
MatrixA(29,26) = 13.0026;
MatrixA(29,27) = -7.04723;
MatrixA(29,28) = -8.94028;
MatrixA(29,29) = -176.488;
MatrixA(29,30) = 0.235953;
MatrixA(29,31) = 0.268507;
MatrixA(29,32) = 0.20403;
MatrixA(29,33) = -1.89156;
MatrixA(30,1) = 2602.09;
MatrixA(30,2) = -10.9616;
MatrixA(30,3) = 2505.39;
MatrixA(30,8) = 3049.28;
MatrixA(30,9) = -428.747;
MatrixA(30,10) = -31.8867;
MatrixA(30,11) = -26.8703;
MatrixA(30,12) = 46.5546;
MatrixA(30,13) = 6.19211;
MatrixA(30,14) = -7.89764;
MatrixA(30,15) = 10.3248;
MatrixA(30,20) = 544.041;
MatrixA(30,21) = -2.1022;
MatrixA(30,22) = 1.00186;
MatrixA(30,23) = -513.317;
MatrixA(30,24) = -298.715;
MatrixA(30,25) = -0.190162;
MatrixA(30,26) = 18.9752;
MatrixA(30,27) = 6.5073;
MatrixA(30,28) = -9.42812;
MatrixA(30,29) = -8.53171;
MatrixA(30,30) = -198.759;
MatrixA(30,31) = 5.32117;
MatrixA(30,32) = 0.0597064;
MatrixA(30,33) = 0.0659253;
MatrixA(31,1) = 2602.09;
MatrixA(31,2) = -10.9616;
MatrixA(31,3) = -2505.91;
MatrixA(31,8) = -428.747;
MatrixA(31,9) = 3049.28;
MatrixA(31,10) = -26.8703;
MatrixA(31,11) = -31.8867;
MatrixA(31,12) = -6.03187;
MatrixA(31,13) = -47.7109;
MatrixA(31,14) = -10.3179;
MatrixA(31,15) = 7.904;
MatrixA(31,20) = 544.041;
MatrixA(31,21) = 2.1022;
MatrixA(31,22) = 1.00186;
MatrixA(31,23) = 513.282;
MatrixA(31,24) = -298.715;
MatrixA(31,25) = 0.190153;
MatrixA(31,26) = 6.5073;
MatrixA(31,27) = 18.9752;
MatrixA(31,28) = -8.53171;
MatrixA(31,29) = -9.42812;
MatrixA(31,30) = 5.32117;
MatrixA(31,31) = -198.759;
MatrixA(31,32) = 0.0659253;
MatrixA(31,33) = 0.0597064;
MatrixA(32,1) = -45.3005;
MatrixA(32,2) = -122.641;
MatrixA(32,3) = -21.5565;
MatrixA(32,8) = 22.0417;
MatrixA(32,9) = 22.0468;
MatrixA(32,10) = -68.7556;
MatrixA(32,11) = -30.0538;
MatrixA(32,12) = 2.39618;
MatrixA(32,13) = -2.36053;
MatrixA(32,14) = -19.2382;
MatrixA(32,15) = 9.21569;
MatrixA(32,20) = 684.052;
MatrixA(32,21) = 0.02484;
MatrixA(32,22) = 1.25967;
MatrixA(32,23) = -471.739;
MatrixA(32,24) = -375.578;
MatrixA(32,25) = 0.88246;
MatrixA(32,26) = 8.35187;
MatrixA(32,27) = 8.3509;
MatrixA(32,28) = -89.2403;
MatrixA(32,29) = -9.09984;
MatrixA(32,30) = 0.12225;
MatrixA(32,31) = 0.121783;
MatrixA(32,32) = -194.782;
MatrixA(32,33) = 0.0697596;
MatrixA(33,1) = -45.3005;
MatrixA(33,2) = -122.641;
MatrixA(33,3) = 19.282;
MatrixA(33,8) = 22.0468;
MatrixA(33,9) = 22.0417;
MatrixA(33,10) = -30.0538;
MatrixA(33,11) = -68.7556;
MatrixA(33,12) = 2.36009;
MatrixA(33,13) = -2.39664;
MatrixA(33,14) = -9.20827;
MatrixA(33,15) = -2.42887;
MatrixA(33,20) = 684.052;
MatrixA(33,21) = -0.0248381;
MatrixA(33,22) = 1.25967;
MatrixA(33,23) = 471.713;
MatrixA(33,24) = -375.578;
MatrixA(33,25) = -0.882445;
MatrixA(33,26) = 8.3509;
MatrixA(33,27) = 8.35187;
MatrixA(33,28) = -9.09984;
MatrixA(33,29) = -89.2403;
MatrixA(33,30) = 0.121783;
MatrixA(33,31) = 0.12225;
MatrixA(33,32) = 0.0697596;
MatrixA(33,33) = -194.782;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -2.06868;
MatrixB(13,1) = -2.06867;
MatrixB(20,1) = 0.000134137;
MatrixB(21,1) = 0.0122509;
MatrixB(22,1) = -3.40619e-06;
MatrixB(23,1) = 0.0149679;
MatrixB(24,1) = -3.51065e-05;
MatrixB(25,1) = 0.0135232;
MatrixB(26,1) = 1.1278;
MatrixB(27,1) = -1.12755;
MatrixB(28,1) = -0.0100961;
MatrixB(29,1) = 0.0102222;
MatrixB(30,1) = 1.79544;
MatrixB(31,1) = -1.82537;
MatrixB(32,1) = 2.74272e-05;
MatrixB(33,1) = 4.27874e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -1.69088e-12;
MatrixC(2,2) = -2.19064e-12;
MatrixC(2,3) = 12.7017;
MatrixC(2,8) = 11.2928;
MatrixC(2,9) = -11.2928;
MatrixC(2,10) = -0.341998;
MatrixC(2,11) = 0.341998;
MatrixC(2,12) = -38.5466;
MatrixC(2,13) = -38.5745;
MatrixC(2,14) = -36.4118;
MatrixC(2,15) = -36.4105;
MatrixC(2,20) = 1.83349e-15;
MatrixC(2,21) = -0.0588606;
MatrixC(2,22) = -3.55055e-14;
MatrixC(2,23) = -0.0213069;
MatrixC(2,24) = -1.14663e-14;
MatrixC(2,25) = -0.00255875;
MatrixC(2,26) = 0.000464664;
MatrixC(2,27) = -0.000464664;
MatrixC(2,28) = -0.000182214;
MatrixC(2,29) = 0.000182214;
MatrixC(2,30) = -0.00437596;
MatrixC(2,31) = 0.00437596;
MatrixC(2,32) = -1.31731e-05;
MatrixC(2,33) = 1.31731e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0109058;
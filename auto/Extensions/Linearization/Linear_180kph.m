% MATLAB linearized CarSim 2024.1 model, calculated at t = 285.025 s.
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

MatrixA(1,2) = -50;
MatrixA(1,3) = 0.000145821;
MatrixA(1,20) = 0.00583293;
MatrixA(1,22) = 0.999983;
MatrixA(1,24) = -1.10313;
MatrixA(2,3) = -3.17624e-12;
MatrixA(2,23) = -2.45664e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 6.85201e-16;
MatrixA(3,3) = -3.70461e-11;
MatrixA(3,23) = -0.00583302;
MatrixA(3,24) = -1.43297e-18;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 1.07751e-07;
MatrixA(12,2) = 0.426269;
MatrixA(12,3) = 0.000457923;
MatrixA(12,8) = 17.6457;
MatrixA(12,12) = -94.6048;
MatrixA(12,20) = 3.03131e-12;
MatrixA(12,21) = 1.88301;
MatrixA(12,22) = -2.6132e-14;
MatrixA(12,23) = 2.06771;
MatrixA(12,24) = -1.64632e-12;
MatrixA(12,25) = 1.05625;
MatrixA(12,26) = 0.151533;
MatrixA(13,1) = -1.07753e-07;
MatrixA(13,2) = -0.426269;
MatrixA(13,3) = 0.000326277;
MatrixA(13,9) = -17.6457;
MatrixA(13,13) = -94.014;
MatrixA(13,20) = -3.00518e-12;
MatrixA(13,21) = 1.88301;
MatrixA(13,23) = 2.06771;
MatrixA(13,24) = 1.65938e-12;
MatrixA(13,25) = 1.05625;
MatrixA(13,27) = -0.151533;
MatrixA(14,1) = 1.80453e-08;
MatrixA(14,2) = 0.204671;
MatrixA(14,3) = -3.19278e-05;
MatrixA(14,10) = -2.5765;
MatrixA(14,14) = -89.2989;
MatrixA(14,20) = 5.22106e-11;
MatrixA(14,21) = 1.78371;
MatrixA(14,22) = -3.07877e-13;
MatrixA(14,23) = -2.2337;
MatrixA(14,24) = -2.89543e-11;
MatrixA(14,25) = 0.976097;
MatrixA(14,28) = 0.285921;
MatrixA(15,1) = -1.80447e-08;
MatrixA(15,2) = -0.204671;
MatrixA(15,3) = -1.57606e-05;
MatrixA(15,11) = 2.5765;
MatrixA(15,15) = -89.3867;
MatrixA(15,20) = -5.22137e-11;
MatrixA(15,21) = 1.78371;
MatrixA(15,22) = 3.03235e-13;
MatrixA(15,23) = -2.2337;
MatrixA(15,24) = 2.89512e-11;
MatrixA(15,25) = 0.976097;
MatrixA(15,29) = -0.285921;
MatrixA(20,1) = -143.567;
MatrixA(20,2) = -129.001;
MatrixA(20,3) = -1.13297;
MatrixA(20,8) = -44.7226;
MatrixA(20,9) = -44.7226;
MatrixA(20,10) = -28.9378;
MatrixA(20,11) = -28.9378;
MatrixA(20,12) = -0.314555;
MatrixA(20,13) = 0.19265;
MatrixA(20,14) = -0.400842;
MatrixA(20,15) = 0.491253;
MatrixA(20,20) = -4.60775;
MatrixA(20,21) = -8.26897e-07;
MatrixA(20,22) = 0.0268776;
MatrixA(20,23) = 3.30363e-05;
MatrixA(20,24) = 2.82985;
MatrixA(20,25) = -1.71983e-06;
MatrixA(20,26) = -0.23082;
MatrixA(20,27) = -0.23082;
MatrixA(20,28) = -0.318879;
MatrixA(20,29) = -0.318879;
MatrixA(20,30) = 0.316453;
MatrixA(20,31) = 0.316453;
MatrixA(20,32) = 0.332689;
MatrixA(20,33) = 0.332689;
MatrixA(21,1) = -3.78689e-12;
MatrixA(21,2) = -3.90188e-12;
MatrixA(21,3) = 26.0074;
MatrixA(21,8) = 2.06939;
MatrixA(21,9) = -2.06939;
MatrixA(21,10) = 14.5866;
MatrixA(21,11) = -14.5866;
MatrixA(21,12) = -33.7232;
MatrixA(21,13) = -33.7837;
MatrixA(21,14) = -34.6051;
MatrixA(21,15) = -34.5978;
MatrixA(21,20) = 3.00368e-14;
MatrixA(21,21) = -0.115283;
MatrixA(21,22) = 3.56727e-14;
MatrixA(21,23) = -50.1123;
MatrixA(21,24) = -7.47998e-14;
MatrixA(21,25) = -0.299142;
MatrixA(21,26) = -0.539793;
MatrixA(21,27) = 0.539793;
MatrixA(21,28) = -0.151023;
MatrixA(21,29) = 0.151023;
MatrixA(21,30) = -0.0018322;
MatrixA(21,31) = 0.0018322;
MatrixA(21,32) = -0.00339961;
MatrixA(21,33) = 0.00339961;
MatrixA(22,1) = -8.50736;
MatrixA(22,2) = -24.3493;
MatrixA(22,3) = 0.0982182;
MatrixA(22,8) = 24.412;
MatrixA(22,9) = 24.412;
MatrixA(22,10) = 18.212;
MatrixA(22,11) = 18.212;
MatrixA(22,12) = 3.58812;
MatrixA(22,13) = -3.58984;
MatrixA(22,14) = 6.99906;
MatrixA(22,15) = -6.98637;
MatrixA(22,20) = -0.19641;
MatrixA(22,21) = 2.4588e-07;
MatrixA(22,22) = 0.0011457;
MatrixA(22,23) = -1.73451e-05;
MatrixA(22,24) = 50.121;
MatrixA(22,25) = -5.28959e-06;
MatrixA(22,26) = 7.62792;
MatrixA(22,27) = 7.62792;
MatrixA(22,28) = 7.22095;
MatrixA(22,29) = 7.22095;
MatrixA(22,30) = -0.0105571;
MatrixA(22,31) = -0.0105571;
MatrixA(22,32) = 0.0418728;
MatrixA(22,33) = 0.0418728;
MatrixA(23,1) = -3.39312e-13;
MatrixA(23,2) = 6.74933e-12;
MatrixA(23,3) = 43.1838;
MatrixA(23,8) = 31.4984;
MatrixA(23,9) = -31.4984;
MatrixA(23,10) = -0.230947;
MatrixA(23,11) = 0.230947;
MatrixA(23,12) = -33.4844;
MatrixA(23,13) = -33.6222;
MatrixA(23,14) = 41.3191;
MatrixA(23,15) = 41.3669;
MatrixA(23,20) = -4.82266e-12;
MatrixA(23,21) = -0.0472565;
MatrixA(23,22) = 6.61816e-15;
MatrixA(23,23) = -1.96941;
MatrixA(23,24) = -5.02694e-12;
MatrixA(23,25) = -0.706058;
MatrixA(23,26) = -0.0633282;
MatrixA(23,27) = 0.0633282;
MatrixA(23,28) = -0.141226;
MatrixA(23,29) = 0.141226;
MatrixA(23,30) = -0.195895;
MatrixA(23,31) = 0.195895;
MatrixA(23,32) = -0.203417;
MatrixA(23,33) = 0.203417;
MatrixA(24,1) = 26.9822;
MatrixA(24,2) = 6.5413;
MatrixA(24,3) = 0.346703;
MatrixA(24,8) = -12.9357;
MatrixA(24,9) = -12.9357;
MatrixA(24,10) = 30.7582;
MatrixA(24,11) = 30.7582;
MatrixA(24,12) = -3.86651;
MatrixA(24,13) = 3.90557;
MatrixA(24,14) = 8.86224;
MatrixA(24,15) = -8.87053;
MatrixA(24,20) = 0.831868;
MatrixA(24,21) = -9.37419e-07;
MatrixA(24,22) = -0.00485242;
MatrixA(24,23) = -2.72634e-05;
MatrixA(24,24) = -0.473947;
MatrixA(24,25) = -5.02799e-06;
MatrixA(24,26) = -8.36723;
MatrixA(24,27) = -8.36723;
MatrixA(24,28) = 9.12242;
MatrixA(24,29) = 9.12242;
MatrixA(24,30) = -0.0251911;
MatrixA(24,31) = -0.0251911;
MatrixA(24,32) = -0.0365855;
MatrixA(24,33) = -0.0365855;
MatrixA(25,1) = -7.09546e-12;
MatrixA(25,2) = -4.81158e-12;
MatrixA(25,3) = 28.5354;
MatrixA(25,8) = 85.0773;
MatrixA(25,9) = -85.0773;
MatrixA(25,10) = 76.502;
MatrixA(25,11) = -76.502;
MatrixA(25,12) = -52.4119;
MatrixA(25,13) = -52.5116;
MatrixA(25,14) = -47.4464;
MatrixA(25,15) = -47.4607;
MatrixA(25,20) = -1.61288e-12;
MatrixA(25,21) = -0.072612;
MatrixA(25,22) = -2.26302e-13;
MatrixA(25,23) = 2.3594;
MatrixA(25,24) = 5.97088e-13;
MatrixA(25,25) = -0.165241;
MatrixA(25,26) = 14.5059;
MatrixA(25,27) = -14.5059;
MatrixA(25,28) = 13.7429;
MatrixA(25,29) = -13.7429;
MatrixA(25,30) = -0.0148653;
MatrixA(25,31) = 0.0148653;
MatrixA(25,32) = 0.0848456;
MatrixA(25,33) = -0.0848456;
MatrixA(26,1) = -6285.76;
MatrixA(26,2) = 33.1201;
MatrixA(26,3) = -4501.8;
MatrixA(26,8) = -7079.26;
MatrixA(26,9) = 183.364;
MatrixA(26,10) = -38.2542;
MatrixA(26,11) = 70.7367;
MatrixA(26,12) = -44.6695;
MatrixA(26,13) = 45.1948;
MatrixA(26,14) = 37.059;
MatrixA(26,15) = 31.4621;
MatrixA(26,20) = 0.794366;
MatrixA(26,21) = 0.0523916;
MatrixA(26,22) = -0.00463376;
MatrixA(26,23) = 0.0444374;
MatrixA(26,24) = -0.474761;
MatrixA(26,25) = 1.08391;
MatrixA(26,26) = -184.759;
MatrixA(26,27) = -6.51995;
MatrixA(26,28) = -6.91656;
MatrixA(26,29) = 12.6284;
MatrixA(26,30) = 0.0989731;
MatrixA(26,31) = -0.031932;
MatrixA(26,32) = -0.149775;
MatrixA(26,33) = -0.0261513;
MatrixA(27,1) = -6285.76;
MatrixA(27,2) = 33.1201;
MatrixA(27,3) = 4501.46;
MatrixA(27,8) = 183.364;
MatrixA(27,9) = -7079.26;
MatrixA(27,10) = 70.7367;
MatrixA(27,11) = -38.2542;
MatrixA(27,12) = -45.0776;
MatrixA(27,13) = 44.7227;
MatrixA(27,14) = -31.4751;
MatrixA(27,15) = -37.0929;
MatrixA(27,20) = 0.794366;
MatrixA(27,21) = -0.0523941;
MatrixA(27,22) = -0.00463376;
MatrixA(27,23) = -0.0444232;
MatrixA(27,24) = -0.474761;
MatrixA(27,25) = -1.08445;
MatrixA(27,26) = -6.51995;
MatrixA(27,27) = -184.759;
MatrixA(27,28) = 12.6284;
MatrixA(27,29) = -6.91656;
MatrixA(27,30) = -0.031932;
MatrixA(27,31) = 0.0989731;
MatrixA(27,32) = -0.0261513;
MatrixA(27,33) = -0.149775;
MatrixA(28,1) = -6224.19;
MatrixA(28,2) = -14537.6;
MatrixA(28,3) = -4273.13;
MatrixA(28,8) = -71.9322;
MatrixA(28,9) = 46.5559;
MatrixA(28,10) = -6922.38;
MatrixA(28,11) = 144.133;
MatrixA(28,12) = 39.8494;
MatrixA(28,13) = 37.2539;
MatrixA(28,14) = -126.355;
MatrixA(28,15) = 53.5455;
MatrixA(28,20) = 2.05449;
MatrixA(28,21) = 0.058339;
MatrixA(28,22) = -0.0119841;
MatrixA(28,23) = -2.64588;
MatrixA(28,24) = -1.14062;
MatrixA(28,25) = -0.00104052;
MatrixA(28,26) = -7.06107;
MatrixA(28,27) = 13.0725;
MatrixA(28,28) = -176.513;
MatrixA(28,29) = -9.0333;
MatrixA(28,30) = 0.0869391;
MatrixA(28,31) = 0.067694;
MatrixA(28,32) = -0.989806;
MatrixA(28,33) = 0.101724;
MatrixA(29,1) = -6224.19;
MatrixA(29,2) = -14537.6;
MatrixA(29,3) = 4270.85;
MatrixA(29,8) = 46.5559;
MatrixA(29,9) = -71.9322;
MatrixA(29,10) = 144.133;
MatrixA(29,11) = -6922.38;
MatrixA(29,12) = -37.2421;
MatrixA(29,13) = -39.9832;
MatrixA(29,14) = -53.5278;
MatrixA(29,15) = 126.062;
MatrixA(29,20) = 2.05449;
MatrixA(29,21) = -0.0583373;
MatrixA(29,22) = -0.0119841;
MatrixA(29,23) = 2.6463;
MatrixA(29,24) = -1.14062;
MatrixA(29,25) = 0.000632996;
MatrixA(29,26) = 13.0725;
MatrixA(29,27) = -7.06107;
MatrixA(29,28) = -9.0333;
MatrixA(29,29) = -176.513;
MatrixA(29,30) = 0.067694;
MatrixA(29,31) = 0.0869391;
MatrixA(29,32) = 0.101724;
MatrixA(29,33) = -0.989806;
MatrixA(30,1) = 10756.2;
MatrixA(30,2) = 5.76847;
MatrixA(30,3) = 10040.7;
MatrixA(30,8) = 12529.9;
MatrixA(30,9) = -1735.12;
MatrixA(30,10) = -32.0275;
MatrixA(30,11) = -28.4701;
MatrixA(30,12) = 54.879;
MatrixA(30,13) = 0.541228;
MatrixA(30,14) = -7.84296;
MatrixA(30,15) = 9.71399;
MatrixA(30,20) = 248.673;
MatrixA(30,21) = -0.29747;
MatrixA(30,22) = -1.45054;
MatrixA(30,23) = -233.654;
MatrixA(30,24) = -137.89;
MatrixA(30,25) = -1.49164;
MatrixA(30,26) = 9.89851;
MatrixA(30,27) = 7.86118;
MatrixA(30,28) = -9.35135;
MatrixA(30,29) = -8.71426;
MatrixA(30,30) = -101.006;
MatrixA(30,31) = -8.23604;
MatrixA(30,32) = 0.0327308;
MatrixA(30,33) = 0.034925;
MatrixA(31,1) = 10756.2;
MatrixA(31,2) = 5.76847;
MatrixA(31,3) = -9788.87;
MatrixA(31,8) = -1735.12;
MatrixA(31,9) = 12529.9;
MatrixA(31,10) = -28.4701;
MatrixA(31,11) = -32.0275;
MatrixA(31,12) = -4.93268;
MatrixA(31,13) = -23.2603;
MatrixA(31,14) = -9.7063;
MatrixA(31,15) = 7.85039;
MatrixA(31,20) = 248.673;
MatrixA(31,21) = 0.297471;
MatrixA(31,22) = -1.45054;
MatrixA(31,23) = 233.649;
MatrixA(31,24) = -137.89;
MatrixA(31,25) = 1.49163;
MatrixA(31,26) = 7.86118;
MatrixA(31,27) = 9.89851;
MatrixA(31,28) = -8.71426;
MatrixA(31,29) = -9.35135;
MatrixA(31,30) = -8.23604;
MatrixA(31,31) = -101.006;
MatrixA(31,32) = 0.034925;
MatrixA(31,33) = 0.0327308;
MatrixA(32,1) = -48.0465;
MatrixA(32,2) = -104.028;
MatrixA(32,3) = -11.7338;
MatrixA(32,8) = 12.8858;
MatrixA(32,9) = 12.9845;
MatrixA(32,10) = -51.9077;
MatrixA(32,11) = -30.7623;
MatrixA(32,12) = 3.92292;
MatrixA(32,13) = -3.84902;
MatrixA(32,14) = -18.9158;
MatrixA(32,15) = 8.79065;
MatrixA(32,20) = 351.339;
MatrixA(32,21) = 0.0498025;
MatrixA(32,22) = -2.04941;
MatrixA(32,23) = -242.502;
MatrixA(32,24) = -194.823;
MatrixA(32,25) = -1.38567;
MatrixA(32,26) = 8.36891;
MatrixA(32,27) = 8.36577;
MatrixA(32,28) = -51.1667;
MatrixA(32,29) = -9.12485;
MatrixA(32,30) = 0.0255529;
MatrixA(32,31) = 0.024836;
MatrixA(32,32) = -100.039;
MatrixA(32,33) = 0.036205;
MatrixA(33,1) = -48.0465;
MatrixA(33,2) = -104.028;
MatrixA(33,3) = 11.0537;
MatrixA(33,8) = 12.9845;
MatrixA(33,9) = 12.8858;
MatrixA(33,10) = -30.7623;
MatrixA(33,11) = -51.9077;
MatrixA(33,12) = 3.8102;
MatrixA(33,13) = -3.96223;
MatrixA(33,14) = -8.78244;
MatrixA(33,15) = -8.29715;
MatrixA(33,20) = 351.339;
MatrixA(33,21) = -0.0498006;
MatrixA(33,22) = -2.04941;
MatrixA(33,23) = 242.495;
MatrixA(33,24) = -194.823;
MatrixA(33,25) = 1.38568;
MatrixA(33,26) = 8.36577;
MatrixA(33,27) = 8.36891;
MatrixA(33,28) = -9.12485;
MatrixA(33,29) = -51.1667;
MatrixA(33,30) = 0.024836;
MatrixA(33,31) = 0.0255529;
MatrixA(33,32) = 0.036205;
MatrixA(33,33) = -100.039;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -4.41492;
MatrixB(13,1) = -4.41496;
MatrixB(20,1) = 0.000123403;
MatrixB(21,1) = 0.0399496;
MatrixB(22,1) = -3.95697e-06;
MatrixB(23,1) = 0.031797;
MatrixB(24,1) = -3.28089e-05;
MatrixB(25,1) = 0.0625341;
MatrixB(26,1) = 1.2548;
MatrixB(27,1) = -1.25455;
MatrixB(28,1) = -0.0459478;
MatrixB(29,1) = 0.0460656;
MatrixB(30,1) = -2.1622;
MatrixB(31,1) = 2.13445;
MatrixB(32,1) = -1.9451e-05;
MatrixB(33,1) = 8.50739e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -4.09896e-12;
MatrixC(2,2) = -4.34226e-12;
MatrixC(2,3) = 1.26062;
MatrixC(2,8) = 3.73897;
MatrixC(2,9) = -3.73897;
MatrixC(2,10) = -0.619932;
MatrixC(2,11) = 0.619932;
MatrixC(2,12) = -35.3992;
MatrixC(2,13) = -35.4619;
MatrixC(2,14) = -37.4069;
MatrixC(2,15) = -37.3999;
MatrixC(2,20) = 2.50917e-14;
MatrixC(2,21) = -0.11754;
MatrixC(2,22) = 9.66377e-15;
MatrixC(2,23) = 0.00188942;
MatrixC(2,24) = 2.13707e-14;
MatrixC(2,25) = -0.00518199;
MatrixC(2,26) = -9.28038e-05;
MatrixC(2,27) = 9.28038e-05;
MatrixC(2,28) = -0.000334785;
MatrixC(2,29) = 0.000334785;
MatrixC(2,30) = 0.000106491;
MatrixC(2,31) = -0.000106491;
MatrixC(2,32) = -3.21216e-05;
MatrixC(2,33) = 3.21216e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0427141;
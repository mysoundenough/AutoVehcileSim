% MATLAB linearized CarSim 2024.1 model, calculated at t = 105.008 s.
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

MatrixA(1,2) = -16.6667;
MatrixA(1,3) = -2.77187e-05;
MatrixA(1,20) = -0.00332628;
MatrixA(1,22) = 0.999994;
MatrixA(1,24) = -1.0982;
MatrixA(2,3) = -9.96894e-11;
MatrixA(2,23) = -2.72215e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 5.56853e-16;
MatrixA(3,3) = 6.63189e-10;
MatrixA(3,23) = 0.0033263;
MatrixA(3,24) = 9.05506e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 1.60096e-06;
MatrixA(12,2) = 0.239516;
MatrixA(12,3) = 0.000875022;
MatrixA(12,8) = 3.83357;
MatrixA(12,12) = -29.4414;
MatrixA(12,20) = 3.54788e-10;
MatrixA(12,21) = 1.74602;
MatrixA(12,22) = 1.19943e-12;
MatrixA(12,23) = 1.92223;
MatrixA(12,24) = -1.94355e-10;
MatrixA(12,25) = 0.950369;
MatrixA(12,26) = 0.0678266;
MatrixA(13,1) = -1.60096e-06;
MatrixA(13,2) = -0.239516;
MatrixA(13,3) = 0.000697009;
MatrixA(13,9) = -3.83357;
MatrixA(13,13) = -28.8421;
MatrixA(13,20) = -3.54776e-10;
MatrixA(13,21) = 1.74602;
MatrixA(13,22) = -1.18731e-12;
MatrixA(13,23) = 1.92223;
MatrixA(13,24) = 1.94368e-10;
MatrixA(13,25) = 0.950369;
MatrixA(13,27) = -0.0678266;
MatrixA(14,1) = -2.81356e-06;
MatrixA(14,2) = 0.0106862;
MatrixA(14,3) = -2.31505e-06;
MatrixA(14,10) = -0.768513;
MatrixA(14,14) = -30.5479;
MatrixA(14,20) = 2.37798e-09;
MatrixA(14,21) = 1.82975;
MatrixA(14,22) = 7.9092e-12;
MatrixA(14,23) = -2.28564;
MatrixA(14,24) = -1.30306e-09;
MatrixA(14,25) = 1.01025;
MatrixA(14,28) = 0.317818;
MatrixA(15,1) = 2.81356e-06;
MatrixA(15,2) = -0.0106862;
MatrixA(15,3) = -1.50108e-06;
MatrixA(15,11) = 0.768513;
MatrixA(15,15) = -30.5517;
MatrixA(15,20) = -2.37798e-09;
MatrixA(15,21) = 1.82975;
MatrixA(15,22) = -7.91029e-12;
MatrixA(15,23) = -2.28564;
MatrixA(15,24) = 1.30305e-09;
MatrixA(15,25) = 1.01025;
MatrixA(15,29) = -0.317818;
MatrixA(16,1) = -9.11646e-06;
MatrixA(16,2) = 0.0143701;
MatrixA(16,3) = -4.94979e-06;
MatrixA(16,8) = 0.00461337;
MatrixA(16,16) = -24.725;
MatrixA(16,20) = -1.63485;
MatrixA(16,21) = 0.00532013;
MatrixA(16,22) = -0.00544064;
MatrixA(16,23) = 1.16737;
MatrixA(16,24) = 0.89652;
MatrixA(16,25) = -0.000966411;
MatrixA(16,26) = -0.0471107;
MatrixA(16,30) = 0.464083;
MatrixA(17,1) = -9.11647e-06;
MatrixA(17,2) = 0.0143701;
MatrixA(17,3) = 3.10635e-06;
MatrixA(17,9) = 0.00461337;
MatrixA(17,17) = -24.725;
MatrixA(17,20) = -1.63485;
MatrixA(17,21) = -0.00532011;
MatrixA(17,22) = -0.00544064;
MatrixA(17,23) = -1.16656;
MatrixA(17,24) = 0.89652;
MatrixA(17,25) = 0.000966412;
MatrixA(17,27) = -0.0471107;
MatrixA(17,31) = 0.464083;
MatrixA(18,1) = 2.02745e-07;
MatrixA(18,2) = 2.02745e-07;
MatrixA(18,3) = 1.80982e-07;
MatrixA(18,10) = 2.02745e-07;
MatrixA(18,18) = -14.5697;
MatrixA(18,20) = -0.898615;
MatrixA(18,21) = -1.6335e-05;
MatrixA(18,22) = -0.00299141;
MatrixA(18,23) = 0.618764;
MatrixA(18,24) = 0.493011;
MatrixA(18,25) = -0.00206603;
MatrixA(18,28) = 0.104666;
MatrixA(18,32) = 0.255475;
MatrixA(19,1) = 2.02742e-07;
MatrixA(19,2) = 2.02742e-07;
MatrixA(19,3) = -3.60008e-07;
MatrixA(19,11) = 2.02742e-07;
MatrixA(19,19) = -14.5697;
MatrixA(19,20) = -0.898615;
MatrixA(19,21) = 1.6335e-05;
MatrixA(19,22) = -0.00299141;
MatrixA(19,23) = -0.618095;
MatrixA(19,24) = 0.493011;
MatrixA(19,25) = 0.00206603;
MatrixA(19,29) = 0.104666;
MatrixA(19,33) = 0.255475;
MatrixA(20,1) = -59.207;
MatrixA(20,2) = -128.512;
MatrixA(20,3) = 0.0072432;
MatrixA(20,8) = -2.7773;
MatrixA(20,9) = -2.7773;
MatrixA(20,10) = -28.9465;
MatrixA(20,11) = -28.9465;
MatrixA(20,12) = -0.251787;
MatrixA(20,13) = 0.254076;
MatrixA(20,14) = -0.486966;
MatrixA(20,15) = 0.55225;
MatrixA(20,16) = 9.18836;
MatrixA(20,17) = 9.18836;
MatrixA(20,18) = 4.95876;
MatrixA(20,19) = 4.95876;
MatrixA(20,20) = -12.4278;
MatrixA(20,21) = -8.27086e-07;
MatrixA(20,22) = -0.0413384;
MatrixA(20,23) = -8.15794e-05;
MatrixA(20,24) = 6.74886;
MatrixA(20,25) = -2.04154e-06;
MatrixA(20,26) = -0.336368;
MatrixA(20,27) = -0.336368;
MatrixA(20,28) = -0.14931;
MatrixA(20,29) = -0.14931;
MatrixA(20,30) = 0.884691;
MatrixA(20,31) = 0.884691;
MatrixA(20,32) = 0.879636;
MatrixA(20,33) = 0.879636;
MatrixA(21,1) = -7.54656e-13;
MatrixA(21,2) = -9.43835e-13;
MatrixA(21,3) = 30.6236;
MatrixA(21,8) = 1.83379;
MatrixA(21,9) = -1.83379;
MatrixA(21,10) = 17.2384;
MatrixA(21,11) = -17.2384;
MatrixA(21,12) = -37.3367;
MatrixA(21,13) = -37.3396;
MatrixA(21,14) = -33.4469;
MatrixA(21,15) = -33.4457;
MatrixA(21,16) = -0.102111;
MatrixA(21,17) = 0.102111;
MatrixA(21,18) = -0.0494651;
MatrixA(21,19) = 0.0494651;
MatrixA(21,20) = 7.23859e-15;
MatrixA(21,21) = -0.0386444;
MatrixA(21,22) = -1.4686e-14;
MatrixA(21,23) = -16.7866;
MatrixA(21,24) = -2.87199e-14;
MatrixA(21,25) = 0.0531211;
MatrixA(21,26) = -0.73219;
MatrixA(21,27) = 0.73219;
MatrixA(21,28) = -0.105223;
MatrixA(21,29) = 0.105223;
MatrixA(21,30) = -0.00964636;
MatrixA(21,31) = 0.00964636;
MatrixA(21,32) = -0.00877462;
MatrixA(21,33) = 0.00877462;
MatrixA(22,1) = -13.0679;
MatrixA(22,2) = -27.3574;
MatrixA(22,3) = 0.061114;
MatrixA(22,8) = 22.3163;
MatrixA(22,9) = 22.3163;
MatrixA(22,10) = 17.1711;
MatrixA(22,11) = 17.1711;
MatrixA(22,12) = 1.97397;
MatrixA(22,13) = -1.97417;
MatrixA(22,14) = 7.33003;
MatrixA(22,15) = -7.32131;
MatrixA(22,16) = -0.23768;
MatrixA(22,17) = -0.23768;
MatrixA(22,18) = 0.653445;
MatrixA(22,19) = 0.653445;
MatrixA(22,20) = -0.647207;
MatrixA(22,21) = 2.47001e-07;
MatrixA(22,22) = -0.00215285;
MatrixA(22,23) = -1.10893e-05;
MatrixA(22,24) = 17.0256;
MatrixA(22,25) = -3.89218e-06;
MatrixA(22,26) = 7.62967;
MatrixA(22,27) = 7.62967;
MatrixA(22,28) = 7.231;
MatrixA(22,29) = 7.231;
MatrixA(22,30) = -0.0228419;
MatrixA(22,31) = -0.0228419;
MatrixA(22,32) = 0.115915;
MatrixA(22,33) = 0.115915;
MatrixA(23,1) = 1.4939e-12;
MatrixA(23,2) = 3.81625e-12;
MatrixA(23,3) = 5.31572;
MatrixA(23,8) = 5.64618;
MatrixA(23,9) = -5.64618;
MatrixA(23,10) = -3.21687;
MatrixA(23,11) = 3.21687;
MatrixA(23,12) = -37.2387;
MatrixA(23,13) = -37.2403;
MatrixA(23,14) = 39.9021;
MatrixA(23,15) = 39.9414;
MatrixA(23,16) = -5.76166;
MatrixA(23,17) = 5.76166;
MatrixA(23,18) = -3.03567;
MatrixA(23,19) = 3.03567;
MatrixA(23,20) = 7.03349e-14;
MatrixA(23,21) = -0.0280181;
MatrixA(23,22) = -1.79096e-14;
MatrixA(23,23) = -5.38836;
MatrixA(23,24) = -6.801e-12;
MatrixA(23,25) = -0.219064;
MatrixA(23,26) = -0.142451;
MatrixA(23,27) = 0.142451;
MatrixA(23,28) = -0.280145;
MatrixA(23,29) = 0.280145;
MatrixA(23,30) = -0.553472;
MatrixA(23,31) = 0.553472;
MatrixA(23,32) = -0.538498;
MatrixA(23,33) = 0.538498;
MatrixA(24,1) = 3.44958;
MatrixA(24,2) = 3.21227;
MatrixA(24,3) = 0.0516848;
MatrixA(24,8) = -23.8564;
MatrixA(24,9) = -23.8564;
MatrixA(24,10) = 29.5871;
MatrixA(24,11) = 29.5871;
MatrixA(24,12) = -2.07782;
MatrixA(24,13) = 2.07738;
MatrixA(24,14) = 9.30214;
MatrixA(24,15) = -9.30902;
MatrixA(24,16) = -2.39005;
MatrixA(24,17) = -2.39005;
MatrixA(24,18) = -0.533913;
MatrixA(24,19) = -0.533913;
MatrixA(24,20) = 2.27769;
MatrixA(24,21) = -9.36756e-07;
MatrixA(24,22) = 0.00757627;
MatrixA(24,23) = -1.95969e-05;
MatrixA(24,24) = -1.25252;
MatrixA(24,25) = -7.95228e-06;
MatrixA(24,26) = -8.34346;
MatrixA(24,27) = -8.34346;
MatrixA(24,28) = 9.08689;
MatrixA(24,29) = 9.08689;
MatrixA(24,30) = -0.170546;
MatrixA(24,31) = -0.170546;
MatrixA(24,32) = -0.094711;
MatrixA(24,33) = -0.094711;
MatrixA(25,1) = -1.03768e-12;
MatrixA(25,2) = -2.08574e-12;
MatrixA(25,3) = 37.8058;
MatrixA(25,8) = 88.1046;
MatrixA(25,9) = -88.1046;
MatrixA(25,10) = 77.4643;
MatrixA(25,11) = -77.4643;
MatrixA(25,12) = -59.7769;
MatrixA(25,13) = -59.7816;
MatrixA(25,14) = -45.4024;
MatrixA(25,15) = -45.4192;
MatrixA(25,16) = -0.332352;
MatrixA(25,17) = 0.332352;
MatrixA(25,18) = 1.33445;
MatrixA(25,19) = -1.33445;
MatrixA(25,20) = 1.32777e-12;
MatrixA(25,21) = -0.0248364;
MatrixA(25,22) = 8.41029e-13;
MatrixA(25,23) = 1.66858;
MatrixA(25,24) = -5.24056e-13;
MatrixA(25,25) = -0.0409785;
MatrixA(25,26) = 14.4481;
MatrixA(25,27) = -14.4481;
MatrixA(25,28) = 13.789;
MatrixA(25,29) = -13.789;
MatrixA(25,30) = -0.0316695;
MatrixA(25,31) = 0.0316695;
MatrixA(25,32) = 0.236718;
MatrixA(25,33) = -0.236718;
MatrixA(26,1) = -6291.79;
MatrixA(26,2) = 39.5006;
MatrixA(26,3) = -4499.78;
MatrixA(26,8) = -7063.7;
MatrixA(26,9) = 174.195;
MatrixA(26,10) = -38.4059;
MatrixA(26,11) = 69.9072;
MatrixA(26,12) = -5.17543;
MatrixA(26,13) = 44.1176;
MatrixA(26,14) = 35.4487;
MatrixA(26,15) = 29.5868;
MatrixA(26,16) = 1.22542;
MatrixA(26,17) = -2.52676;
MatrixA(26,18) = -2.33888;
MatrixA(26,19) = -0.250489;
MatrixA(26,20) = 2.04022;
MatrixA(26,21) = 0.0196566;
MatrixA(26,22) = 0.00678722;
MatrixA(26,23) = -0.0632605;
MatrixA(26,24) = -1.13166;
MatrixA(26,25) = 0.246767;
MatrixA(26,26) = -184.679;
MatrixA(26,27) = -6.62108;
MatrixA(26,28) = -6.91603;
MatrixA(26,29) = 12.4905;
MatrixA(26,30) = 0.182803;
MatrixA(26,31) = -0.177558;
MatrixA(26,32) = -0.414895;
MatrixA(26,33) = -0.0444343;
MatrixA(27,1) = -6291.79;
MatrixA(27,2) = 39.5006;
MatrixA(27,3) = 4499.07;
MatrixA(27,8) = 174.195;
MatrixA(27,9) = -7063.7;
MatrixA(27,10) = 69.9072;
MatrixA(27,11) = -38.4059;
MatrixA(27,12) = -44.1147;
MatrixA(27,13) = 5.17587;
MatrixA(27,14) = -29.5905;
MatrixA(27,15) = -35.479;
MatrixA(27,16) = -2.52676;
MatrixA(27,17) = 1.22542;
MatrixA(27,18) = -0.250489;
MatrixA(27,19) = -2.33888;
MatrixA(27,20) = 2.04022;
MatrixA(27,21) = -0.0196592;
MatrixA(27,22) = 0.00678722;
MatrixA(27,23) = 0.0629869;
MatrixA(27,24) = -1.13166;
MatrixA(27,25) = -0.247333;
MatrixA(27,26) = -6.62108;
MatrixA(27,27) = -184.679;
MatrixA(27,28) = 12.4905;
MatrixA(27,29) = -6.91603;
MatrixA(27,30) = -0.177558;
MatrixA(27,31) = 0.182803;
MatrixA(27,32) = -0.0444343;
MatrixA(27,33) = -0.414895;
MatrixA(28,1) = -6166.59;
MatrixA(28,2) = -14478.3;
MatrixA(28,3) = -4264.91;
MatrixA(28,8) = -53.7001;
MatrixA(28,9) = 69.2531;
MatrixA(28,10) = -6904.04;
MatrixA(28,11) = 147.285;
MatrixA(28,12) = 44.6421;
MatrixA(28,13) = 43.3536;
MatrixA(28,14) = -134.938;
MatrixA(28,15) = 53.4628;
MatrixA(28,16) = 4.48666;
MatrixA(28,17) = 4.13371;
MatrixA(28,18) = -14.4322;
MatrixA(28,19) = 1.5711;
MatrixA(28,20) = 5.11276;
MatrixA(28,21) = 0.020001;
MatrixA(28,22) = 0.0170063;
MatrixA(28,23) = -6.78879;
MatrixA(28,24) = -2.80116;
MatrixA(28,25) = 0.0137214;
MatrixA(28,26) = -7.0516;
MatrixA(28,27) = 12.9829;
MatrixA(28,28) = -176.678;
MatrixA(28,29) = -8.90001;
MatrixA(28,30) = 0.356923;
MatrixA(28,31) = 0.3234;
MatrixA(28,32) = -2.56013;
MatrixA(28,33) = 0.278698;
MatrixA(29,1) = -6166.59;
MatrixA(29,2) = -14478.3;
MatrixA(29,3) = 4263.57;
MatrixA(29,8) = 69.2531;
MatrixA(29,9) = -53.7001;
MatrixA(29,10) = 147.285;
MatrixA(29,11) = -6904.04;
MatrixA(29,12) = -43.3491;
MatrixA(29,13) = -44.6445;
MatrixA(29,14) = -53.4429;
MatrixA(29,15) = 134.746;
MatrixA(29,16) = 4.13371;
MatrixA(29,17) = 4.48666;
MatrixA(29,18) = 1.5711;
MatrixA(29,19) = -14.4322;
MatrixA(29,20) = 5.11276;
MatrixA(29,21) = -0.0199993;
MatrixA(29,22) = 0.0170063;
MatrixA(29,23) = 6.78934;
MatrixA(29,24) = -2.80116;
MatrixA(29,25) = -0.0141206;
MatrixA(29,26) = 12.9829;
MatrixA(29,27) = -7.0516;
MatrixA(29,28) = -8.90001;
MatrixA(29,29) = -176.678;
MatrixA(29,30) = 0.3234;
MatrixA(29,31) = 0.356923;
MatrixA(29,32) = 0.278698;
MatrixA(29,33) = -2.56013;
MatrixA(30,1) = 1290.16;
MatrixA(30,2) = -9.2165;
MatrixA(30,3) = 1277.16;
MatrixA(30,8) = 1524.83;
MatrixA(30,9) = -218.691;
MatrixA(30,10) = -31.5142;
MatrixA(30,11) = -26.2593;
MatrixA(30,12) = 26.3872;
MatrixA(30,13) = 3.77047;
MatrixA(30,14) = -7.91065;
MatrixA(30,15) = 10.4393;
MatrixA(30,16) = -2377.71;
MatrixA(30,17) = 329.806;
MatrixA(30,18) = 0.450785;
MatrixA(30,19) = 0.502052;
MatrixA(30,20) = 692.931;
MatrixA(30,21) = -2.98136;
MatrixA(30,22) = 2.30487;
MatrixA(30,23) = -654.178;
MatrixA(30,24) = -379.692;
MatrixA(30,25) = 0.554687;
MatrixA(30,26) = 24.1806;
MatrixA(30,27) = 5.76437;
MatrixA(30,28) = -9.43571;
MatrixA(30,29) = -8.48989;
MatrixA(30,30) = -248.015;
MatrixA(30,31) = 12.1521;
MatrixA(30,32) = 0.0799649;
MatrixA(30,33) = 0.0890591;
MatrixA(31,1) = 1290.16;
MatrixA(31,2) = -9.2165;
MatrixA(31,3) = -1277.69;
MatrixA(31,8) = -218.691;
MatrixA(31,9) = 1524.83;
MatrixA(31,10) = -26.2593;
MatrixA(31,11) = -31.5142;
MatrixA(31,12) = -3.6888;
MatrixA(31,13) = -26.9759;
MatrixA(31,14) = -10.4329;
MatrixA(31,15) = 7.91646;
MatrixA(31,16) = 329.806;
MatrixA(31,17) = -2377.71;
MatrixA(31,18) = 0.502052;
MatrixA(31,19) = 0.450785;
MatrixA(31,20) = 692.931;
MatrixA(31,21) = 2.98137;
MatrixA(31,22) = 2.30487;
MatrixA(31,23) = 654.186;
MatrixA(31,24) = -379.692;
MatrixA(31,25) = -0.554697;
MatrixA(31,26) = 5.76437;
MatrixA(31,27) = 24.1806;
MatrixA(31,28) = -8.48989;
MatrixA(31,29) = -9.43571;
MatrixA(31,30) = 12.1521;
MatrixA(31,31) = -248.015;
MatrixA(31,32) = 0.0890591;
MatrixA(31,33) = 0.0799649;
MatrixA(32,1) = -46.0053;
MatrixA(32,2) = -127.444;
MatrixA(32,3) = -25.1569;
MatrixA(32,8) = 23.8562;
MatrixA(32,9) = 23.8568;
MatrixA(32,10) = -72.2299;
MatrixA(32,11) = -29.5885;
MatrixA(32,12) = 2.08731;
MatrixA(32,13) = -2.06789;
MatrixA(32,14) = -18.7211;
MatrixA(32,15) = 9.29742;
MatrixA(32,16) = 2.39168;
MatrixA(32,17) = 2.38849;
MatrixA(32,18) = -1491.46;
MatrixA(32,19) = 0.533055;
MatrixA(32,20) = 929.345;
MatrixA(32,21) = 0.0169299;
MatrixA(32,22) = 3.09124;
MatrixA(32,23) = -640.626;
MatrixA(32,24) = -509.236;
MatrixA(32,25) = 2.14028;
MatrixA(32,26) = 8.34372;
MatrixA(32,27) = 8.34323;
MatrixA(32,28) = -117.501;
MatrixA(32,29) = -9.08729;
MatrixA(32,30) = 0.170702;
MatrixA(32,31) = 0.170395;
MatrixA(32,32) = -264.57;
MatrixA(32,33) = 0.0945588;
MatrixA(33,1) = -46.0053;
MatrixA(33,2) = -127.444;
MatrixA(33,3) = 21.9561;
MatrixA(33,8) = 23.8568;
MatrixA(33,9) = 23.8562;
MatrixA(33,10) = -29.5885;
MatrixA(33,11) = -72.2299;
MatrixA(33,12) = 2.06833;
MatrixA(33,13) = -2.08688;
MatrixA(33,14) = -9.29055;
MatrixA(33,15) = -0.917111;
MatrixA(33,16) = 2.38849;
MatrixA(33,17) = 2.39168;
MatrixA(33,18) = 0.533055;
MatrixA(33,19) = -1491.46;
MatrixA(33,20) = 929.345;
MatrixA(33,21) = -0.016928;
MatrixA(33,22) = 3.09124;
MatrixA(33,23) = 640.637;
MatrixA(33,24) = -509.236;
MatrixA(33,25) = -2.14026;
MatrixA(33,26) = 8.34323;
MatrixA(33,27) = 8.34372;
MatrixA(33,28) = -9.08729;
MatrixA(33,29) = -117.501;
MatrixA(33,30) = 0.170395;
MatrixA(33,31) = 0.170702;
MatrixA(33,32) = 0.0945588;
MatrixA(33,33) = -264.57;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -1.36529;
MatrixB(13,1) = -1.36528;
MatrixB(16,1) = -0.00413048;
MatrixB(17,1) = 0.00418952;
MatrixB(20,1) = 0.000114145;
MatrixB(21,1) = 0.00710366;
MatrixB(22,1) = -2.74565e-06;
MatrixB(23,1) = 0.009549;
MatrixB(24,1) = -2.97566e-05;
MatrixB(25,1) = 0.00414132;
MatrixB(26,1) = 1.10539;
MatrixB(27,1) = -1.10513;
MatrixB(28,1) = -0.00325025;
MatrixB(29,1) = 0.0033571;
MatrixB(30,1) = 1.98848;
MatrixB(31,1) = -2.01392;
MatrixB(32,1) = 2.71625e-05;
MatrixB(33,1) = 3.23514e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -9.15833e-13;
MatrixC(2,2) = -1.15656e-12;
MatrixC(2,3) = 14.5626;
MatrixC(2,8) = 12.5365;
MatrixC(2,9) = -12.5365;
MatrixC(2,10) = -0.296288;
MatrixC(2,11) = 0.296288;
MatrixC(2,12) = -39.215;
MatrixC(2,13) = -39.2181;
MatrixC(2,14) = -36.2292;
MatrixC(2,15) = -36.2286;
MatrixC(2,16) = -0.0455178;
MatrixC(2,17) = 0.0455178;
MatrixC(2,18) = -4.85341e-05;
MatrixC(2,19) = 4.85341e-05;
MatrixC(2,20) = 3.9453e-14;
MatrixC(2,21) = -0.0392762;
MatrixC(2,22) = -4.01975e-15;
MatrixC(2,23) = -0.0205663;
MatrixC(2,24) = 3.53434e-14;
MatrixC(2,25) = -0.00167688;
MatrixC(2,26) = 0.000457133;
MatrixC(2,27) = -0.000457133;
MatrixC(2,28) = -0.00012354;
MatrixC(2,29) = 0.00012354;
MatrixC(2,30) = -0.00419992;
MatrixC(2,31) = 0.00419992;
MatrixC(2,32) = -8.60523e-06;
MatrixC(2,33) = 8.60523e-06;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.00506483;
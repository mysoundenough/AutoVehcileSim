% MATLAB linearized CarSim 2024.1 model, calculated at t = 30.0025 s.
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

MatrixA(1,2) = -2.77778;
MatrixA(1,3) = -6.2788e-06;
MatrixA(1,20) = -0.00452078;
MatrixA(1,22) = 0.99999;
MatrixA(1,24) = -1.09755;
MatrixA(2,3) = -6.54796e-13;
MatrixA(2,23) = -3.17766e-17;
MatrixA(2,24) = 1;
MatrixA(3,2) = 3.87666e-17;
MatrixA(3,3) = 5.92009e-12;
MatrixA(3,23) = 0.00452083;
MatrixA(3,24) = 1.43657e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 3.20658e-08;
MatrixA(12,2) = 0.041711;
MatrixA(12,3) = 0.000163404;
MatrixA(12,8) = 0.599399;
MatrixA(12,12) = -4.8728;
MatrixA(12,20) = 1.66366e-10;
MatrixA(12,21) = 1.73275;
MatrixA(12,22) = 7.51456e-13;
MatrixA(12,23) = 1.90824;
MatrixA(12,24) = -9.10224e-11;
MatrixA(12,25) = 0.939384;
MatrixA(12,26) = 0.0578749;
MatrixA(13,1) = -3.2066e-08;
MatrixA(13,2) = -0.041711;
MatrixA(13,3) = 0.000131181;
MatrixA(13,9) = -0.599399;
MatrixA(13,13) = -4.76703;
MatrixA(13,20) = -1.66366e-10;
MatrixA(13,21) = 1.73275;
MatrixA(13,22) = -7.54462e-13;
MatrixA(13,23) = 1.90824;
MatrixA(13,24) = 9.10254e-11;
MatrixA(13,25) = 0.939384;
MatrixA(13,27) = -0.0578749;
MatrixA(14,1) = 2.58918e-07;
MatrixA(14,2) = 0.000438322;
MatrixA(14,3) = 1.674e-07;
MatrixA(14,10) = -0.125815;
MatrixA(14,14) = -5.10811;
MatrixA(14,20) = 1.03889e-09;
MatrixA(14,21) = 1.8357;
MatrixA(14,22) = 4.69658e-12;
MatrixA(14,23) = -2.29232;
MatrixA(14,24) = -5.6839e-10;
MatrixA(14,25) = 1.0147;
MatrixA(14,28) = 0.322077;
MatrixA(15,1) = -2.58918e-07;
MatrixA(15,2) = -0.000438322;
MatrixA(15,3) = 1.62304e-07;
MatrixA(15,11) = 0.125815;
MatrixA(15,15) = -5.10827;
MatrixA(15,20) = -1.03889e-09;
MatrixA(15,21) = 1.8357;
MatrixA(15,22) = -4.69669e-12;
MatrixA(15,23) = -2.29232;
MatrixA(15,24) = 5.68389e-10;
MatrixA(15,25) = 1.0147;
MatrixA(15,29) = -0.322077;
MatrixA(16,1) = 8.14462e-08;
MatrixA(16,2) = 0.0249678;
MatrixA(16,3) = 1.88511e-05;
MatrixA(16,8) = 0.0210204;
MatrixA(16,16) = -166.667;
MatrixA(16,20) = -16.928;
MatrixA(16,21) = 0.0593672;
MatrixA(16,22) = -0.271305;
MatrixA(16,23) = 12.0833;
MatrixA(16,24) = 9.26155;
MatrixA(16,25) = -0.0785664;
MatrixA(16,26) = -1.77324;
MatrixA(16,30) = 4.80662;
MatrixA(17,1) = 8.14462e-08;
MatrixA(17,2) = 0.0249678;
MatrixA(17,3) = -1.67795e-05;
MatrixA(17,9) = 0.0210204;
MatrixA(17,17) = -166.667;
MatrixA(17,20) = -16.928;
MatrixA(17,21) = -0.210363;
MatrixA(17,22) = -0.271305;
MatrixA(17,23) = -12.0832;
MatrixA(17,24) = 9.26155;
MatrixA(17,25) = 0.0221906;
MatrixA(17,27) = -1.77324;
MatrixA(17,31) = 4.80662;
MatrixA(18,1) = 7.8561e-08;
MatrixA(18,2) = 0.0833162;
MatrixA(18,3) = 5.3999e-08;
MatrixA(18,10) = 5.8703e-05;
MatrixA(18,18) = -51.2824;
MatrixA(18,20) = -18.4059;
MatrixA(18,21) = -8.05315e-05;
MatrixA(18,22) = -0.0832106;
MatrixA(18,23) = 12.6548;
MatrixA(18,24) = 32.8262;
MatrixA(18,25) = -0.0572544;
MatrixA(18,28) = 6.9579;
MatrixA(18,32) = 17.04;
MatrixA(19,1) = 7.8561e-08;
MatrixA(19,2) = 0.0833162;
MatrixA(19,3) = -5.3999e-08;
MatrixA(19,11) = 5.8703e-05;
MatrixA(19,19) = -51.2824;
MatrixA(19,20) = -18.4059;
MatrixA(19,21) = 0.000260157;
MatrixA(19,22) = -0.0832106;
MatrixA(19,23) = -12.6548;
MatrixA(19,24) = 32.8262;
MatrixA(19,25) = 0.186597;
MatrixA(19,29) = 6.9579;
MatrixA(19,33) = 17.04;
MatrixA(20,1) = -50.6233;
MatrixA(20,2) = -129.563;
MatrixA(20,3) = 0.00759071;
MatrixA(20,8) = 1.653;
MatrixA(20,9) = 1.653;
MatrixA(20,10) = -29.1485;
MatrixA(20,11) = -29.1485;
MatrixA(20,12) = -0.207629;
MatrixA(20,13) = 0.207398;
MatrixA(20,14) = -0.50285;
MatrixA(20,15) = 0.556548;
MatrixA(20,16) = 62.7527;
MatrixA(20,17) = 62.7527;
MatrixA(20,18) = 56.4952;
MatrixA(20,19) = 56.4952;
MatrixA(20,20) = -0.00184839;
MatrixA(20,21) = -8.26097e-07;
MatrixA(20,22) = -8.35607e-06;
MatrixA(20,23) = -1.12455e-05;
MatrixA(20,24) = -0.0124943;
MatrixA(20,25) = -2.08278e-06;
MatrixA(20,26) = -0.252335;
MatrixA(20,27) = -0.252335;
MatrixA(20,28) = -0.516336;
MatrixA(20,29) = -0.516336;
MatrixA(20,30) = 0.00604491;
MatrixA(20,31) = 0.00604491;
MatrixA(20,33) = -2.75286e-16;
MatrixA(21,1) = -1.33733e-13;
MatrixA(21,2) = -2.1905e-13;
MatrixA(21,3) = 30.9461;
MatrixA(21,8) = 1.58174;
MatrixA(21,9) = -1.58174;
MatrixA(21,10) = 17.5823;
MatrixA(21,11) = -17.5823;
MatrixA(21,12) = -37.8499;
MatrixA(21,13) = -37.8502;
MatrixA(21,14) = -33.3003;
MatrixA(21,15) = -33.2996;
MatrixA(21,16) = -0.640836;
MatrixA(21,17) = 0.640836;
MatrixA(21,18) = -0.562026;
MatrixA(21,19) = 0.562026;
MatrixA(21,20) = -3.94869e-14;
MatrixA(21,21) = -0.00640424;
MatrixA(21,22) = -3.0881e-14;
MatrixA(21,23) = -2.78257;
MatrixA(21,24) = -5.17913e-14;
MatrixA(21,25) = 0.0121333;
MatrixA(21,26) = -0.75865;
MatrixA(21,27) = 0.75865;
MatrixA(21,28) = -0.0949947;
MatrixA(21,29) = 0.0949947;
MatrixA(21,30) = -1.67015e-14;
MatrixA(21,31) = 1.09003e-14;
MatrixA(21,32) = 5.59596e-15;
MatrixA(21,33) = -1.43865e-15;
MatrixA(22,1) = -13.5232;
MatrixA(22,2) = -27.8984;
MatrixA(22,3) = 0.059875;
MatrixA(22,8) = 22.6393;
MatrixA(22,9) = 22.6393;
MatrixA(22,10) = 16.8928;
MatrixA(22,11) = 16.8928;
MatrixA(22,12) = 1.73457;
MatrixA(22,13) = -1.73458;
MatrixA(22,14) = 7.37105;
MatrixA(22,15) = -7.36391;
MatrixA(22,16) = -1.56635;
MatrixA(22,17) = -1.56635;
MatrixA(22,18) = 7.48821;
MatrixA(22,19) = 7.48821;
MatrixA(22,20) = 0.00130276;
MatrixA(22,21) = 2.46883e-07;
MatrixA(22,22) = 5.88848e-06;
MatrixA(22,23) = -1.84486e-05;
MatrixA(22,24) = 2.77774;
MatrixA(22,25) = -3.71496e-06;
MatrixA(22,26) = 7.62609;
MatrixA(22,27) = 7.62609;
MatrixA(22,28) = 7.18083;
MatrixA(22,29) = 7.18083;
MatrixA(22,30) = 2.01885e-05;
MatrixA(22,31) = 2.01885e-05;
MatrixA(22,33) = 3.83107e-15;
MatrixA(23,1) = 4.52697e-13;
MatrixA(23,2) = 7.33268e-13;
MatrixA(23,3) = 1.05319;
MatrixA(23,8) = 2.72818;
MatrixA(23,9) = -2.72818;
MatrixA(23,10) = -3.46998;
MatrixA(23,11) = 3.46998;
MatrixA(23,12) = -37.7959;
MatrixA(23,13) = -37.7963;
MatrixA(23,14) = 39.7256;
MatrixA(23,15) = 39.7584;
MatrixA(23,16) = -39.2816;
MatrixA(23,17) = 39.2816;
MatrixA(23,18) = -34.5912;
MatrixA(23,19) = 34.5912;
MatrixA(23,20) = -1.35751e-15;
MatrixA(23,21) = -0.00256638;
MatrixA(23,22) = -7.00566e-15;
MatrixA(23,23) = 0.000364034;
MatrixA(23,24) = -3.53436e-14;
MatrixA(23,25) = -0.0380884;
MatrixA(23,26) = -0.206789;
MatrixA(23,27) = 0.206789;
MatrixA(23,28) = -0.0498623;
MatrixA(23,29) = 0.0498623;
MatrixA(23,30) = 2.49944e-13;
MatrixA(23,31) = -2.50926e-13;
MatrixA(23,32) = 1.17812e-13;
MatrixA(23,33) = -1.17868e-13;
MatrixA(24,1) = 0.968169;
MatrixA(24,2) = 2.8907;
MatrixA(24,3) = 0.0539703;
MatrixA(24,8) = -25.5413;
MatrixA(24,9) = -25.5413;
MatrixA(24,10) = 29.3128;
MatrixA(24,11) = 29.3128;
MatrixA(24,12) = -1.82297;
MatrixA(24,13) = 1.82305;
MatrixA(24,14) = 9.358;
MatrixA(24,15) = -9.36374;
MatrixA(24,16) = -16.2523;
MatrixA(24,17) = -16.2523;
MatrixA(24,18) = -6.06586;
MatrixA(24,19) = -6.06586;
MatrixA(24,20) = -0.00131936;
MatrixA(24,21) = -9.36284e-07;
MatrixA(24,22) = -5.96352e-06;
MatrixA(24,23) = -2.07688e-05;
MatrixA(24,24) = -2.80581e-05;
MatrixA(24,25) = -8.3301e-06;
MatrixA(24,26) = -8.37116;
MatrixA(24,27) = -8.37116;
MatrixA(24,28) = 9.12388;
MatrixA(24,29) = 9.12388;
MatrixA(24,30) = 0.202075;
MatrixA(24,31) = 0.202075;
MatrixA(24,33) = 4.86767e-15;
MatrixA(25,1) = 9.42471e-13;
MatrixA(25,2) = 1.24488e-13;
MatrixA(25,3) = 38.7411;
MatrixA(25,8) = 89.3305;
MatrixA(25,9) = -89.3305;
MatrixA(25,10) = 77.3094;
MatrixA(25,11) = -77.3094;
MatrixA(25,12) = -60.8385;
MatrixA(25,13) = -60.8389;
MatrixA(25,14) = -45.1449;
MatrixA(25,15) = -45.1594;
MatrixA(25,16) = -2.02251;
MatrixA(25,17) = 2.02251;
MatrixA(25,18) = 15.307;
MatrixA(25,19) = -15.307;
MatrixA(25,20) = 1.06251e-12;
MatrixA(25,21) = -0.00401217;
MatrixA(25,22) = 6.024e-13;
MatrixA(25,23) = 0.113031;
MatrixA(25,24) = 1.50939e-12;
MatrixA(25,25) = -0.00574805;
MatrixA(25,26) = 14.448;
MatrixA(25,27) = -14.448;
MatrixA(25,28) = 13.6875;
MatrixA(25,29) = -13.6875;
MatrixA(25,30) = 4.90747e-13;
MatrixA(25,31) = -3.68517e-13;
MatrixA(25,32) = -1.01419e-13;
MatrixA(25,33) = -7.64898e-15;
MatrixA(26,1) = -6292.66;
MatrixA(26,2) = 40.7083;
MatrixA(26,3) = -4499.6;
MatrixA(26,8) = -7074.06;
MatrixA(26,9) = 172.83;
MatrixA(26,10) = -38.2091;
MatrixA(26,11) = 69.6003;
MatrixA(26,12) = 0.646978;
MatrixA(26,13) = 43.9611;
MatrixA(26,14) = 35.2441;
MatrixA(26,15) = 29.3476;
MatrixA(26,16) = 8.61214;
MatrixA(26,17) = -16.8624;
MatrixA(26,18) = -26.8008;
MatrixA(26,19) = -2.64711;
MatrixA(26,20) = -0.0027351;
MatrixA(26,21) = 0.00254341;
MatrixA(26,22) = -1.23627e-05;
MatrixA(26,23) = -0.0140088;
MatrixA(26,24) = -0.000964974;
MatrixA(26,25) = 0.0375663;
MatrixA(26,26) = -184.644;
MatrixA(26,27) = -6.65556;
MatrixA(26,28) = -6.72928;
MatrixA(26,29) = 12.4879;
MatrixA(26,30) = 0.222308;
MatrixA(26,31) = 0.222308;
MatrixA(26,32) = 7.58133e-14;
MatrixA(26,33) = 2.36239e-15;
MatrixA(27,1) = -6292.66;
MatrixA(27,2) = 40.7083;
MatrixA(27,3) = 4498.91;
MatrixA(27,8) = 172.83;
MatrixA(27,9) = -7074.06;
MatrixA(27,10) = 69.6003;
MatrixA(27,11) = -38.2091;
MatrixA(27,12) = -43.9607;
MatrixA(27,13) = -0.647015;
MatrixA(27,14) = -29.3502;
MatrixA(27,15) = -35.2695;
MatrixA(27,16) = -16.8624;
MatrixA(27,17) = 8.61214;
MatrixA(27,18) = -2.64711;
MatrixA(27,19) = -26.8008;
MatrixA(27,20) = -0.0027351;
MatrixA(27,21) = -0.00254594;
MatrixA(27,22) = -1.23627e-05;
MatrixA(27,23) = 0.0139844;
MatrixA(27,24) = -0.000964974;
MatrixA(27,25) = -0.0381347;
MatrixA(27,26) = -6.65556;
MatrixA(27,27) = -184.644;
MatrixA(27,28) = 12.4879;
MatrixA(27,29) = -6.72928;
MatrixA(27,30) = 0.222308;
MatrixA(27,31) = 0.222308;
MatrixA(27,32) = -7.58133e-14;
MatrixA(27,33) = 7.09906e-16;
MatrixA(28,1) = -6159.5;
MatrixA(28,2) = -14468.9;
MatrixA(28,3) = -4263.23;
MatrixA(28,8) = -52.2515;
MatrixA(28,9) = 72.4472;
MatrixA(28,10) = -6898.23;
MatrixA(28,11) = 147.771;
MatrixA(28,12) = 45.3461;
MatrixA(28,13) = 44.2141;
MatrixA(28,14) = -136.006;
MatrixA(28,15) = 53.4486;
MatrixA(28,16) = 30.3308;
MatrixA(28,17) = 28.3374;
MatrixA(28,18) = -163.951;
MatrixA(28,19) = 17.9811;
MatrixA(28,20) = 0.000163078;
MatrixA(28,21) = 0.00324417;
MatrixA(28,22) = 7.37113e-07;
MatrixA(28,23) = 0.000872459;
MatrixA(28,24) = -7.46902e-05;
MatrixA(28,25) = -0.00202821;
MatrixA(28,26) = -7.00201;
MatrixA(28,27) = 13.0304;
MatrixA(28,28) = -175.564;
MatrixA(28,29) = -9.00743;
MatrixA(28,30) = -0.252954;
MatrixA(28,31) = -0.252954;
MatrixA(28,32) = 7.16543e-14;
MatrixA(28,33) = -5.83599e-15;
MatrixA(29,1) = -6159.5;
MatrixA(29,2) = -14468.9;
MatrixA(29,3) = 4261.87;
MatrixA(29,8) = 72.4472;
MatrixA(29,9) = -52.2515;
MatrixA(29,10) = 147.771;
MatrixA(29,11) = -6898.23;
MatrixA(29,12) = -44.2139;
MatrixA(29,13) = -45.3466;
MatrixA(29,14) = -53.4316;
MatrixA(29,15) = 135.85;
MatrixA(29,16) = 28.3374;
MatrixA(29,17) = 30.3308;
MatrixA(29,18) = 17.9811;
MatrixA(29,19) = -163.951;
MatrixA(29,20) = 0.000163078;
MatrixA(29,21) = -0.00324249;
MatrixA(29,22) = 7.37113e-07;
MatrixA(29,23) = -0.000389606;
MatrixA(29,24) = -7.46902e-05;
MatrixA(29,25) = 0.00163019;
MatrixA(29,26) = 13.0304;
MatrixA(29,27) = -7.00201;
MatrixA(29,28) = -9.00743;
MatrixA(29,29) = -175.564;
MatrixA(29,30) = -0.252954;
MatrixA(29,31) = -0.252954;
MatrixA(29,32) = -7.16543e-14;
MatrixA(29,33) = -9.2635e-14;
MatrixA(30,1) = 236.173;
MatrixA(30,2) = -1.76852;
MatrixA(30,3) = 284.963;
MatrixA(30,8) = 301.837;
MatrixA(30,9) = -46.6755;
MatrixA(30,10) = -31.3121;
MatrixA(30,11) = -25.8627;
MatrixA(30,12) = 14.238;
MatrixA(30,13) = 2.30232;
MatrixA(30,14) = -7.92012;
MatrixA(30,15) = 10.5285;
MatrixA(30,16) = -16315.4;
MatrixA(30,17) = 2174.22;
MatrixA(30,18) = 5.07648;
MatrixA(30,19) = 5.69613;
MatrixA(30,20) = -0.0509114;
MatrixA(30,21) = 0.000392758;
MatrixA(30,22) = -0.000230162;
MatrixA(30,23) = 0.0475033;
MatrixA(30,24) = 0.0284906;
MatrixA(30,25) = 0.00200314;
MatrixA(30,26) = 2.90932;
MatrixA(30,27) = 11.2194;
MatrixA(30,28) = -9.48095;
MatrixA(30,29) = -8.50035;
MatrixA(30,30) = -67.5405;
MatrixA(30,31) = -67.5405;
MatrixA(30,32) = 2.82655e-15;
MatrixA(30,33) = -3.70746e-15;
MatrixA(31,1) = 236.173;
MatrixA(31,2) = -1.76852;
MatrixA(31,3) = -285.514;
MatrixA(31,8) = -46.6755;
MatrixA(31,9) = 301.837;
MatrixA(31,10) = -25.8627;
MatrixA(31,11) = -31.3121;
MatrixA(31,12) = -2.31034;
MatrixA(31,13) = -14.1778;
MatrixA(31,14) = -10.5231;
MatrixA(31,15) = 7.92492;
MatrixA(31,16) = 2174.22;
MatrixA(31,17) = -16315.4;
MatrixA(31,18) = 5.69613;
MatrixA(31,19) = 5.07648;
MatrixA(31,20) = -0.0509114;
MatrixA(31,21) = -0.000391003;
MatrixA(31,22) = -0.000230162;
MatrixA(31,23) = -0.0474629;
MatrixA(31,24) = 0.0284906;
MatrixA(31,25) = -0.0020127;
MatrixA(31,26) = 11.2194;
MatrixA(31,27) = 2.90932;
MatrixA(31,28) = -8.50035;
MatrixA(31,29) = -9.48095;
MatrixA(31,30) = -67.5405;
MatrixA(31,31) = -67.5405;
MatrixA(31,32) = -2.8257e-15;
MatrixA(31,33) = -5.88518e-15;
MatrixA(32,1) = -48.6335;
MatrixA(32,2) = -128.19;
MatrixA(32,3) = -29.7214;
MatrixA(32,8) = 25.5415;
MatrixA(32,9) = 25.5412;
MatrixA(32,10) = -77.0635;
MatrixA(32,11) = -29.3131;
MatrixA(32,12) = 1.82533;
MatrixA(32,13) = -1.82069;
MatrixA(32,14) = -17.346;
MatrixA(32,15) = 9.36092;
MatrixA(32,16) = 16.255;
MatrixA(32,17) = 16.2497;
MatrixA(32,18) = -16992.8;
MatrixA(32,19) = 6.06347;
MatrixA(32,20) = -0.0605119;
MatrixA(32,21) = 8.28933e-07;
MatrixA(32,22) = -0.000273565;
MatrixA(32,23) = 0.0425327;
MatrixA(32,24) = 0.0338568;
MatrixA(32,25) = -0.000181449;
MatrixA(32,26) = 8.37123;
MatrixA(32,27) = 8.3711;
MatrixA(32,28) = -9.11692;
MatrixA(32,29) = -9.12396;
MatrixA(32,30) = -0.202075;
MatrixA(32,31) = -0.202075;
MatrixA(32,32) = -7.6233e-18;
MatrixA(32,33) = -4.85943e-15;
MatrixA(33,1) = -48.6335;
MatrixA(33,2) = -128.19;
MatrixA(33,3) = 26.3848;
MatrixA(33,8) = 25.5412;
MatrixA(33,9) = 25.5415;
MatrixA(33,10) = -29.3131;
MatrixA(33,11) = -77.0635;
MatrixA(33,12) = 1.82062;
MatrixA(33,13) = -1.8254;
MatrixA(33,14) = -9.35519;
MatrixA(33,15) = 1.1942;
MatrixA(33,16) = 16.2497;
MatrixA(33,17) = 16.255;
MatrixA(33,18) = 6.06347;
MatrixA(33,19) = -16992.8;
MatrixA(33,20) = -0.0605119;
MatrixA(33,21) = 1.04364e-06;
MatrixA(33,22) = -0.000273565;
MatrixA(33,23) = -0.0424912;
MatrixA(33,24) = 0.0338568;
MatrixA(33,25) = 0.000198108;
MatrixA(33,26) = 8.3711;
MatrixA(33,27) = 8.37123;
MatrixA(33,28) = -9.12396;
MatrixA(33,29) = -9.11692;
MatrixA(33,30) = -0.202075;
MatrixA(33,31) = -0.202075;
MatrixA(33,32) = 8.47033e-18;
MatrixA(33,33) = -4.87552e-15;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -0.225832;
MatrixB(13,1) = -0.225831;
MatrixB(16,1) = -0.0272337;
MatrixB(17,1) = 0.00781434;
MatrixB(20,1) = 8.96607e-08;
MatrixB(21,1) = 0.00284557;
MatrixB(22,1) = 2.24849e-07;
MatrixB(23,1) = -0.00430031;
MatrixB(24,1) = -1.52434e-07;
MatrixB(25,1) = -0.00399797;
MatrixB(26,1) = 1.09091;
MatrixB(27,1) = -1.09063;
MatrixB(28,1) = 0.00252422;
MatrixB(29,1) = -0.00252426;
MatrixB(30,1) = -0.0795108;
MatrixB(31,1) = 0.0795196;
MatrixB(32,1) = 4.2979e-07;
MatrixB(33,1) = -1.24922e-07;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -1.3676e-13;
MatrixC(2,2) = -2.52907e-13;
MatrixC(2,3) = 15.9953;
MatrixC(2,8) = 13.4962;
MatrixC(2,9) = -13.4962;
MatrixC(2,10) = -0.261783;
MatrixC(2,11) = 0.261783;
MatrixC(2,12) = -39.7637;
MatrixC(2,13) = -39.764;
MatrixC(2,14) = -36.0806;
MatrixC(2,15) = -36.0804;
MatrixC(2,16) = -0.249597;
MatrixC(2,17) = 0.249597;
MatrixC(2,18) = 0.000311778;
MatrixC(2,19) = -0.000311778;
MatrixC(2,20) = 9.96928e-18;
MatrixC(2,21) = -0.00653006;
MatrixC(2,22) = 3.42958e-17;
MatrixC(2,23) = 8.31521e-05;
MatrixC(2,24) = -1.4507e-14;
MatrixC(2,25) = -0.000281665;
MatrixC(2,26) = 6.80852e-06;
MatrixC(2,27) = -6.80852e-06;
MatrixC(2,28) = -2.02905e-05;
MatrixC(2,29) = 2.02905e-05;
MatrixC(2,30) = 1.96231e-19;
MatrixC(2,31) = -2.07425e-19;
MatrixC(2,32) = -3.20547e-21;
MatrixC(2,33) = 3.53077e-21;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.000353246;
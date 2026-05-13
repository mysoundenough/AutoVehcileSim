% MATLAB linearized CarSim 2024.1 model, calculated at t = 60.0045 s.
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

MatrixA(1,2) = -8.33333;
MatrixA(1,3) = -1.77249e-05;
MatrixA(1,20) = -0.00425402;
MatrixA(1,22) = 0.999991;
MatrixA(1,24) = -1.09769;
MatrixA(2,3) = -6.871e-12;
MatrixA(2,23) = 2.55698e-17;
MatrixA(2,24) = 1;
MatrixA(3,2) = 1.399e-16;
MatrixA(3,3) = 5.8458e-11;
MatrixA(3,23) = 0.00425405;
MatrixA(3,24) = -1.08772e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 1.53157e-07;
MatrixA(12,2) = 0.123969;
MatrixA(12,3) = 0.000478443;
MatrixA(12,8) = 1.82458;
MatrixA(12,12) = -14.6423;
MatrixA(12,20) = 1.18369e-10;
MatrixA(12,21) = 1.73583;
MatrixA(12,22) = 5.23943e-13;
MatrixA(12,23) = 1.9115;
MatrixA(12,24) = -6.47762e-11;
MatrixA(12,25) = 0.941894;
MatrixA(12,26) = 0.0600811;
MatrixA(13,1) = -1.53157e-07;
MatrixA(13,2) = -0.123969;
MatrixA(13,3) = 0.000383441;
MatrixA(13,9) = -1.82458;
MatrixA(13,13) = -14.3287;
MatrixA(13,20) = -1.18369e-10;
MatrixA(13,21) = 1.73583;
MatrixA(13,22) = -5.05876e-13;
MatrixA(13,23) = 1.9115;
MatrixA(13,24) = 6.47762e-11;
MatrixA(13,25) = 0.941894;
MatrixA(13,27) = -0.0600811;
MatrixA(14,1) = 6.45442e-08;
MatrixA(14,2) = 0.00221861;
MatrixA(14,3) = 5.97418e-09;
MatrixA(14,10) = -0.378958;
MatrixA(14,14) = -15.3122;
MatrixA(14,20) = 7.46898e-10;
MatrixA(14,21) = 1.83427;
MatrixA(14,22) = 3.17735e-12;
MatrixA(14,23) = -2.2907;
MatrixA(14,24) = -4.0878e-10;
MatrixA(14,25) = 1.01365;
MatrixA(14,28) = 0.321105;
MatrixA(15,1) = -6.4544e-08;
MatrixA(15,2) = -0.00221861;
MatrixA(15,3) = 1.03121e-07;
MatrixA(15,11) = 0.378958;
MatrixA(15,15) = -15.313;
MatrixA(15,20) = -7.46898e-10;
MatrixA(15,21) = 1.83427;
MatrixA(15,22) = -3.17727e-12;
MatrixA(15,23) = -2.2907;
MatrixA(15,24) = 4.0878e-10;
MatrixA(15,25) = 1.01365;
MatrixA(15,29) = -0.321105;
MatrixA(16,1) = 2.62259e-07;
MatrixA(16,2) = 0.0749552;
MatrixA(16,3) = 1.78691e-05;
MatrixA(16,8) = 0.063017;
MatrixA(16,16) = -166.667;
MatrixA(16,20) = -20.0053;
MatrixA(16,21) = 0.0586029;
MatrixA(16,22) = -0.0851136;
MatrixA(16,23) = 12.1225;
MatrixA(16,24) = 9.29578;
MatrixA(16,25) = -0.0229674;
MatrixA(16,26) = -0.587843;
MatrixA(16,30) = 4.82184;
MatrixA(17,1) = 2.62259e-07;
MatrixA(17,2) = 0.0749552;
MatrixA(17,3) = -1.61988e-05;
MatrixA(17,9) = 0.063017;
MatrixA(17,17) = -166.667;
MatrixA(17,20) = -20.0053;
MatrixA(17,21) = -0.0690305;
MatrixA(17,22) = -0.0851136;
MatrixA(17,23) = -14.2788;
MatrixA(17,24) = 9.29578;
MatrixA(17,25) = 0.0194995;
MatrixA(17,27) = -0.587843;
MatrixA(17,31) = 4.82184;
MatrixA(18,1) = 2.64732e-07;
MatrixA(18,2) = 0.0606732;
MatrixA(18,3) = 1.88926e-07;
MatrixA(18,10) = 6.99788e-05;
MatrixA(18,18) = -153.698;
MatrixA(18,20) = -18.3912;
MatrixA(18,21) = -0.000135674;
MatrixA(18,22) = -0.0782374;
MatrixA(18,23) = 13.7492;
MatrixA(18,24) = 10.9442;
MatrixA(18,25) = -0.0538677;
MatrixA(18,28) = 2.32092;
MatrixA(18,32) = 5.68;
MatrixA(19,1) = 2.64733e-07;
MatrixA(19,2) = 0.0606732;
MatrixA(19,3) = -1.88926e-07;
MatrixA(19,11) = 6.99788e-05;
MatrixA(19,19) = -153.698;
MatrixA(19,20) = -18.3912;
MatrixA(19,21) = 0.000147475;
MatrixA(19,22) = -0.0782374;
MatrixA(19,23) = -12.6452;
MatrixA(19,24) = 10.9442;
MatrixA(19,25) = 0.0585659;
MatrixA(19,29) = 2.32092;
MatrixA(19,33) = 5.68;
MatrixA(20,1) = -52.5515;
MatrixA(20,2) = -129.084;
MatrixA(20,3) = 0.00801428;
MatrixA(20,8) = 0.596187;
MatrixA(20,9) = 0.596187;
MatrixA(20,10) = -29.045;
MatrixA(20,11) = -29.045;
MatrixA(20,12) = -0.217374;
MatrixA(20,13) = 0.217156;
MatrixA(20,14) = -0.498293;
MatrixA(20,15) = 0.556677;
MatrixA(20,16) = 62.5632;
MatrixA(20,17) = 62.5632;
MatrixA(20,18) = 56.5503;
MatrixA(20,19) = 56.5503;
MatrixA(20,20) = -0.00554448;
MatrixA(20,21) = -8.26292e-07;
MatrixA(20,22) = -2.35989e-05;
MatrixA(20,23) = -1.12529e-05;
MatrixA(20,24) = -0.0352319;
MatrixA(20,25) = -2.07351e-06;
MatrixA(20,26) = -0.250974;
MatrixA(20,27) = -0.250974;
MatrixA(20,28) = -0.514839;
MatrixA(20,29) = -0.514839;
MatrixA(20,30) = 0.00254873;
MatrixA(20,31) = 0.00254873;
MatrixA(20,32) = -1.06269e-14;
MatrixA(20,33) = 9.77137e-15;
MatrixA(21,1) = -2.5279e-13;
MatrixA(21,2) = -1.67474e-13;
MatrixA(21,3) = 30.8784;
MatrixA(21,8) = 1.63016;
MatrixA(21,9) = -1.63016;
MatrixA(21,10) = 17.5063;
MatrixA(21,11) = -17.5063;
MatrixA(21,12) = -37.7302;
MatrixA(21,13) = -37.7305;
MatrixA(21,14) = -33.336;
MatrixA(21,15) = -33.3352;
MatrixA(21,16) = -0.672628;
MatrixA(21,17) = 0.672628;
MatrixA(21,18) = -0.562542;
MatrixA(21,19) = 0.562542;
MatrixA(21,20) = -3.9708e-15;
MatrixA(21,21) = -0.0192126;
MatrixA(21,22) = -4.28235e-14;
MatrixA(21,23) = -8.34786;
MatrixA(21,24) = -2.75253e-14;
MatrixA(21,25) = 0.0341857;
MatrixA(21,26) = -0.752841;
MatrixA(21,27) = 0.752841;
MatrixA(21,28) = -0.0965528;
MatrixA(21,29) = 0.0965528;
MatrixA(21,30) = 2.37245e-13;
MatrixA(21,31) = -2.57019e-13;
MatrixA(21,32) = 1.09891e-13;
MatrixA(21,33) = -1.17834e-13;
MatrixA(22,1) = -13.4066;
MatrixA(22,2) = -27.7432;
MatrixA(22,3) = 0.0602158;
MatrixA(22,8) = 22.6815;
MatrixA(22,9) = 22.6815;
MatrixA(22,10) = 16.8901;
MatrixA(22,11) = 16.8901;
MatrixA(22,12) = 1.78819;
MatrixA(22,13) = -1.7882;
MatrixA(22,14) = 7.36273;
MatrixA(22,15) = -7.35496;
MatrixA(22,16) = -1.5734;
MatrixA(22,17) = -1.5734;
MatrixA(22,18) = 7.48571;
MatrixA(22,19) = 7.48571;
MatrixA(22,20) = 0.00390737;
MatrixA(22,21) = 2.4683e-07;
MatrixA(22,22) = 1.66211e-05;
MatrixA(22,23) = -1.84916e-05;
MatrixA(22,24) = 8.33328;
MatrixA(22,25) = -3.75421e-06;
MatrixA(22,26) = 7.62639;
MatrixA(22,27) = 7.62639;
MatrixA(22,28) = 7.18143;
MatrixA(22,29) = 7.18143;
MatrixA(22,30) = 8.19208e-06;
MatrixA(22,31) = 8.19208e-06;
MatrixA(22,32) = 1.48226e-13;
MatrixA(22,33) = -1.36293e-13;
MatrixA(23,1) = -3.0816e-13;
MatrixA(23,2) = -1.42128e-12;
MatrixA(23,3) = 2.01672;
MatrixA(23,8) = 3.41915;
MatrixA(23,9) = -3.41915;
MatrixA(23,10) = -3.44589;
MatrixA(23,11) = 3.44589;
MatrixA(23,12) = -37.6663;
MatrixA(23,13) = -37.6668;
MatrixA(23,14) = 39.7678;
MatrixA(23,15) = 39.8034;
MatrixA(23,16) = -39.1999;
MatrixA(23,17) = 39.1999;
MatrixA(23,18) = -34.624;
MatrixA(23,19) = 34.624;
MatrixA(23,20) = 2.27502e-15;
MatrixA(23,21) = -0.00769907;
MatrixA(23,22) = -8.12681e-15;
MatrixA(23,23) = 0.00109531;
MatrixA(23,24) = -4.82552e-15;
MatrixA(23,25) = -0.115476;
MatrixA(23,26) = -0.2071;
MatrixA(23,27) = 0.2071;
MatrixA(23,28) = -0.0545904;
MatrixA(23,29) = 0.0545904;
MatrixA(23,30) = -3.31014e-12;
MatrixA(23,31) = 3.33136e-12;
MatrixA(23,32) = 4.95475e-12;
MatrixA(23,33) = -4.95822e-12;
MatrixA(24,1) = 1.54082;
MatrixA(24,2) = 2.93817;
MatrixA(24,3) = 0.053418;
MatrixA(24,8) = -25.273;
MatrixA(24,9) = -25.273;
MatrixA(24,10) = 29.2764;
MatrixA(24,11) = 29.2764;
MatrixA(24,12) = -1.88011;
MatrixA(24,13) = 1.88018;
MatrixA(24,14) = 9.34631;
MatrixA(24,15) = -9.35252;
MatrixA(24,16) = -16.2198;
MatrixA(24,17) = -16.2198;
MatrixA(24,18) = -6.07568;
MatrixA(24,19) = -6.07568;
MatrixA(24,20) = -0.00395741;
MatrixA(24,21) = -9.36544e-07;
MatrixA(24,22) = -1.6834e-05;
MatrixA(24,23) = -2.06992e-05;
MatrixA(24,24) = -6.10959e-05;
MatrixA(24,25) = -8.24607e-06;
MatrixA(24,26) = -8.36624;
MatrixA(24,27) = -8.36624;
MatrixA(24,28) = 9.1243;
MatrixA(24,29) = 9.1243;
MatrixA(24,30) = 0.0851261;
MatrixA(24,31) = 0.0851261;
MatrixA(24,32) = 1.88326e-13;
MatrixA(24,33) = -1.73165e-13;
MatrixA(25,1) = 2.49357e-12;
MatrixA(25,2) = 2.79428e-12;
MatrixA(25,3) = 38.5584;
MatrixA(25,8) = 89.2773;
MatrixA(25,9) = -89.2773;
MatrixA(25,10) = 77.2217;
MatrixA(25,11) = -77.2217;
MatrixA(25,12) = -60.5928;
MatrixA(25,13) = -60.5934;
MatrixA(25,14) = -45.206;
MatrixA(25,15) = -45.2215;
MatrixA(25,16) = -2.10542;
MatrixA(25,17) = 2.10542;
MatrixA(25,18) = 15.2993;
MatrixA(25,19) = -15.2993;
MatrixA(25,20) = 2.65512e-13;
MatrixA(25,21) = -0.0120374;
MatrixA(25,22) = 1.01635e-12;
MatrixA(25,23) = 0.342727;
MatrixA(25,24) = 1.13317e-12;
MatrixA(25,25) = -0.0178713;
MatrixA(25,26) = 14.4432;
MatrixA(25,27) = -14.4432;
MatrixA(25,28) = 13.6891;
MatrixA(25,29) = -13.6891;
MatrixA(25,30) = -6.99382e-12;
MatrixA(25,31) = 7.35713e-12;
MatrixA(25,32) = -9.24094e-13;
MatrixA(25,33) = 1.56812e-12;
MatrixA(26,1) = -6292.48;
MatrixA(26,2) = 40.3897;
MatrixA(26,3) = -4499.68;
MatrixA(26,8) = -7074.51;
MatrixA(26,9) = 173.054;
MatrixA(26,10) = -38.2117;
MatrixA(26,11) = 69.5408;
MatrixA(26,12) = -0.662345;
MatrixA(26,13) = 43.9909;
MatrixA(26,14) = 35.2923;
MatrixA(26,15) = 29.4034;
MatrixA(26,16) = 8.53379;
MatrixA(26,17) = -16.9233;
MatrixA(26,18) = -26.7931;
MatrixA(26,19) = -2.6954;
MatrixA(26,20) = -0.00819976;
MatrixA(26,21) = 0.00765892;
MatrixA(26,22) = -3.48801e-05;
MatrixA(26,23) = -0.0398362;
MatrixA(26,24) = -0.00243844;
MatrixA(26,25) = 0.11713;
MatrixA(26,26) = -184.642;
MatrixA(26,27) = -6.65189;
MatrixA(26,28) = -6.73356;
MatrixA(26,29) = 12.4931;
MatrixA(26,30) = 0.0936563;
MatrixA(26,31) = 0.0936563;
MatrixA(26,32) = 8.96295e-13;
MatrixA(26,33) = -1.3439e-12;
MatrixA(27,1) = -6292.48;
MatrixA(27,2) = 40.3897;
MatrixA(27,3) = 4498.98;
MatrixA(27,8) = 173.054;
MatrixA(27,9) = -7074.51;
MatrixA(27,10) = 69.5408;
MatrixA(27,11) = -38.2117;
MatrixA(27,12) = -43.9904;
MatrixA(27,13) = 0.662314;
MatrixA(27,14) = -29.4063;
MatrixA(27,15) = -35.3198;
MatrixA(27,16) = -16.9233;
MatrixA(27,17) = 8.53379;
MatrixA(27,18) = -2.6954;
MatrixA(27,19) = -26.7931;
MatrixA(27,20) = -0.00819976;
MatrixA(27,21) = -0.00766146;
MatrixA(27,22) = -3.48801e-05;
MatrixA(27,23) = 0.0398137;
MatrixA(27,24) = -0.00243844;
MatrixA(27,25) = -0.117698;
MatrixA(27,26) = -6.65189;
MatrixA(27,27) = -184.642;
MatrixA(27,28) = 12.4931;
MatrixA(27,29) = -6.73356;
MatrixA(27,30) = 0.0936563;
MatrixA(27,31) = 0.0936563;
MatrixA(27,32) = -7.77419e-13;
MatrixA(27,33) = 1.2346e-12;
MatrixA(28,1) = -6161.27;
MatrixA(28,2) = -14471.4;
MatrixA(28,3) = -4263.72;
MatrixA(28,8) = -52.7122;
MatrixA(28,9) = 71.9012;
MatrixA(28,10) = -6897.92;
MatrixA(28,11) = 147.771;
MatrixA(28,12) = 45.1827;
MatrixA(28,13) = 44.0146;
MatrixA(28,14) = -135.784;
MatrixA(28,15) = 53.4569;
MatrixA(28,16) = 30.3337;
MatrixA(28,17) = 28.2035;
MatrixA(28,18) = -164.216;
MatrixA(28,19) = 17.9811;
MatrixA(28,20) = 0.000490199;
MatrixA(28,21) = 0.00972802;
MatrixA(28,22) = 2.0852e-06;
MatrixA(28,23) = -0.000685817;
MatrixA(28,24) = -6.26312e-05;
MatrixA(28,25) = -0.00525523;
MatrixA(28,26) = -7.00547;
MatrixA(28,27) = 13.0211;
MatrixA(28,28) = -175.579;
MatrixA(28,29) = -9.00849;
MatrixA(28,30) = -0.106564;
MatrixA(28,31) = -0.106564;
MatrixA(28,32) = -2.73407e-12;
MatrixA(28,33) = -7.89502e-13;
MatrixA(29,1) = -6161.27;
MatrixA(29,2) = -14471.4;
MatrixA(29,3) = 4262.37;
MatrixA(29,8) = 71.9012;
MatrixA(29,9) = -52.7122;
MatrixA(29,10) = 147.771;
MatrixA(29,11) = -6897.92;
MatrixA(29,12) = -44.0143;
MatrixA(29,13) = -45.1832;
MatrixA(29,14) = -53.4386;
MatrixA(29,15) = 135.613;
MatrixA(29,16) = 28.2035;
MatrixA(29,17) = 30.3337;
MatrixA(29,18) = 17.9811;
MatrixA(29,19) = -164.216;
MatrixA(29,20) = 0.000490199;
MatrixA(29,21) = -0.00972634;
MatrixA(29,22) = 2.08521e-06;
MatrixA(29,23) = 0.00116784;
MatrixA(29,24) = -6.26312e-05;
MatrixA(29,25) = 0.00485696;
MatrixA(29,26) = 13.0211;
MatrixA(29,27) = -7.00547;
MatrixA(29,28) = -9.00849;
MatrixA(29,29) = -175.579;
MatrixA(29,30) = -0.106564;
MatrixA(29,31) = -0.106564;
MatrixA(29,32) = -1.07583e-12;
MatrixA(29,33) = 4.29268e-12;
MatrixA(30,1) = 487.021;
MatrixA(30,2) = -2.13353;
MatrixA(30,3) = 530.619;
MatrixA(30,8) = 600.858;
MatrixA(30,9) = -94.364;
MatrixA(30,10) = -31.2572;
MatrixA(30,11) = -25.8599;
MatrixA(30,12) = 16.8172;
MatrixA(30,13) = 2.69325;
MatrixA(30,14) = -7.91858;
MatrixA(30,15) = 10.5098;
MatrixA(30,16) = -16137.9;
MatrixA(30,17) = 2296.28;
MatrixA(30,18) = 5.09483;
MatrixA(30,19) = 5.70702;
MatrixA(30,20) = -0.0474071;
MatrixA(30,21) = 0.000692283;
MatrixA(30,22) = -0.000201673;
MatrixA(30,23) = 0.0453792;
MatrixA(30,24) = 0.0278561;
MatrixA(30,25) = 0.00634135;
MatrixA(30,26) = 1.14412;
MatrixA(30,27) = 9.38363;
MatrixA(30,28) = -9.4782;
MatrixA(30,29) = -8.50613;
MatrixA(30,30) = -27.9359;
MatrixA(30,31) = -27.9359;
MatrixA(30,32) = -1.86707e-13;
MatrixA(30,33) = 1.489e-13;
MatrixA(31,1) = 487.021;
MatrixA(31,2) = -2.13353;
MatrixA(31,3) = -531.158;
MatrixA(31,8) = -94.364;
MatrixA(31,9) = 600.858;
MatrixA(31,10) = -25.8599;
MatrixA(31,11) = -31.2572;
MatrixA(31,12) = -2.70128;
MatrixA(31,13) = -16.7607;
MatrixA(31,14) = -10.504;
MatrixA(31,15) = 7.9238;
MatrixA(31,16) = 2296.28;
MatrixA(31,17) = -16137.9;
MatrixA(31,18) = 5.70702;
MatrixA(31,19) = 5.09483;
MatrixA(31,20) = -0.0474071;
MatrixA(31,21) = -0.000690526;
MatrixA(31,22) = -0.000201673;
MatrixA(31,23) = -0.0453388;
MatrixA(31,24) = 0.0278561;
MatrixA(31,25) = -0.00635083;
MatrixA(31,26) = 9.38363;
MatrixA(31,27) = 1.14412;
MatrixA(31,28) = -8.50613;
MatrixA(31,29) = -9.4782;
MatrixA(31,30) = -27.9359;
MatrixA(31,31) = -27.9359;
MatrixA(31,32) = -1.84491e-13;
MatrixA(31,33) = 1.92412e-13;
MatrixA(32,1) = -47.3498;
MatrixA(32,2) = -127.185;
MatrixA(32,3) = -28.0794;
MatrixA(32,8) = 25.2731;
MatrixA(32,9) = 25.2729;
MatrixA(32,10) = -75.1687;
MatrixA(32,11) = -29.277;
MatrixA(32,12) = 1.88408;
MatrixA(32,13) = -1.87621;
MatrixA(32,14) = -17.9719;
MatrixA(32,15) = 9.34775;
MatrixA(32,16) = 16.2244;
MatrixA(32,17) = 16.2154;
MatrixA(32,18) = -17009.2;
MatrixA(32,19) = 6.07164;
MatrixA(32,20) = -0.057938;
MatrixA(32,21) = 1.29603e-06;
MatrixA(32,22) = -0.000246473;
MatrixA(32,23) = 0.0425805;
MatrixA(32,24) = 0.0339367;
MatrixA(32,25) = -0.000159944;
MatrixA(32,26) = 8.36636;
MatrixA(32,27) = 8.36614;
MatrixA(32,28) = -9.11747;
MatrixA(32,29) = -9.12443;
MatrixA(32,30) = -0.0851264;
MatrixA(32,31) = -0.0851264;
MatrixA(32,32) = -1.8891e-13;
MatrixA(32,33) = 1.73743e-13;
MatrixA(33,1) = -47.3498;
MatrixA(33,2) = -127.185;
MatrixA(33,3) = 24.6223;
MatrixA(33,8) = 25.2729;
MatrixA(33,9) = 25.2731;
MatrixA(33,10) = -29.277;
MatrixA(33,11) = -75.1687;
MatrixA(33,12) = 1.87614;
MatrixA(33,13) = -1.88416;
MatrixA(33,14) = -9.34153;
MatrixA(33,15) = 0.410183;
MatrixA(33,16) = 16.2154;
MatrixA(33,17) = 16.2244;
MatrixA(33,18) = 6.07164;
MatrixA(33,19) = -17009.2;
MatrixA(33,20) = -0.057938;
MatrixA(33,21) = 5.77065e-07;
MatrixA(33,22) = -0.000246473;
MatrixA(33,23) = -0.0425391;
MatrixA(33,24) = 0.0339367;
MatrixA(33,25) = 0.000176435;
MatrixA(33,26) = 8.36614;
MatrixA(33,27) = 8.36636;
MatrixA(33,28) = -9.12443;
MatrixA(33,29) = -9.11747;
MatrixA(33,30) = -0.0851264;
MatrixA(33,31) = -0.0851264;
MatrixA(33,32) = -1.87754e-13;
MatrixA(33,33) = 1.72596e-13;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -0.67869;
MatrixB(13,1) = -0.678688;
MatrixB(16,1) = -0.026807;
MatrixB(17,1) = 0.0230702;
MatrixB(20,1) = 1.06833e-07;
MatrixB(21,1) = 0.00381959;
MatrixB(22,1) = 2.24681e-07;
MatrixB(23,1) = -0.00336586;
MatrixB(24,1) = -1.4806e-07;
MatrixB(25,1) = -0.00214332;
MatrixB(26,1) = 1.09471;
MatrixB(27,1) = -1.09444;
MatrixB(28,1) = 0.00117149;
MatrixB(29,1) = -0.00117154;
MatrixB(30,1) = -0.140734;
MatrixB(31,1) = 0.140732;
MatrixB(32,1) = 5.20828e-07;
MatrixB(33,1) = -2.24708e-07;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -1.54889e-13;
MatrixC(2,2) = -6.12976e-14;
MatrixC(2,3) = 15.6814;
MatrixC(2,8) = 13.286;
MatrixC(2,9) = -13.286;
MatrixC(2,10) = -0.269351;
MatrixC(2,11) = 0.269351;
MatrixC(2,12) = -39.6356;
MatrixC(2,13) = -39.6359;
MatrixC(2,14) = -36.1169;
MatrixC(2,15) = -36.1167;
MatrixC(2,16) = -0.284685;
MatrixC(2,17) = 0.284685;
MatrixC(2,18) = 0.000513315;
MatrixC(2,19) = -0.000513315;
MatrixC(2,20) = 4.66773e-17;
MatrixC(2,21) = -0.0195902;
MatrixC(2,22) = 1.73355e-17;
MatrixC(2,23) = 0.000249491;
MatrixC(2,24) = 6.64458e-17;
MatrixC(2,25) = -0.000845488;
MatrixC(2,26) = 1.97007e-05;
MatrixC(2,27) = -1.97007e-05;
MatrixC(2,28) = -6.0671e-05;
MatrixC(2,29) = 6.0671e-05;
MatrixC(2,30) = 2.69407e-19;
MatrixC(2,31) = -4.20405e-19;
MatrixC(2,32) = -4.56185e-19;
MatrixC(2,33) = 4.53754e-19;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.00145473;
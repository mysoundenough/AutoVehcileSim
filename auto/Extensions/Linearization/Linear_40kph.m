% MATLAB linearized CarSim 2024.1 model, calculated at t = 75.0055 s.
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

MatrixA(1,2) = -11.1111;
MatrixA(1,3) = -2.22669e-05;
MatrixA(1,20) = -0.00400808;
MatrixA(1,22) = 0.999992;
MatrixA(1,24) = -1.09783;
MatrixA(2,3) = -9.69224e-13;
MatrixA(2,23) = -4.43117e-17;
MatrixA(2,24) = 1;
MatrixA(3,2) = 2.38385e-16;
MatrixA(3,3) = 7.7676e-12;
MatrixA(3,23) = 0.00400811;
MatrixA(3,24) = 1.77606e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 2.1897e-08;
MatrixA(12,2) = 0.163788;
MatrixA(12,3) = 0.00062288;
MatrixA(12,8) = 2.4655;
MatrixA(12,12) = -19.5496;
MatrixA(12,20) = 1.22919e-11;
MatrixA(12,21) = 1.73843;
MatrixA(12,22) = 4.82507e-14;
MatrixA(12,23) = 1.91423;
MatrixA(12,24) = -6.71891e-12;
MatrixA(12,25) = 0.944089;
MatrixA(12,26) = 0.062151;
MatrixA(13,1) = -2.18967e-08;
MatrixA(13,2) = -0.163788;
MatrixA(13,3) = 0.00049839;
MatrixA(13,9) = -2.4655;
MatrixA(13,13) = -19.1364;
MatrixA(13,20) = -1.22798e-11;
MatrixA(13,21) = 1.73843;
MatrixA(13,22) = -6.03134e-14;
MatrixA(13,23) = 1.91423;
MatrixA(13,24) = 6.71891e-12;
MatrixA(13,25) = 0.944089;
MatrixA(13,27) = -0.062151;
MatrixA(14,1) = 7.92771e-09;
MatrixA(14,2) = 0.00401698;
MatrixA(14,3) = -8.78157e-08;
MatrixA(14,10) = -0.507152;
MatrixA(14,14) = -20.4028;
MatrixA(14,20) = 7.74862e-11;
MatrixA(14,21) = 1.83308;
MatrixA(14,22) = 3.10485e-13;
MatrixA(14,23) = -2.28936;
MatrixA(14,24) = -4.24226e-11;
MatrixA(14,25) = 1.01276;
MatrixA(14,28) = 0.320264;
MatrixA(15,1) = -7.92796e-09;
MatrixA(15,2) = -0.00401698;
MatrixA(15,3) = 1.03683e-07;
MatrixA(15,11) = 0.507152;
MatrixA(15,15) = -20.4042;
MatrixA(15,20) = -7.74861e-11;
MatrixA(15,21) = 1.83308;
MatrixA(15,22) = -3.10659e-13;
MatrixA(15,23) = -2.28936;
MatrixA(15,24) = 4.24223e-11;
MatrixA(15,25) = 1.01276;
MatrixA(15,29) = -0.320264;
MatrixA(16,1) = 9.65171e-08;
MatrixA(16,2) = 0.0671951;
MatrixA(16,3) = 1.15018e-05;
MatrixA(16,8) = 0.0421307;
MatrixA(16,16) = -124.171;
MatrixA(16,20) = -11.4291;
MatrixA(16,21) = 0.0388456;
MatrixA(16,22) = -0.0458227;
MatrixA(16,23) = 8.16063;
MatrixA(16,24) = 6.26015;
MatrixA(16,25) = -0.0114344;
MatrixA(16,26) = -0.334156;
MatrixA(16,30) = 3.24513;
MatrixA(17,1) = 9.65165e-08;
MatrixA(17,2) = 0.0671951;
MatrixA(17,3) = -1.33242e-05;
MatrixA(17,9) = 0.0421307;
MatrixA(17,17) = -124.171;
MatrixA(17,20) = -11.4291;
MatrixA(17,21) = -0.0388455;
MatrixA(17,22) = -0.0458227;
MatrixA(17,23) = -8.15715;
MatrixA(17,24) = 6.26015;
MatrixA(17,25) = 0.0114344;
MatrixA(17,27) = -0.334156;
MatrixA(17,31) = 3.24513;
MatrixA(18,1) = 1.28002e-08;
MatrixA(18,2) = 0.024765;
MatrixA(18,3) = 9.70279e-09;
MatrixA(18,10) = 3.9847e-05;
MatrixA(18,18) = -104.632;
MatrixA(18,20) = -9.47316;
MatrixA(18,21) = -9.54576e-05;
MatrixA(18,22) = -0.0379817;
MatrixA(18,23) = 6.5172;
MatrixA(18,24) = 5.189;
MatrixA(18,25) = -0.0261681;
MatrixA(18,28) = 1.10079;
MatrixA(18,32) = 2.6919;
MatrixA(19,1) = 1.28e-08;
MatrixA(19,2) = 0.024765;
MatrixA(19,3) = -1.3564e-08;
MatrixA(19,11) = 3.9847e-05;
MatrixA(19,19) = -104.632;
MatrixA(19,20) = -9.47316;
MatrixA(19,21) = 9.54575e-05;
MatrixA(19,22) = -0.0379817;
MatrixA(19,23) = -6.51431;
MatrixA(19,24) = 5.189;
MatrixA(19,25) = 0.0261682;
MatrixA(19,29) = 1.10079;
MatrixA(19,33) = 2.6919;
MatrixA(20,1) = -54.2646;
MatrixA(20,2) = -128.87;
MatrixA(20,3) = 0.00796225;
MatrixA(20,8) = -0.277248;
MatrixA(20,9) = -0.277248;
MatrixA(20,10) = -29.0063;
MatrixA(20,11) = -29.0063;
MatrixA(20,12) = -0.225755;
MatrixA(20,13) = 0.225804;
MatrixA(20,14) = -0.49514;
MatrixA(20,15) = 0.555841;
MatrixA(20,16) = 46.4885;
MatrixA(20,17) = 46.4885;
MatrixA(20,18) = 35.5305;
MatrixA(20,19) = 35.5305;
MatrixA(20,20) = -6.43629;
MatrixA(20,21) = -8.44273e-07;
MatrixA(20,22) = -0.0257865;
MatrixA(20,23) = -0.00135047;
MatrixA(20,24) = 3.47319;
MatrixA(20,25) = -2.07537e-06;
MatrixA(20,26) = -0.288973;
MatrixA(20,27) = -0.288973;
MatrixA(20,28) = -0.295778;
MatrixA(20,29) = -0.295778;
MatrixA(20,30) = 0.382509;
MatrixA(20,31) = 0.382509;
MatrixA(20,32) = 0.532489;
MatrixA(20,33) = 0.532489;
MatrixA(21,1) = -2.04208e-13;
MatrixA(21,2) = -1.85661e-13;
MatrixA(21,3) = 30.8181;
MatrixA(21,8) = 1.69443;
MatrixA(21,9) = -1.69443;
MatrixA(21,10) = 17.439;
MatrixA(21,11) = -17.439;
MatrixA(21,12) = -37.6273;
MatrixA(21,13) = -37.6279;
MatrixA(21,14) = -33.3653;
MatrixA(21,15) = -33.3644;
MatrixA(21,16) = -0.502689;
MatrixA(21,17) = 0.502689;
MatrixA(21,18) = -0.353495;
MatrixA(21,19) = 0.353495;
MatrixA(21,20) = -9.72763e-14;
MatrixA(21,21) = -0.0257037;
MatrixA(21,22) = 5.12948e-14;
MatrixA(21,23) = -11.1745;
MatrixA(21,24) = -7.95561e-14;
MatrixA(21,25) = 0.0429835;
MatrixA(21,26) = -0.747142;
MatrixA(21,27) = 0.747142;
MatrixA(21,28) = -0.100018;
MatrixA(21,29) = 0.100018;
MatrixA(21,30) = -0.00365205;
MatrixA(21,31) = 0.00365205;
MatrixA(21,32) = -0.00530479;
MatrixA(21,33) = 0.00530479;
MatrixA(22,1) = -13.318;
MatrixA(22,2) = -27.637;
MatrixA(22,3) = 0.0604837;
MatrixA(22,8) = 22.5079;
MatrixA(22,9) = 22.5079;
MatrixA(22,10) = 16.9333;
MatrixA(22,11) = 16.9333;
MatrixA(22,12) = 1.83872;
MatrixA(22,13) = -1.83874;
MatrixA(22,14) = 7.3548;
MatrixA(22,15) = -7.34671;
MatrixA(22,16) = -1.17826;
MatrixA(22,17) = -1.17826;
MatrixA(22,18) = 4.69791;
MatrixA(22,19) = 4.69791;
MatrixA(22,20) = -0.422613;
MatrixA(22,21) = 2.47318e-07;
MatrixA(22,22) = -0.00169344;
MatrixA(22,23) = -6.84719e-05;
MatrixA(22,24) = 11.3452;
MatrixA(22,25) = -3.79342e-06;
MatrixA(22,26) = 7.62766;
MatrixA(22,27) = 7.62766;
MatrixA(22,28) = 7.21074;
MatrixA(22,29) = 7.21074;
MatrixA(22,30) = -0.00964263;
MatrixA(22,31) = -0.00964263;
MatrixA(22,32) = 0.0704083;
MatrixA(22,33) = 0.0704083;
MatrixA(23,1) = 4.06628e-13;
MatrixA(23,2) = 6.73278e-13;
MatrixA(23,3) = 2.86782;
MatrixA(23,8) = 4.00274;
MatrixA(23,9) = -4.00274;
MatrixA(23,10) = -3.39512;
MatrixA(23,11) = 3.39512;
MatrixA(23,12) = -37.5548;
MatrixA(23,13) = -37.5553;
MatrixA(23,14) = 39.8032;
MatrixA(23,15) = 39.84;
MatrixA(23,16) = -29.1326;
MatrixA(23,17) = 29.1326;
MatrixA(23,18) = -21.7537;
MatrixA(23,19) = 21.7537;
MatrixA(23,20) = -1.50267e-12;
MatrixA(23,21) = -0.0159314;
MatrixA(23,22) = 4.93562e-14;
MatrixA(23,23) = -2.77168;
MatrixA(23,24) = -1.41239e-12;
MatrixA(23,25) = -0.14597;
MatrixA(23,26) = -0.180815;
MatrixA(23,27) = 0.180815;
MatrixA(23,28) = -0.189849;
MatrixA(23,29) = 0.189849;
MatrixA(23,30) = -0.237637;
MatrixA(23,31) = 0.237637;
MatrixA(23,32) = -0.32601;
MatrixA(23,33) = 0.32601;
MatrixA(24,1) = 2.03446;
MatrixA(24,2) = 2.99977;
MatrixA(24,3) = 0.0529463;
MatrixA(24,8) = -24.8197;
MatrixA(24,9) = -24.8197;
MatrixA(24,10) = 29.3163;
MatrixA(24,11) = 29.3163;
MatrixA(24,12) = -1.93416;
MatrixA(24,13) = 1.93417;
MatrixA(24,14) = 9.33548;
MatrixA(24,15) = -9.34193;
MatrixA(24,16) = -12.0631;
MatrixA(24,17) = -12.0631;
MatrixA(24,18) = -3.81943;
MatrixA(24,19) = -3.81943;
MatrixA(24,20) = 1.09277;
MatrixA(24,21) = -9.32002e-07;
MatrixA(24,22) = 0.00437786;
MatrixA(24,23) = 0.000241016;
MatrixA(24,24) = -0.600796;
MatrixA(24,25) = -8.167e-06;
MatrixA(24,26) = -8.35655;
MatrixA(24,27) = -8.35655;
MatrixA(24,28) = 9.10124;
MatrixA(24,29) = 9.10124;
MatrixA(24,30) = -0.0134455;
MatrixA(24,31) = -0.0134455;
MatrixA(24,32) = -0.0572391;
MatrixA(24,33) = -0.0572391;
MatrixA(25,1) = -2.39972e-13;
MatrixA(25,2) = -9.41336e-14;
MatrixA(25,3) = 38.3646;
MatrixA(25,8) = 88.823;
MatrixA(25,9) = -88.823;
MatrixA(25,10) = 77.2307;
MatrixA(25,11) = -77.2307;
MatrixA(25,12) = -60.3776;
MatrixA(25,13) = -60.3785;
MatrixA(25,14) = -45.2573;
MatrixA(25,15) = -45.2733;
MatrixA(25,16) = -1.59332;
MatrixA(25,17) = 1.59332;
MatrixA(25,18) = 9.59987;
MatrixA(25,19) = -9.59987;
MatrixA(25,20) = 1.1831e-12;
MatrixA(25,21) = -0.0163551;
MatrixA(25,22) = -2.68108e-13;
MatrixA(25,23) = 1.0915;
MatrixA(25,24) = 2.12681e-12;
MatrixA(25,25) = -0.0268698;
MatrixA(25,26) = 14.4441;
MatrixA(25,27) = -14.4441;
MatrixA(25,28) = 13.7489;
MatrixA(25,29) = -13.7489;
MatrixA(25,30) = -0.0122865;
MatrixA(25,31) = 0.0122865;
MatrixA(25,32) = 0.143862;
MatrixA(25,33) = -0.143862;
MatrixA(26,1) = -6292.3;
MatrixA(26,2) = 40.1342;
MatrixA(26,3) = -4499.71;
MatrixA(26,8) = -7069.81;
MatrixA(26,9) = 173.417;
MatrixA(26,10) = -38.2406;
MatrixA(26,11) = 69.5843;
MatrixA(26,12) = -1.88603;
MatrixA(26,13) = 44.0294;
MatrixA(26,14) = 35.3336;
MatrixA(26,15) = 29.4513;
MatrixA(26,16) = 6.30781;
MatrixA(26,17) = -12.6293;
MatrixA(26,18) = -16.8147;
MatrixA(26,19) = -1.72022;
MatrixA(26,20) = 1.14747;
MatrixA(26,21) = 0.0120992;
MatrixA(26,22) = 0.00459781;
MatrixA(26,23) = -0.211283;
MatrixA(26,24) = -0.637067;
MatrixA(26,25) = 0.160043;
MatrixA(26,26) = -184.655;
MatrixA(26,27) = -6.64063;
MatrixA(26,28) = -6.84009;
MatrixA(26,29) = 12.4869;
MatrixA(26,30) = 0.145196;
MatrixA(26,31) = -0.0090265;
MatrixA(26,32) = -0.251992;
MatrixA(26,33) = -0.0257868;
MatrixA(27,1) = -6292.3;
MatrixA(27,2) = 40.1342;
MatrixA(27,3) = 4499;
MatrixA(27,8) = 173.417;
MatrixA(27,9) = -7069.81;
MatrixA(27,10) = 69.5843;
MatrixA(27,11) = -38.2406;
MatrixA(27,12) = -44.0288;
MatrixA(27,13) = 1.88603;
MatrixA(27,14) = -29.4545;
MatrixA(27,15) = -35.3621;
MatrixA(27,16) = -12.6293;
MatrixA(27,17) = 6.30781;
MatrixA(27,18) = -1.72022;
MatrixA(27,19) = -16.8147;
MatrixA(27,20) = 1.14747;
MatrixA(27,21) = -0.0121018;
MatrixA(27,22) = 0.00459781;
MatrixA(27,23) = 0.211595;
MatrixA(27,24) = -0.637067;
MatrixA(27,25) = -0.16061;
MatrixA(27,26) = -6.64063;
MatrixA(27,27) = -184.655;
MatrixA(27,28) = 12.4869;
MatrixA(27,29) = -6.84009;
MatrixA(27,30) = -0.0090265;
MatrixA(27,31) = 0.145196;
MatrixA(27,32) = -0.0257868;
MatrixA(27,33) = -0.251992;
MatrixA(28,1) = -6162.67;
MatrixA(28,2) = -14473.2;
MatrixA(28,3) = -4264.04;
MatrixA(28,8) = -52.8951;
MatrixA(28,9) = 71.0796;
MatrixA(28,10) = -6898.78;
MatrixA(28,11) = 147.689;
MatrixA(28,12) = 45.0413;
MatrixA(28,13) = 43.8387;
MatrixA(28,14) = -135.576;
MatrixA(28,15) = 53.4606;
MatrixA(28,16) = 22.5812;
MatrixA(28,17) = 20.9482;
MatrixA(28,18) = -103.245;
MatrixA(28,19) = 11.2875;
MatrixA(28,20) = 3.59971;
MatrixA(28,21) = 0.0131747;
MatrixA(28,22) = 0.0144249;
MatrixA(28,23) = -4.12488;
MatrixA(28,24) = -1.96984;
MatrixA(28,25) = 0.00994321;
MatrixA(28,26) = -7.0241;
MatrixA(28,27) = 13.0038;
MatrixA(28,28) = -176.225;
MatrixA(28,29) = -8.94062;
MatrixA(28,30) = 0.0774425;
MatrixA(28,31) = 0.065179;
MatrixA(28,32) = -1.54735;
MatrixA(28,33) = 0.169152;
MatrixA(29,1) = -6162.67;
MatrixA(29,2) = -14473.2;
MatrixA(29,3) = 4262.69;
MatrixA(29,8) = 71.0796;
MatrixA(29,9) = -52.8951;
MatrixA(29,10) = 147.689;
MatrixA(29,11) = -6898.78;
MatrixA(29,12) = -43.838;
MatrixA(29,13) = -45.0419;
MatrixA(29,14) = -53.4417;
MatrixA(29,15) = 135.399;
MatrixA(29,16) = 20.9482;
MatrixA(29,17) = 22.5812;
MatrixA(29,18) = 11.2875;
MatrixA(29,19) = -103.245;
MatrixA(29,20) = 3.59971;
MatrixA(29,21) = -0.0131731;
MatrixA(29,22) = 0.0144249;
MatrixA(29,23) = 4.12604;
MatrixA(29,24) = -1.96984;
MatrixA(29,25) = -0.0103417;
MatrixA(29,26) = 13.0038;
MatrixA(29,27) = -7.0241;
MatrixA(29,28) = -8.94062;
MatrixA(29,29) = -176.225;
MatrixA(29,30) = 0.065179;
MatrixA(29,31) = 0.0774425;
MatrixA(29,32) = 0.169152;
MatrixA(29,33) = -1.54735;
MatrixA(30,1) = 696.633;
MatrixA(30,2) = -4.16621;
MatrixA(30,3) = 728.264;
MatrixA(30,8) = 843.145;
MatrixA(30,9) = -128.746;
MatrixA(30,10) = -31.2814;
MatrixA(30,11) = -25.9263;
MatrixA(30,12) = 19.1287;
MatrixA(30,13) = 2.95419;
MatrixA(30,14) = -7.91751;
MatrixA(30,15) = 10.4919;
MatrixA(30,16) = -11991.7;
MatrixA(30,17) = 1706.33;
MatrixA(30,18) = 3.2087;
MatrixA(30,19) = 3.58869;
MatrixA(30,20) = 295.923;
MatrixA(30,21) = -1.33932;
MatrixA(30,22) = 1.1854;
MatrixA(30,23) = -281.361;
MatrixA(30,24) = -161.865;
MatrixA(30,25) = 0.403056;
MatrixA(30,26) = 11.2947;
MatrixA(30,27) = 7.93962;
MatrixA(30,28) = -9.45591;
MatrixA(30,29) = -8.48955;
MatrixA(30,30) = -125.946;
MatrixA(30,31) = -13.9899;
MatrixA(30,32) = 0.0480866;
MatrixA(30,33) = 0.0537809;
MatrixA(31,1) = 696.633;
MatrixA(31,2) = -4.16621;
MatrixA(31,3) = -728.8;
MatrixA(31,8) = -128.746;
MatrixA(31,9) = 843.145;
MatrixA(31,10) = -25.9263;
MatrixA(31,11) = -31.2814;
MatrixA(31,12) = -2.95249;
MatrixA(31,13) = -19.1405;
MatrixA(31,14) = -10.4859;
MatrixA(31,15) = 7.92292;
MatrixA(31,16) = 1706.33;
MatrixA(31,17) = -11991.7;
MatrixA(31,18) = 3.58869;
MatrixA(31,19) = 3.2087;
MatrixA(31,20) = 295.923;
MatrixA(31,21) = 1.33933;
MatrixA(31,22) = 1.1854;
MatrixA(31,23) = 281.536;
MatrixA(31,24) = -161.865;
MatrixA(31,25) = -0.403065;
MatrixA(31,26) = 7.93962;
MatrixA(31,27) = 11.2947;
MatrixA(31,28) = -8.48955;
MatrixA(31,29) = -9.45591;
MatrixA(31,30) = -13.9899;
MatrixA(31,31) = -125.946;
MatrixA(31,32) = 0.0537809;
MatrixA(31,33) = 0.0480866;
MatrixA(32,1) = -46.8263;
MatrixA(32,2) = -128.506;
MatrixA(32,3) = -27.1716;
MatrixA(32,8) = 24.8199;
MatrixA(32,9) = 24.8197;
MatrixA(32,10) = -74.1933;
MatrixA(32,11) = -29.3171;
MatrixA(32,12) = 1.93954;
MatrixA(32,13) = -1.92879;
MatrixA(32,14) = -18.2493;
MatrixA(32,15) = 9.33543;
MatrixA(32,16) = 12.0677;
MatrixA(32,17) = 12.0586;
MatrixA(32,18) = -10686.8;
MatrixA(32,19) = 3.81597;
MatrixA(32,20) = 563.031;
MatrixA(32,21) = 0.00568417;
MatrixA(32,22) = 2.256;
MatrixA(32,23) = -387.684;
MatrixA(32,24) = -308.101;
MatrixA(32,25) = 1.55735;
MatrixA(32,26) = 8.35671;
MatrixA(32,27) = 8.35642;
MatrixA(32,28) = -74.6073;
MatrixA(32,29) = -9.10145;
MatrixA(32,30) = 0.0134828;
MatrixA(32,31) = 0.0134088;
MatrixA(32,32) = -160.161;
MatrixA(32,33) = 0.0571874;
MatrixA(33,1) = -46.8263;
MatrixA(33,2) = -128.506;
MatrixA(33,3) = 23.7359;
MatrixA(33,8) = 24.8197;
MatrixA(33,9) = 24.8199;
MatrixA(33,10) = -29.3171;
MatrixA(33,11) = -74.1933;
MatrixA(33,12) = 1.92878;
MatrixA(33,13) = -1.93955;
MatrixA(33,14) = -9.32899;
MatrixA(33,15) = -0.00966147;
MatrixA(33,16) = 12.0586;
MatrixA(33,17) = 12.0677;
MatrixA(33,18) = 3.81597;
MatrixA(33,19) = -10686.8;
MatrixA(33,20) = 563.031;
MatrixA(33,21) = -0.00568231;
MatrixA(33,22) = 2.256;
MatrixA(33,23) = 387.848;
MatrixA(33,24) = -308.101;
MatrixA(33,25) = -1.55733;
MatrixA(33,26) = 8.35642;
MatrixA(33,27) = 8.35671;
MatrixA(33,28) = -9.10145;
MatrixA(33,29) = -74.6073;
MatrixA(33,30) = 0.0134088;
MatrixA(33,31) = 0.0134828;
MatrixA(33,32) = 0.0571874;
MatrixA(33,33) = -160.161;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -0.906262;
MatrixB(13,1) = -0.906259;
MatrixB(16,1) = -0.0201117;
MatrixB(17,1) = 0.0203895;
MatrixB(20,1) = 3.32094e-05;
MatrixB(21,1) = 0.00468177;
MatrixB(22,1) = -6.22443e-07;
MatrixB(23,1) = 0.000391989;
MatrixB(24,1) = -8.72015e-06;
MatrixB(25,1) = -0.000475279;
MatrixB(26,1) = 1.09741;
MatrixB(27,1) = -1.09714;
MatrixB(28,1) = 4.66423e-06;
MatrixB(29,1) = 2.62602e-05;
MatrixB(30,1) = 0.504495;
MatrixB(31,1) = -0.511826;
MatrixB(32,1) = 8.65391e-06;
MatrixB(33,1) = 8.7865e-06;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -2.63265e-13;
MatrixC(2,2) = -2.65092e-13;
MatrixC(2,3) = 15.3846;
MatrixC(2,8) = 13.0866;
MatrixC(2,9) = -13.0866;
MatrixC(2,10) = -0.276067;
MatrixC(2,11) = 0.276067;
MatrixC(2,12) = -39.5255;
MatrixC(2,13) = -39.526;
MatrixC(2,14) = -36.1467;
MatrixC(2,15) = -36.1464;
MatrixC(2,16) = -0.214867;
MatrixC(2,17) = 0.214867;
MatrixC(2,18) = 0.000318435;
MatrixC(2,19) = -0.000318435;
MatrixC(2,20) = -7.59682e-15;
MatrixC(2,21) = -0.0261507;
MatrixC(2,22) = 3.56958e-14;
MatrixC(2,23) = -0.00607787;
MatrixC(2,24) = 4.33243e-14;
MatrixC(2,25) = -0.00111893;
MatrixC(2,26) = 0.000156009;
MatrixC(2,27) = -0.000156009;
MatrixC(2,28) = -8.1833e-05;
MatrixC(2,29) = 8.1833e-05;
MatrixC(2,30) = -0.00127658;
MatrixC(2,31) = 0.00127658;
MatrixC(2,32) = -2.83448e-06;
MatrixC(2,33) = 2.83448e-06;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.00239986;
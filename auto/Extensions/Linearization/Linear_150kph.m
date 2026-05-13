% MATLAB linearized CarSim 2024.1 model, calculated at t = 240.02 s.
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

MatrixA(1,2) = -41.6667;
MatrixA(1,3) = 5.85054e-05;
MatrixA(1,20) = 0.00280827;
MatrixA(1,22) = 0.999996;
MatrixA(1,24) = -1.10151;
MatrixA(2,3) = -3.05351e-13;
MatrixA(2,23) = -2.55347e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 9.77816e-16;
MatrixA(3,3) = -1.70953e-12;
MatrixA(3,23) = -0.00280828;
MatrixA(3,24) = -7.17086e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 9.13748e-09;
MatrixA(12,2) = 0.444207;
MatrixA(12,3) = 0.000905395;
MatrixA(12,8) = 12.8603;
MatrixA(12,12) = -76.7742;
MatrixA(12,20) = 5.83751e-13;
MatrixA(12,21) = 1.82886;
MatrixA(12,22) = 5.07609e-14;
MatrixA(12,23) = 2.00998;
MatrixA(12,24) = -3.04566e-13;
MatrixA(12,25) = 1.01577;
MatrixA(12,26) = 0.121896;
MatrixA(13,1) = -9.1387e-09;
MatrixA(13,2) = -0.444207;
MatrixA(13,3) = 0.000679425;
MatrixA(13,9) = -12.8603;
MatrixA(13,13) = -75.8714;
MatrixA(13,20) = -5.5837e-13;
MatrixA(13,21) = 1.82886;
MatrixA(13,23) = 2.00998;
MatrixA(13,24) = 2.79185e-13;
MatrixA(13,25) = 1.01577;
MatrixA(13,27) = -0.121896;
MatrixA(14,1) = 1.6745e-09;
MatrixA(14,2) = 0.126396;
MatrixA(14,3) = -1.46691e-05;
MatrixA(14,10) = -2.07999;
MatrixA(14,14) = -75.0799;
MatrixA(14,20) = 6.0945e-12;
MatrixA(14,21) = 1.79936;
MatrixA(14,22) = -1.71676e-14;
MatrixA(14,23) = -2.25145;
MatrixA(14,24) = -3.36641e-12;
MatrixA(14,25) = 0.987506;
MatrixA(14,28) = 0.296169;
MatrixA(15,1) = -1.67374e-09;
MatrixA(15,2) = -0.126396;
MatrixA(15,3) = -5.86775e-06;
MatrixA(15,11) = 2.07999;
MatrixA(15,15) = -75.1313;
MatrixA(15,20) = -6.08982e-12;
MatrixA(15,21) = 1.79936;
MatrixA(15,22) = 1.87283e-14;
MatrixA(15,23) = -2.25145;
MatrixA(15,24) = 3.36641e-12;
MatrixA(15,25) = 0.987506;
MatrixA(15,29) = -0.296169;
MatrixA(20,1) = -111.238;
MatrixA(20,2) = -128.454;
MatrixA(20,3) = -0.13454;
MatrixA(20,8) = -28.6844;
MatrixA(20,9) = -28.6844;
MatrixA(20,10) = -28.9115;
MatrixA(20,11) = -28.9115;
MatrixA(20,12) = -0.417717;
MatrixA(20,13) = 0.322919;
MatrixA(20,14) = -0.426453;
MatrixA(20,15) = 0.511172;
MatrixA(20,20) = -5.59146;
MatrixA(20,21) = -8.26526e-07;
MatrixA(20,22) = 0.0157028;
MatrixA(20,23) = 5.45057e-05;
MatrixA(20,24) = 3.19129;
MatrixA(20,25) = -1.82595e-06;
MatrixA(20,26) = -0.253727;
MatrixA(20,27) = -0.253727;
MatrixA(20,28) = -0.310722;
MatrixA(20,29) = -0.310722;
MatrixA(20,30) = 0.395129;
MatrixA(20,31) = 0.395129;
MatrixA(20,32) = 0.394851;
MatrixA(20,33) = 0.394851;
MatrixA(21,1) = -3.14668e-12;
MatrixA(21,2) = -3.61407e-12;
MatrixA(21,3) = 27.9588;
MatrixA(21,8) = 2.41105;
MatrixA(21,9) = -2.41105;
MatrixA(21,10) = 15.4341;
MatrixA(21,11) = -15.4341;
MatrixA(21,12) = -34.9798;
MatrixA(21,13) = -35.0369;
MatrixA(21,14) = -34.2043;
MatrixA(21,15) = -34.1994;
MatrixA(21,20) = 1.61188e-13;
MatrixA(21,21) = -0.096107;
MatrixA(21,22) = 3.85614e-14;
MatrixA(21,23) = -41.7787;
MatrixA(21,24) = 1.56619e-13;
MatrixA(21,25) = -0.123173;
MatrixA(21,26) = -0.604061;
MatrixA(21,27) = 0.604061;
MatrixA(21,28) = -0.136079;
MatrixA(21,29) = 0.136079;
MatrixA(21,30) = -0.00400303;
MatrixA(21,31) = 0.00400303;
MatrixA(21,32) = -0.0039994;
MatrixA(21,33) = 0.0039994;
MatrixA(22,1) = -10.376;
MatrixA(22,2) = -25.2527;
MatrixA(22,3) = 0.0676822;
MatrixA(22,8) = 22.7771;
MatrixA(22,9) = 22.7771;
MatrixA(22,10) = 18.565;
MatrixA(22,11) = 18.565;
MatrixA(22,12) = 3.10407;
MatrixA(22,13) = -3.10583;
MatrixA(22,14) = 7.10396;
MatrixA(22,15) = -7.09227;
MatrixA(22,20) = -0.250008;
MatrixA(22,21) = 2.46175e-07;
MatrixA(22,22) = 0.000702113;
MatrixA(22,23) = -1.66296e-05;
MatrixA(22,24) = 41.8154;
MatrixA(22,25) = -4.81068e-06;
MatrixA(22,26) = 7.63017;
MatrixA(22,27) = 7.63017;
MatrixA(22,28) = 7.21818;
MatrixA(22,29) = 7.21818;
MatrixA(22,30) = -0.0120889;
MatrixA(22,31) = -0.0120889;
MatrixA(22,32) = 0.0504456;
MatrixA(22,33) = 0.0504456;
MatrixA(23,1) = -4.74358e-13;
MatrixA(23,2) = 2.9864e-12;
MatrixA(23,3) = 29.3339;
MatrixA(23,8) = 21.9851;
MatrixA(23,9) = -21.9851;
MatrixA(23,10) = -1.24995;
MatrixA(23,11) = 1.24995;
MatrixA(23,12) = -34.7099;
MatrixA(23,13) = -34.8268;
MatrixA(23,14) = 40.8279;
MatrixA(23,15) = 40.875;
MatrixA(23,20) = 6.20766e-12;
MatrixA(23,21) = -0.0414089;
MatrixA(23,22) = -1.03201e-13;
MatrixA(23,23) = -2.40784;
MatrixA(23,24) = 6.10691e-12;
MatrixA(23,25) = -0.585449;
MatrixA(23,26) = -0.0988758;
MatrixA(23,27) = 0.0988758;
MatrixA(23,28) = -0.160373;
MatrixA(23,29) = 0.160373;
MatrixA(23,30) = -0.246545;
MatrixA(23,31) = 0.246545;
MatrixA(23,32) = -0.24152;
MatrixA(23,33) = 0.24152;
MatrixA(24,1) = 18.0672;
MatrixA(24,2) = 5.4512;
MatrixA(24,3) = 0.077776;
MatrixA(24,8) = -16.3084;
MatrixA(24,9) = -16.3084;
MatrixA(24,10) = 31.2339;
MatrixA(24,11) = 31.2339;
MatrixA(24,12) = -3.29271;
MatrixA(24,13) = 3.32302;
MatrixA(24,14) = 9.00137;
MatrixA(24,15) = -9.00955;
MatrixA(24,20) = 1.02333;
MatrixA(24,21) = -9.37276e-07;
MatrixA(24,22) = -0.00287387;
MatrixA(24,23) = -3.13965e-05;
MatrixA(24,24) = -0.575971;
MatrixA(24,25) = -5.9978e-06;
MatrixA(24,26) = -8.36444;
MatrixA(24,27) = -8.36444;
MatrixA(24,28) = 9.1163;
MatrixA(24,29) = 9.1163;
MatrixA(24,30) = -0.0453658;
MatrixA(24,31) = -0.0453658;
MatrixA(24,32) = -0.0431342;
MatrixA(24,33) = -0.0431342;
MatrixA(25,1) = -6.97294e-12;
MatrixA(25,2) = -6.88381e-12;
MatrixA(25,3) = 31.8901;
MatrixA(25,8) = 84.941;
MatrixA(25,9) = -84.941;
MatrixA(25,10) = 78.1263;
MatrixA(25,11) = -78.1263;
MatrixA(25,12) = -54.8965;
MatrixA(25,13) = -54.9897;
MatrixA(25,14) = -46.7472;
MatrixA(25,15) = -46.7637;
MatrixA(25,20) = -2.19575e-12;
MatrixA(25,21) = -0.0606092;
MatrixA(25,22) = -2.13769e-12;
MatrixA(25,23) = 2.0941;
MatrixA(25,24) = -2.53025e-12;
MatrixA(25,25) = -0.122779;
MatrixA(25,26) = 14.4879;
MatrixA(25,27) = -14.4879;
MatrixA(25,28) = 13.7458;
MatrixA(25,29) = -13.7458;
MatrixA(25,30) = -0.0187088;
MatrixA(25,31) = 0.0187088;
MatrixA(25,32) = 0.102495;
MatrixA(25,33) = -0.102495;
MatrixA(26,1) = -6287.17;
MatrixA(26,2) = 34.9304;
MatrixA(26,3) = -4500.64;
MatrixA(26,8) = -7055.16;
MatrixA(26,9) = 180.513;
MatrixA(26,10) = -38.9803;
MatrixA(26,11) = 71.6517;
MatrixA(26,12) = -32.5792;
MatrixA(26,13) = 45.0228;
MatrixA(26,14) = 36.5095;
MatrixA(26,15) = 30.8288;
MatrixA(26,20) = 0.952928;
MatrixA(26,21) = 0.0428323;
MatrixA(26,22) = -0.00267616;
MatrixA(26,23) = -0.0131979;
MatrixA(26,24) = -0.557011;
MatrixA(26,25) = 0.806251;
MatrixA(26,26) = -184.772;
MatrixA(26,27) = -6.56377;
MatrixA(26,28) = -6.89469;
MatrixA(26,29) = 12.5876;
MatrixA(26,30) = 0.109412;
MatrixA(26,31) = -0.0531948;
MatrixA(26,32) = -0.180573;
MatrixA(26,33) = -0.0273723;
MatrixA(27,1) = -6287.17;
MatrixA(27,2) = 34.9304;
MatrixA(27,3) = 4499.95;
MatrixA(27,8) = 180.513;
MatrixA(27,9) = -7055.16;
MatrixA(27,10) = 71.6517;
MatrixA(27,11) = -38.9803;
MatrixA(27,12) = -44.9223;
MatrixA(27,13) = 32.6137;
MatrixA(27,14) = -30.8384;
MatrixA(27,15) = -36.5439;
MatrixA(27,20) = 0.952928;
MatrixA(27,21) = -0.0428349;
MatrixA(27,22) = -0.00267616;
MatrixA(27,23) = 0.013202;
MatrixA(27,24) = -0.557011;
MatrixA(27,25) = -0.806804;
MatrixA(27,26) = -6.56377;
MatrixA(27,27) = -184.772;
MatrixA(27,28) = 12.5876;
MatrixA(27,29) = -6.89469;
MatrixA(27,30) = -0.0531948;
MatrixA(27,31) = 0.109412;
MatrixA(27,32) = -0.0273723;
MatrixA(27,33) = -0.180573;
MatrixA(28,1) = -6203.41;
MatrixA(28,2) = -14519.2;
MatrixA(28,3) = -4270.71;
MatrixA(28,8) = -64.2865;
MatrixA(28,9) = 54.0918;
MatrixA(28,10) = -6933.35;
MatrixA(28,11) = 144.314;
MatrixA(28,12) = 41.4301;
MatrixA(28,13) = 39.3591;
MatrixA(28,14) = -129.106;
MatrixA(28,15) = 53.4898;
MatrixA(28,20) = 2.347;
MatrixA(28,21) = 0.0488548;
MatrixA(28,22) = -0.0065912;
MatrixA(28,23) = -3.08971;
MatrixA(28,24) = -1.29675;
MatrixA(28,25) = -0.00836228;
MatrixA(28,26) = -7.05288;
MatrixA(28,27) = 13.0503;
MatrixA(28,28) = -176.437;
MatrixA(28,29) = -9.0057;
MatrixA(28,30) = 0.125366;
MatrixA(28,31) = 0.101931;
MatrixA(28,32) = -1.16573;
MatrixA(28,33) = 0.12215;
MatrixA(29,1) = -6203.41;
MatrixA(29,2) = -14519.2;
MatrixA(29,3) = 4269.35;
MatrixA(29,8) = 54.0918;
MatrixA(29,9) = -64.2865;
MatrixA(29,10) = 144.314;
MatrixA(29,11) = -6933.35;
MatrixA(29,12) = -39.3382;
MatrixA(29,13) = -41.5452;
MatrixA(29,14) = -53.47;
MatrixA(29,15) = 128.84;
MatrixA(29,20) = 2.347;
MatrixA(29,21) = -0.0488531;
MatrixA(29,22) = -0.0065912;
MatrixA(29,23) = 3.09012;
MatrixA(29,24) = -1.29675;
MatrixA(29,25) = 0.00795746;
MatrixA(29,26) = 13.0503;
MatrixA(29,27) = -7.05288;
MatrixA(29,28) = -9.0057;
MatrixA(29,29) = -176.437;
MatrixA(29,30) = 0.101931;
MatrixA(29,31) = 0.125366;
MatrixA(29,32) = 0.12215;
MatrixA(29,33) = -1.16573;
MatrixA(30,1) = 7159.25;
MatrixA(30,2) = -5.1111;
MatrixA(30,3) = 6676.78;
MatrixA(30,8) = 8347.46;
MatrixA(30,9) = -1159;
MatrixA(30,10) = -32.754;
MatrixA(30,11) = -28.5489;
MatrixA(30,12) = 76.27;
MatrixA(30,13) = 5.35428;
MatrixA(30,14) = -7.85508;
MatrixA(30,15) = 9.9529;
MatrixA(30,20) = 310.073;
MatrixA(30,21) = -0.723155;
MatrixA(30,22) = -0.870795;
MatrixA(30,23) = -291.873;
MatrixA(30,24) = -171.258;
MatrixA(30,25) = -1.18778;
MatrixA(30,26) = 11.483;
MatrixA(30,27) = 7.60672;
MatrixA(30,28) = -9.38532;
MatrixA(30,29) = -8.64415;
MatrixA(30,30) = -121.362;
MatrixA(30,31) = -5.41287;
MatrixA(30,32) = 0.0379248;
MatrixA(30,33) = 0.0409343;
MatrixA(31,1) = 7159.25;
MatrixA(31,2) = -5.1111;
MatrixA(31,3) = -6647.77;
MatrixA(31,8) = -1159;
MatrixA(31,9) = 8347.46;
MatrixA(31,10) = -28.5489;
MatrixA(31,11) = -32.754;
MatrixA(31,12) = -8.76965;
MatrixA(31,13) = -51.6716;
MatrixA(31,14) = -9.94531;
MatrixA(31,15) = 7.86227;
MatrixA(31,20) = 310.073;
MatrixA(31,21) = 0.723156;
MatrixA(31,22) = -0.870795;
MatrixA(31,23) = 291.866;
MatrixA(31,24) = -171.258;
MatrixA(31,25) = 1.18777;
MatrixA(31,26) = 7.60672;
MatrixA(31,27) = 11.483;
MatrixA(31,28) = -8.64415;
MatrixA(31,29) = -9.38532;
MatrixA(31,30) = -5.41287;
MatrixA(31,31) = -121.362;
MatrixA(31,32) = 0.0409343;
MatrixA(31,33) = 0.0379248;
MatrixA(32,1) = -46.1169;
MatrixA(32,2) = -111.139;
MatrixA(32,3) = -14.0718;
MatrixA(32,8) = 16.2848;
MatrixA(32,9) = 16.3317;
MatrixA(32,10) = -59.3657;
MatrixA(32,11) = -31.2383;
MatrixA(32,12) = 3.33551;
MatrixA(32,13) = -3.28012;
MatrixA(32,14) = -19.3566;
MatrixA(32,15) = 8.95187;
MatrixA(32,20) = 417.004;
MatrixA(32,21) = 0.0411447;
MatrixA(32,22) = -1.17109;
MatrixA(32,23) = -287.731;
MatrixA(32,24) = -230.319;
MatrixA(32,25) = -0.784548;
MatrixA(32,26) = 8.36571;
MatrixA(32,27) = 8.36335;
MatrixA(32,28) = -58.5835;
MatrixA(32,29) = -9.1181;
MatrixA(32,30) = 0.0456995;
MatrixA(32,31) = 0.0450392;
MatrixA(32,32) = -118.739;
MatrixA(32,33) = 0.0428036;
MatrixA(33,1) = -46.1169;
MatrixA(33,2) = -111.139;
MatrixA(33,3) = 13.9304;
MatrixA(33,8) = 16.3317;
MatrixA(33,9) = 16.2848;
MatrixA(33,10) = -31.2383;
MatrixA(33,11) = -59.3657;
MatrixA(33,12) = 3.24996;
MatrixA(33,13) = -3.36597;
MatrixA(33,14) = -8.94375;
MatrixA(33,15) = -6.13792;
MatrixA(33,20) = 417.004;
MatrixA(33,21) = -0.0411429;
MatrixA(33,22) = -1.17109;
MatrixA(33,23) = 287.721;
MatrixA(33,24) = -230.319;
MatrixA(33,25) = 0.784559;
MatrixA(33,26) = 8.36335;
MatrixA(33,27) = 8.36571;
MatrixA(33,28) = -9.1181;
MatrixA(33,29) = -58.5835;
MatrixA(33,30) = 0.0450392;
MatrixA(33,31) = 0.0456995;
MatrixA(33,32) = 0.0428036;
MatrixA(33,33) = -118.739;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -3.57394;
MatrixB(13,1) = -3.57395;
MatrixB(20,1) = 0.000127843;
MatrixB(21,1) = 0.0285782;
MatrixB(22,1) = -3.72195e-06;
MatrixB(23,1) = 0.0252598;
MatrixB(24,1) = -3.38327e-05;
MatrixB(25,1) = 0.0426197;
MatrixB(26,1) = 1.20336;
MatrixB(27,1) = -1.20311;
MatrixB(28,1) = -0.0313992;
MatrixB(29,1) = 0.0315205;
MatrixB(30,1) = -0.456878;
MatrixB(31,1) = 0.428227;
MatrixB(32,1) = 2.89183e-06;
MatrixB(33,1) = 6.47775e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -3.4738e-12;
MatrixC(2,2) = -3.98516e-12;
MatrixC(2,3) = 6.16749;
MatrixC(2,8) = 7.05783;
MatrixC(2,9) = -7.05783;
MatrixC(2,10) = -0.504466;
MatrixC(2,11) = 0.504466;
MatrixC(2,12) = -36.7168;
MatrixC(2,13) = -36.7761;
MatrixC(2,14) = -36.9977;
MatrixC(2,15) = -36.9932;
MatrixC(2,20) = -6.06624e-15;
MatrixC(2,21) = -0.0979711;
MatrixC(2,22) = -5.54905e-14;
MatrixC(2,23) = -0.00706364;
MatrixC(2,24) = 5.80174e-15;
MatrixC(2,25) = -0.00432685;
MatrixC(2,26) = 0.000125735;
MatrixC(2,27) = -0.000125735;
MatrixC(2,28) = -0.000288212;
MatrixC(2,29) = 0.000288212;
MatrixC(2,30) = -0.00162784;
MatrixC(2,31) = 0.00162784;
MatrixC(2,32) = -2.47203e-05;
MatrixC(2,33) = 2.47203e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0296163;
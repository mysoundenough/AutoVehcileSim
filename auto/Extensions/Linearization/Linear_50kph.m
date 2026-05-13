% MATLAB linearized CarSim 2024.1 model, calculated at t = 90.0065 s.
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

MatrixA(1,2) = -13.8889;
MatrixA(1,3) = -2.59399e-05;
MatrixA(1,20) = -0.00373538;
MatrixA(1,22) = 0.999993;
MatrixA(1,24) = -1.09798;
MatrixA(2,3) = -2.14911e-12;
MatrixA(2,23) = 8.36759e-17;
MatrixA(2,24) = 1;
MatrixA(3,2) = 2.15619e-16;
MatrixA(3,3) = 1.60539e-11;
MatrixA(3,23) = 0.00373541;
MatrixA(3,24) = -3.12565e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 4.87006e-08;
MatrixA(12,2) = 0.202713;
MatrixA(12,3) = 0.000758353;
MatrixA(12,8) = 3.12851;
MatrixA(12,12) = -24.4828;
MatrixA(12,20) = 2.10678e-11;
MatrixA(12,21) = 1.74194;
MatrixA(12,22) = 6.04354e-14;
MatrixA(12,23) = 1.91796;
MatrixA(12,24) = -1.15553e-11;
MatrixA(12,25) = 0.946878;
MatrixA(12,26) = 0.0644691;
MatrixA(13,1) = -4.87002e-08;
MatrixA(13,2) = -0.202713;
MatrixA(13,3) = 0.000605645;
MatrixA(13,9) = -3.12851;
MatrixA(13,13) = -23.9729;
MatrixA(13,20) = -2.10678e-11;
MatrixA(13,21) = 1.74194;
MatrixA(13,22) = -9.66967e-14;
MatrixA(13,23) = 1.91796;
MatrixA(13,24) = 1.15432e-11;
MatrixA(13,25) = 0.946878;
MatrixA(13,27) = -0.0644691;
MatrixA(14,1) = 1.54339e-08;
MatrixA(14,2) = 0.00643945;
MatrixA(14,3) = -1.75712e-07;
MatrixA(14,10) = -0.636436;
MatrixA(14,14) = -25.4824;
MatrixA(14,20) = 1.35884e-10;
MatrixA(14,21) = 1.83158;
MatrixA(14,22) = 5.0777e-13;
MatrixA(14,23) = -2.28766;
MatrixA(14,24) = -7.44221e-11;
MatrixA(14,25) = 1.01168;
MatrixA(14,28) = 0.319321;
MatrixA(15,1) = -1.54341e-08;
MatrixA(15,2) = -0.00643945;
MatrixA(15,3) = 1.3801e-07;
MatrixA(15,11) = 0.636436;
MatrixA(15,15) = -25.4847;
MatrixA(15,20) = -1.35884e-10;
MatrixA(15,21) = 1.83158;
MatrixA(15,22) = -5.07472e-13;
MatrixA(15,23) = -2.28766;
MatrixA(15,24) = 7.44224e-11;
MatrixA(15,25) = 1.01168;
MatrixA(15,29) = -0.319321;
MatrixA(16,1) = 8.34342e-08;
MatrixA(16,2) = 0.0355627;
MatrixA(16,3) = 5.39788e-06;
MatrixA(16,8) = 0.0196379;
MatrixA(16,16) = -64.6879;
MatrixA(16,20) = -4.84609;
MatrixA(16,21) = 0.016188;
MatrixA(16,22) = -0.0181079;
MatrixA(16,23) = 3.45996;
MatrixA(16,24) = 2.65548;
MatrixA(16,25) = -0.00405543;
MatrixA(16,26) = -0.140872;
MatrixA(16,30) = 1.37575;
MatrixA(17,1) = 8.34298e-08;
MatrixA(17,2) = 0.0355627;
MatrixA(17,3) = -7.16268e-06;
MatrixA(17,9) = 0.0196379;
MatrixA(17,17) = -64.6879;
MatrixA(17,20) = -4.84609;
MatrixA(17,21) = -0.0161879;
MatrixA(17,22) = -0.0181079;
MatrixA(17,23) = -3.45837;
MatrixA(17,24) = 2.65548;
MatrixA(17,25) = 0.00405544;
MatrixA(17,27) = -0.140872;
MatrixA(17,31) = 1.37575;
MatrixA(18,1) = 8.42789e-09;
MatrixA(18,2) = 0.00323962;
MatrixA(18,3) = 7.05773e-09;
MatrixA(18,10) = 1.79539e-05;
MatrixA(18,18) = -50.5739;
MatrixA(18,20) = -3.677;
MatrixA(18,21) = -4.78239e-05;
MatrixA(18,22) = -0.0137403;
MatrixA(18,23) = 2.52998;
MatrixA(18,24) = 2.01503;
MatrixA(18,25) = -0.00947423;
MatrixA(18,28) = 0.427673;
MatrixA(18,32) = 1.04493;
MatrixA(19,1) = 8.42744e-09;
MatrixA(19,2) = 0.00323962;
MatrixA(19,3) = -1.25912e-08;
MatrixA(19,11) = 1.79539e-05;
MatrixA(19,19) = -50.5739;
MatrixA(19,20) = -3.677;
MatrixA(19,21) = 4.78239e-05;
MatrixA(19,22) = -0.0137403;
MatrixA(19,23) = -2.52866;
MatrixA(19,24) = 2.01503;
MatrixA(19,25) = 0.00947424;
MatrixA(19,29) = 0.427673;
MatrixA(19,33) = 1.04493;
MatrixA(20,1) = -56.4731;
MatrixA(20,2) = -128.673;
MatrixA(20,3) = 0.00771327;
MatrixA(20,8) = -1.40795;
MatrixA(20,9) = -1.40795;
MatrixA(20,10) = -28.9634;
MatrixA(20,11) = -28.9634;
MatrixA(20,12) = -0.237076;
MatrixA(20,13) = 0.237868;
MatrixA(20,14) = -0.491915;
MatrixA(20,15) = 0.554918;
MatrixA(20,16) = 24.1369;
MatrixA(20,17) = 24.1369;
MatrixA(20,18) = 17.1912;
MatrixA(20,19) = 17.1912;
MatrixA(20,20) = -11.0091;
MatrixA(20,21) = -8.32163e-07;
MatrixA(20,22) = -0.0411204;
MatrixA(20,23) = -0.000446351;
MatrixA(20,24) = 5.97227;
MatrixA(20,25) = -2.05837e-06;
MatrixA(20,26) = -0.326224;
MatrixA(20,27) = -0.326224;
MatrixA(20,28) = -0.18333;
MatrixA(20,29) = -0.18333;
MatrixA(20,30) = 0.760278;
MatrixA(20,31) = 0.760278;
MatrixA(20,32) = 0.80326;
MatrixA(20,33) = 0.80326;
MatrixA(21,1) = -2.83617e-13;
MatrixA(21,2) = -4.76506e-13;
MatrixA(21,3) = 30.7524;
MatrixA(21,8) = 1.72513;
MatrixA(21,9) = -1.72513;
MatrixA(21,10) = 17.3684;
MatrixA(21,11) = -17.3684;
MatrixA(21,12) = -37.4959;
MatrixA(21,13) = -37.4971;
MatrixA(21,14) = -33.4017;
MatrixA(21,15) = -33.4007;
MatrixA(21,16) = -0.261619;
MatrixA(21,17) = 0.261619;
MatrixA(21,18) = -0.171213;
MatrixA(21,19) = 0.171213;
MatrixA(21,20) = -7.48412e-14;
MatrixA(21,21) = -0.0322027;
MatrixA(21,22) = 9.15956e-14;
MatrixA(21,23) = -13.9908;
MatrixA(21,24) = 3.32143e-14;
MatrixA(21,25) = 0.0499775;
MatrixA(21,26) = -0.74086;
MatrixA(21,27) = 0.74086;
MatrixA(21,28) = -0.102508;
MatrixA(21,29) = 0.102508;
MatrixA(21,30) = -0.00777466;
MatrixA(21,31) = 0.00777466;
MatrixA(21,32) = -0.00800407;
MatrixA(21,33) = 0.00800407;
MatrixA(22,1) = -13.2145;
MatrixA(22,2) = -27.5287;
MatrixA(22,3) = 0.0607545;
MatrixA(22,8) = 22.7217;
MatrixA(22,9) = 22.7217;
MatrixA(22,10) = 16.8653;
MatrixA(22,11) = 16.8653;
MatrixA(22,12) = 1.89334;
MatrixA(22,13) = -1.89342;
MatrixA(22,14) = 7.34725;
MatrixA(22,15) = -7.33885;
MatrixA(22,16) = -0.617032;
MatrixA(22,17) = -0.617032;
MatrixA(22,18) = 2.2703;
MatrixA(22,19) = 2.2703;
MatrixA(22,20) = -0.60361;
MatrixA(22,21) = 2.47131e-07;
MatrixA(22,22) = -0.00225467;
MatrixA(22,23) = -2.52473e-05;
MatrixA(22,24) = 14.223;
MatrixA(22,25) = -3.83516e-06;
MatrixA(22,26) = 7.62894;
MatrixA(22,27) = 7.62894;
MatrixA(22,28) = 7.22593;
MatrixA(22,29) = 7.22593;
MatrixA(22,30) = -0.0193987;
MatrixA(22,31) = -0.0193987;
MatrixA(22,32) = 0.106081;
MatrixA(22,33) = 0.106081;
MatrixA(23,1) = 9.84658e-13;
MatrixA(23,2) = -8.2466e-12;
MatrixA(23,3) = 3.94106;
MatrixA(23,8) = 4.73033;
MatrixA(23,9) = -4.73033;
MatrixA(23,10) = -3.33563;
MatrixA(23,11) = 3.33563;
MatrixA(23,12) = -37.4126;
MatrixA(23,13) = -37.4133;
MatrixA(23,14) = 39.8471;
MatrixA(23,15) = 39.8852;
MatrixA(23,16) = -15.1272;
MatrixA(23,17) = 15.1272;
MatrixA(23,18) = -10.5249;
MatrixA(23,19) = 10.5249;
MatrixA(23,20) = -2.97005e-12;
MatrixA(23,21) = -0.023959;
MatrixA(23,22) = 6.54379e-14;
MatrixA(23,23) = -4.76637;
MatrixA(23,24) = 5.62966e-14;
MatrixA(23,25) = -0.179986;
MatrixA(23,26) = -0.154357;
MatrixA(23,27) = 0.154357;
MatrixA(23,28) = -0.259684;
MatrixA(23,29) = 0.259684;
MatrixA(23,30) = -0.474766;
MatrixA(23,31) = 0.474766;
MatrixA(23,32) = -0.491771;
MatrixA(23,33) = 0.491771;
MatrixA(24,1) = 2.65876;
MatrixA(24,2) = 3.06775;
MatrixA(24,3) = 0.0524434;
MatrixA(24,8) = -24.7172;
MatrixA(24,9) = -24.7172;
MatrixA(24,10) = 29.2157;
MatrixA(24,11) = 29.2157;
MatrixA(24,12) = -1.99197;
MatrixA(24,13) = 1.99182;
MatrixA(24,14) = 9.32512;
MatrixA(24,15) = -9.3318;
MatrixA(24,16) = -6.26926;
MatrixA(24,17) = -6.26926;
MatrixA(24,18) = -1.84903;
MatrixA(24,19) = -1.84903;
MatrixA(24,20) = 1.98962;
MatrixA(24,21) = -9.35344e-07;
MatrixA(24,22) = 0.00743146;
MatrixA(24,23) = 5.67525e-05;
MatrixA(24,24) = -1.09326;
MatrixA(24,25) = -8.08269e-06;
MatrixA(24,26) = -8.34624;
MatrixA(24,27) = -8.34624;
MatrixA(24,28) = 9.08966;
MatrixA(24,29) = 9.08966;
MatrixA(24,30) = -0.129667;
MatrixA(24,31) = -0.129667;
MatrixA(24,32) = -0.0863952;
MatrixA(24,33) = -0.0863952;
MatrixA(25,1) = -1.90761e-12;
MatrixA(25,2) = -3.17616e-12;
MatrixA(25,3) = 38.1528;
MatrixA(25,8) = 89.0849;
MatrixA(25,9) = -89.0849;
MatrixA(25,10) = 77.0222;
MatrixA(25,11) = -77.0222;
MatrixA(25,12) = -60.1123;
MatrixA(25,13) = -60.1142;
MatrixA(25,14) = -45.3189;
MatrixA(25,15) = -45.3354;
MatrixA(25,16) = -0.842147;
MatrixA(25,17) = 0.842147;
MatrixA(25,18) = 4.63803;
MatrixA(25,19) = -4.63803;
MatrixA(25,20) = -1.00219e-13;
MatrixA(25,21) = -0.0206902;
MatrixA(25,22) = -1.08262e-12;
MatrixA(25,23) = 1.48811;
MatrixA(25,24) = -8.12403e-13;
MatrixA(25,25) = -0.0341838;
MatrixA(25,26) = 14.4456;
MatrixA(25,27) = -14.4456;
MatrixA(25,28) = 13.7797;
MatrixA(25,29) = -13.7797;
MatrixA(25,30) = -0.0257407;
MatrixA(25,31) = 0.0257407;
MatrixA(25,32) = 0.216707;
MatrixA(25,33) = -0.216707;
MatrixA(26,1) = -6292.08;
MatrixA(26,2) = 39.9;
MatrixA(26,3) = -4499.78;
MatrixA(26,8) = -7074.35;
MatrixA(26,9) = 173.512;
MatrixA(26,10) = -38.1626;
MatrixA(26,11) = 69.4349;
MatrixA(26,12) = -3.22855;
MatrixA(26,13) = 44.0502;
MatrixA(26,14) = 35.3834;
MatrixA(26,15) = 29.5073;
MatrixA(26,16) = 3.25508;
MatrixA(26,17) = -6.58706;
MatrixA(26,18) = -8.12533;
MatrixA(26,19) = -0.846635;
MatrixA(26,20) = 1.82894;
MatrixA(26,21) = 0.0164994;
MatrixA(26,22) = 0.00683218;
MatrixA(26,23) = -0.110465;
MatrixA(26,24) = -1.01308;
MatrixA(26,25) = 0.201653;
MatrixA(26,26) = -184.666;
MatrixA(26,27) = -6.62801;
MatrixA(26,28) = -6.89621;
MatrixA(26,29) = 12.486;
MatrixA(26,30) = 0.176263;
MatrixA(26,31) = -0.132402;
MatrixA(26,32) = -0.379653;
MatrixA(26,33) = -0.0395628;
MatrixA(27,1) = -6292.08;
MatrixA(27,2) = 39.9;
MatrixA(27,3) = 4499.07;
MatrixA(27,8) = 173.512;
MatrixA(27,9) = -7074.35;
MatrixA(27,10) = 69.4349;
MatrixA(27,11) = -38.1626;
MatrixA(27,12) = -44.0491;
MatrixA(27,13) = 3.22867;
MatrixA(27,14) = -29.5107;
MatrixA(27,15) = -35.4127;
MatrixA(27,16) = -6.58706;
MatrixA(27,17) = 3.25508;
MatrixA(27,18) = -0.846635;
MatrixA(27,19) = -8.12533;
MatrixA(27,20) = 1.82894;
MatrixA(27,21) = -0.016502;
MatrixA(27,22) = 0.00683218;
MatrixA(27,23) = 0.110345;
MatrixA(27,24) = -1.01308;
MatrixA(27,25) = -0.202219;
MatrixA(27,26) = -6.62801;
MatrixA(27,27) = -184.666;
MatrixA(27,28) = 12.486;
MatrixA(27,29) = -6.89621;
MatrixA(27,30) = -0.132402;
MatrixA(27,31) = 0.176263;
MatrixA(27,32) = -0.0395628;
MatrixA(27,33) = -0.379653;
MatrixA(28,1) = -6164.32;
MatrixA(28,2) = -14475.2;
MatrixA(28,3) = -4264.37;
MatrixA(28,8) = -53.542;
MatrixA(28,9) = 70.7842;
MatrixA(28,10) = -6896.9;
MatrixA(28,11) = 147.741;
MatrixA(28,12) = 44.8633;
MatrixA(28,13) = 43.6262;
MatrixA(28,14) = -135.372;
MatrixA(28,15) = 53.472;
MatrixA(28,16) = 11.7467;
MatrixA(28,17) = 10.8727;
MatrixA(28,18) = -49.9941;
MatrixA(28,19) = 5.45588;
MatrixA(28,20) = 4.82313;
MatrixA(28,21) = 0.0166333;
MatrixA(28,22) = 0.0180155;
MatrixA(28,23) = -6.20531;
MatrixA(28,24) = -2.64102;
MatrixA(28,25) = 0.0152557;
MatrixA(28,26) = -7.04389;
MatrixA(28,27) = 12.9862;
MatrixA(28,28) = -176.562;
MatrixA(28,29) = -8.90687;
MatrixA(28,30) = 0.284282;
MatrixA(28,31) = 0.257879;
MatrixA(28,32) = -2.336;
MatrixA(28,33) = 0.25492;
MatrixA(29,1) = -6164.32;
MatrixA(29,2) = -14475.2;
MatrixA(29,3) = 4263.02;
MatrixA(29,8) = 70.7842;
MatrixA(29,9) = -53.542;
MatrixA(29,10) = 147.741;
MatrixA(29,11) = -6896.9;
MatrixA(29,12) = -43.6245;
MatrixA(29,13) = -44.8643;
MatrixA(29,14) = -53.4526;
MatrixA(29,15) = 135.187;
MatrixA(29,16) = 10.8727;
MatrixA(29,17) = 11.7467;
MatrixA(29,18) = 5.45588;
MatrixA(29,19) = -49.9941;
MatrixA(29,20) = 4.82313;
MatrixA(29,21) = -0.0166316;
MatrixA(29,22) = 0.0180155;
MatrixA(29,23) = 6.20599;
MatrixA(29,24) = -2.64102;
MatrixA(29,25) = -0.0156545;
MatrixA(29,26) = 12.9862;
MatrixA(29,27) = -7.04389;
MatrixA(29,28) = -8.90687;
MatrixA(29,29) = -176.562;
MatrixA(29,30) = 0.257879;
MatrixA(29,31) = 0.284282;
MatrixA(29,32) = 0.25492;
MatrixA(29,33) = -2.336;
MatrixA(30,1) = 969.018;
MatrixA(30,2) = -7.12839;
MatrixA(30,3) = 976.575;
MatrixA(30,8) = 1152.92;
MatrixA(30,9) = -167.092;
MatrixA(30,10) = -31.1578;
MatrixA(30,11) = -25.8646;
MatrixA(30,12) = 22.3058;
MatrixA(30,13) = 3.27558;
MatrixA(30,14) = -7.91778;
MatrixA(30,15) = 10.4738;
MatrixA(30,16) = -6245.85;
MatrixA(30,17) = 866.329;
MatrixA(30,18) = 1.55648;
MatrixA(30,19) = 1.73788;
MatrixA(30,20) = 594.959;
MatrixA(30,21) = -2.62803;
MatrixA(30,22) = 2.2222;
MatrixA(30,23) = -561.735;
MatrixA(30,24) = -325.8;
MatrixA(30,25) = 0.669334;
MatrixA(30,26) = 21.1016;
MatrixA(30,27) = 6.32367;
MatrixA(30,28) = -9.44287;
MatrixA(30,29) = -8.48428;
MatrixA(30,30) = -218.447;
MatrixA(30,31) = 4.98139;
MatrixA(30,32) = 0.072726;
MatrixA(30,33) = 0.0812014;
MatrixA(31,1) = 969.018;
MatrixA(31,2) = -7.12839;
MatrixA(31,3) = -977.111;
MatrixA(31,8) = -167.092;
MatrixA(31,9) = 1152.92;
MatrixA(31,10) = -25.8646;
MatrixA(31,11) = -31.1578;
MatrixA(31,12) = -3.24737;
MatrixA(31,13) = -22.5091;
MatrixA(31,14) = -10.4676;
MatrixA(31,15) = 7.92339;
MatrixA(31,16) = 866.329;
MatrixA(31,17) = -6245.85;
MatrixA(31,18) = 1.73788;
MatrixA(31,19) = 1.55648;
MatrixA(31,20) = 594.959;
MatrixA(31,21) = 2.62803;
MatrixA(31,22) = 2.2222;
MatrixA(31,23) = 561.794;
MatrixA(31,24) = -325.8;
MatrixA(31,25) = -0.669344;
MatrixA(31,26) = 6.32367;
MatrixA(31,27) = 21.1016;
MatrixA(31,28) = -8.48428;
MatrixA(31,29) = -9.44287;
MatrixA(31,30) = 4.98139;
MatrixA(31,31) = -218.447;
MatrixA(31,32) = 0.0812014;
MatrixA(31,33) = 0.072726;
MatrixA(32,1) = -46.369;
MatrixA(32,2) = -128.671;
MatrixA(32,3) = -26.2004;
MatrixA(32,8) = 24.7172;
MatrixA(32,9) = 24.7173;
MatrixA(32,10) = -73.0121;
MatrixA(32,11) = -29.2167;
MatrixA(32,12) = 1.99885;
MatrixA(32,13) = -1.98494;
MatrixA(32,14) = -18.5184;
MatrixA(32,15) = 9.32344;
MatrixA(32,16) = 6.27234;
MatrixA(32,17) = 6.2663;
MatrixA(32,18) = -5170.7;
MatrixA(32,19) = 1.84689;
MatrixA(32,20) = 848.802;
MatrixA(32,21) = 0.0110662;
MatrixA(32,22) = 3.17042;
MatrixA(32,23) = -584.954;
MatrixA(32,24) = -464.83;
MatrixA(32,25) = 2.19124;
MatrixA(32,26) = 8.34643;
MatrixA(32,27) = 8.34607;
MatrixA(32,28) = -107.997;
MatrixA(32,29) = -9.08994;
MatrixA(32,30) = 0.129763;
MatrixA(32,31) = 0.129573;
MatrixA(32,32) = -241.602;
MatrixA(32,33) = 0.0862949;
MatrixA(33,1) = -46.369;
MatrixA(33,2) = -128.671;
MatrixA(33,3) = 22.847;
MatrixA(33,8) = 24.7173;
MatrixA(33,9) = 24.7172;
MatrixA(33,10) = -29.2167;
MatrixA(33,11) = -73.0121;
MatrixA(33,12) = 1.98509;
MatrixA(33,13) = -1.99871;
MatrixA(33,14) = -9.31677;
MatrixA(33,15) = -0.433169;
MatrixA(33,16) = 6.2663;
MatrixA(33,17) = 6.27234;
MatrixA(33,18) = 1.84689;
MatrixA(33,19) = -5170.7;
MatrixA(33,20) = 848.802;
MatrixA(33,21) = -0.0110644;
MatrixA(33,22) = 3.17042;
MatrixA(33,23) = 585.006;
MatrixA(33,24) = -464.83;
MatrixA(33,25) = -2.19123;
MatrixA(33,26) = 8.34607;
MatrixA(33,27) = 8.34643;
MatrixA(33,28) = -9.08994;
MatrixA(33,29) = -107.997;
MatrixA(33,30) = 0.129573;
MatrixA(33,31) = 0.129763;
MatrixA(33,32) = 0.0862949;
MatrixA(33,33) = -241.602;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -1.1351;
MatrixB(13,1) = -1.1351;
MatrixB(16,1) = -0.0104751;
MatrixB(17,1) = 0.010622;
MatrixB(20,1) = 8.18553e-05;
MatrixB(21,1) = 0.00579076;
MatrixB(22,1) = -1.88245e-06;
MatrixB(23,1) = 0.00568885;
MatrixB(24,1) = -2.13426e-05;
MatrixB(25,1) = 0.00167104;
MatrixB(26,1) = 1.0999;
MatrixB(27,1) = -1.09964;
MatrixB(28,1) = -0.00149;
MatrixB(29,1) = 0.0015665;
MatrixB(30,1) = 1.45057;
MatrixB(31,1) = -1.46881;
MatrixB(32,1) = 2.02186e-05;
MatrixB(33,1) = 2.24669e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -3.46139e-13;
MatrixC(2,2) = -4.93725e-13;
MatrixC(2,3) = 15.054;
MatrixC(2,8) = 12.8651;
MatrixC(2,9) = -12.8651;
MatrixC(2,10) = -0.283423;
MatrixC(2,11) = 0.283423;
MatrixC(2,12) = -39.3852;
MatrixC(2,13) = -39.3865;
MatrixC(2,14) = -36.1839;
MatrixC(2,15) = -36.1835;
MatrixC(2,16) = -0.112385;
MatrixC(2,17) = 0.112385;
MatrixC(2,18) = -2.31828e-05;
MatrixC(2,19) = 2.31828e-05;
MatrixC(2,20) = -1.79117e-14;
MatrixC(2,21) = -0.032722;
MatrixC(2,22) = 1.57562e-14;
MatrixC(2,23) = -0.0149371;
MatrixC(2,24) = 1.0307e-14;
MatrixC(2,25) = -0.00139276;
MatrixC(2,26) = 0.000341693;
MatrixC(2,27) = -0.000341693;
MatrixC(2,28) = -0.000102814;
MatrixC(2,29) = 0.000102814;
MatrixC(2,30) = -0.00306408;
MatrixC(2,31) = 0.00306408;
MatrixC(2,32) = -5.55452e-06;
MatrixC(2,33) = 5.55452e-06;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.00359916;
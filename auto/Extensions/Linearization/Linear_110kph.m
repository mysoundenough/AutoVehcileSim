% MATLAB linearized CarSim 2024.1 model, calculated at t = 180.014 s.
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

MatrixA(1,2) = -30.5556;
MatrixA(1,3) = -8.65232e-06;
MatrixA(1,20) = -0.000566334;
MatrixA(1,22) = 1;
MatrixA(1,24) = -1.09969;
MatrixA(2,3) = -4.37874e-13;
MatrixA(2,23) = -2.83461e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 7.00099e-16;
MatrixA(3,3) = 4.95173e-13;
MatrixA(3,23) = 0.000566334;
MatrixA(3,24) = 1.60534e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 1.13913e-08;
MatrixA(12,2) = 0.390708;
MatrixA(12,3) = 0.00116079;
MatrixA(12,8) = 8.07657;
MatrixA(12,12) = -54.9522;
MatrixA(12,20) = 1.55681e-12;
MatrixA(12,21) = 1.78065;
MatrixA(12,22) = 2.47113e-14;
MatrixA(12,23) = 1.95885;
MatrixA(12,24) = -7.90763e-13;
MatrixA(12,25) = 0.978161;
MatrixA(12,26) = 0.0915737;
MatrixA(13,1) = -1.13913e-08;
MatrixA(13,2) = -0.390708;
MatrixA(13,3) = 0.000904269;
MatrixA(13,9) = -8.07657;
MatrixA(13,13) = -54.0267;
MatrixA(13,20) = -1.55681e-12;
MatrixA(13,21) = 1.78065;
MatrixA(13,22) = -4.94227e-14;
MatrixA(13,23) = 1.95885;
MatrixA(13,24) = 7.66052e-13;
MatrixA(13,25) = 0.978161;
MatrixA(13,27) = -0.0915737;
MatrixA(14,1) = 2.36051e-09;
MatrixA(14,2) = 0.0525846;
MatrixA(14,3) = -3.79372e-06;
MatrixA(14,10) = -1.46357;
MatrixA(14,14) = -55.5763;
MatrixA(14,20) = 1.20598e-11;
MatrixA(14,21) = 1.81598;
MatrixA(14,22) = 5.90667e-15;
MatrixA(14,23) = -2.27015;
MatrixA(14,24) = -6.6328e-12;
MatrixA(14,25) = 0.999988;
MatrixA(14,28) = 0.308129;
MatrixA(15,1) = -2.36116e-09;
MatrixA(15,2) = -0.0525846;
MatrixA(15,3) = -6.84629e-07;
MatrixA(15,11) = 1.46357;
MatrixA(15,15) = -55.5964;
MatrixA(15,20) = -1.20591e-11;
MatrixA(15,21) = 1.81598;
MatrixA(15,22) = -7.088e-15;
MatrixA(15,23) = -2.27015;
MatrixA(15,24) = 6.63083e-12;
MatrixA(15,25) = 0.999988;
MatrixA(15,29) = -0.308129;
MatrixA(20,1) = -81.1246;
MatrixA(20,2) = -128.225;
MatrixA(20,3) = 0.000871501;
MatrixA(20,8) = -13.7342;
MatrixA(20,9) = -13.7342;
MatrixA(20,10) = -28.8755;
MatrixA(20,11) = -28.8755;
MatrixA(20,12) = -0.388824;
MatrixA(20,13) = 0.372815;
MatrixA(20,14) = -0.458693;
MatrixA(20,15) = 0.535101;
MatrixA(20,20) = -7.71109;
MatrixA(20,21) = -8.25412e-07;
MatrixA(20,22) = -0.00436722;
MatrixA(20,23) = 0.000133141;
MatrixA(20,24) = 4.21334;
MatrixA(20,25) = -1.94487e-06;
MatrixA(20,26) = -0.287639;
MatrixA(20,27) = -0.287639;
MatrixA(20,28) = -0.274642;
MatrixA(20,29) = -0.274642;
MatrixA(20,30) = 0.560291;
MatrixA(20,31) = 0.560291;
MatrixA(20,32) = 0.532236;
MatrixA(20,33) = 0.532236;
MatrixA(21,1) = -2.48478e-12;
MatrixA(21,2) = -3.05974e-12;
MatrixA(21,3) = 29.665;
MatrixA(21,8) = 2.18476;
MatrixA(21,9) = -2.18476;
MatrixA(21,10) = 16.4497;
MatrixA(21,11) = -16.4497;
MatrixA(21,12) = -36.1969;
MatrixA(21,13) = -36.2519;
MatrixA(21,14) = -33.7861;
MatrixA(21,15) = -33.7834;
MatrixA(21,20) = -7.62326e-14;
MatrixA(21,21) = -0.0705683;
MatrixA(21,22) = 1.37656e-14;
MatrixA(21,23) = -30.669;
MatrixA(21,24) = 1.23718e-13;
MatrixA(21,25) = 0.0128134;
MatrixA(21,26) = -0.674346;
MatrixA(21,27) = 0.674346;
MatrixA(21,28) = -0.118391;
MatrixA(21,29) = 0.118391;
MatrixA(21,30) = -0.0068303;
MatrixA(21,31) = 0.0068303;
MatrixA(21,32) = -0.00533775;
MatrixA(21,33) = 0.00533775;
MatrixA(22,1) = -11.9885;
MatrixA(22,2) = -26.3905;
MatrixA(22,3) = 0.0631536;
MatrixA(22,8) = 22.4888;
MatrixA(22,9) = 22.4888;
MatrixA(22,10) = 17.6847;
MatrixA(22,11) = 17.6847;
MatrixA(22,12) = 2.50337;
MatrixA(22,13) = -2.50644;
MatrixA(22,14) = 7.23347;
MatrixA(22,15) = -7.22313;
MatrixA(22,20) = -0.36248;
MatrixA(22,21) = 2.46478e-07;
MatrixA(22,22) = -0.000205292;
MatrixA(22,23) = -1.36114e-05;
MatrixA(22,24) = 30.7629;
MatrixA(22,25) = -4.30832e-06;
MatrixA(22,26) = 7.63059;
MatrixA(22,27) = 7.63059;
MatrixA(22,28) = 7.21817;
MatrixA(22,29) = 7.21817;
MatrixA(22,30) = -0.0156202;
MatrixA(22,31) = -0.0156202;
MatrixA(22,32) = 0.0691957;
MatrixA(22,33) = 0.0691957;
MatrixA(23,1) = -1.20081e-13;
MatrixA(23,2) = -9.37563e-12;
MatrixA(23,3) = 15.849;
MatrixA(23,8) = 12.6531;
MatrixA(23,9) = -12.6531;
MatrixA(23,10) = -2.38575;
MatrixA(23,11) = 2.38575;
MatrixA(23,12) = -35.9798;
MatrixA(23,13) = -36.046;
MatrixA(23,14) = 40.3157;
MatrixA(23,15) = 40.3603;
MatrixA(23,20) = 1.09677e-14;
MatrixA(23,21) = -0.0346057;
MatrixA(23,22) = 2.03411e-14;
MatrixA(23,23) = -3.34053;
MatrixA(23,24) = 4.16152e-12;
MatrixA(23,25) = -0.423982;
MatrixA(23,26) = -0.131588;
MatrixA(23,27) = 0.131588;
MatrixA(23,28) = -0.197246;
MatrixA(23,29) = 0.197246;
MatrixA(23,30) = -0.351048;
MatrixA(23,31) = 0.351048;
MatrixA(23,32) = -0.325709;
MatrixA(23,33) = 0.325709;
MatrixA(24,1) = 9.62167;
MatrixA(24,2) = 4.1806;
MatrixA(24,3) = 0.0466896;
MatrixA(24,8) = -20.6948;
MatrixA(24,9) = -20.6948;
MatrixA(24,10) = 30.1715;
MatrixA(24,11) = 30.1715;
MatrixA(24,12) = -2.6296;
MatrixA(24,13) = 2.63765;
MatrixA(24,14) = 9.17308;
MatrixA(24,15) = -9.18085;
MatrixA(24,20) = 1.42761;
MatrixA(24,21) = -9.37259e-07;
MatrixA(24,22) = 0.000808536;
MatrixA(24,23) = -4.91111e-05;
MatrixA(24,24) = -0.793184;
MatrixA(24,25) = -7.07731e-06;
MatrixA(24,26) = -8.35683;
MatrixA(24,27) = -8.35683;
MatrixA(24,28) = 9.10579;
MatrixA(24,29) = 9.10579;
MatrixA(24,30) = -0.08762;
MatrixA(24,31) = -0.08762;
MatrixA(24,32) = -0.0576731;
MatrixA(24,33) = -0.0576731;
MatrixA(25,1) = -3.10487e-12;
MatrixA(25,2) = -6.02779e-12;
MatrixA(25,3) = 35.3336;
MatrixA(25,8) = 86.7671;
MatrixA(25,9) = -86.7671;
MatrixA(25,10) = 77.5705;
MatrixA(25,11) = -77.5705;
MatrixA(25,12) = -57.4278;
MatrixA(25,13) = -57.5158;
MatrixA(25,14) = -46.0005;
MatrixA(25,15) = -46.0182;
MatrixA(25,20) = 2.80171e-12;
MatrixA(25,21) = -0.0446849;
MatrixA(25,22) = 8.07456e-13;
MatrixA(25,23) = 1.80535;
MatrixA(25,24) = -8.14443e-13;
MatrixA(25,25) = -0.079009;
MatrixA(25,26) = 14.4649;
MatrixA(25,27) = -14.4649;
MatrixA(25,28) = 13.7561;
MatrixA(25,29) = -13.7561;
MatrixA(25,30) = -0.0244301;
MatrixA(25,31) = 0.0244301;
MatrixA(25,32) = 0.141;
MatrixA(25,33) = -0.141;
MatrixA(26,1) = -6289.66;
MatrixA(26,2) = 37.3365;
MatrixA(26,3) = -4500.13;
MatrixA(26,8) = -7060.45;
MatrixA(26,9) = 176.784;
MatrixA(26,10) = -38.593;
MatrixA(26,11) = 70.5038;
MatrixA(26,12) = -18.0258;
MatrixA(26,13) = 44.5077;
MatrixA(26,14) = 35.9245;
MatrixA(26,15) = 30.14;
MatrixA(26,20) = 1.27728;
MatrixA(26,21) = 0.0315886;
MatrixA(26,22) = 0.0007234;
MatrixA(26,23) = -0.0339782;
MatrixA(26,24) = -0.726294;
MatrixA(26,25) = 0.513828;
MatrixA(26,26) = -184.739;
MatrixA(26,27) = -6.60271;
MatrixA(26,28) = -6.88258;
MatrixA(26,29) = 12.5385;
MatrixA(26,30) = 0.134153;
MatrixA(26,31) = -0.0960616;
MatrixA(26,32) = -0.247673;
MatrixA(26,33) = -0.0313777;
MatrixA(27,1) = -6289.66;
MatrixA(27,2) = 37.3365;
MatrixA(27,3) = 4499.38;
MatrixA(27,8) = 176.784;
MatrixA(27,9) = -7060.45;
MatrixA(27,10) = 70.5038;
MatrixA(27,11) = -38.593;
MatrixA(27,12) = -44.4359;
MatrixA(27,13) = 18.0449;
MatrixA(27,14) = -30.1462;
MatrixA(27,15) = -35.9581;
MatrixA(27,20) = 1.27728;
MatrixA(27,21) = -0.0315912;
MatrixA(27,22) = 0.0007234;
MatrixA(27,23) = 0.0339282;
MatrixA(27,24) = -0.726294;
MatrixA(27,25) = -0.514388;
MatrixA(27,26) = -6.60271;
MatrixA(27,27) = -184.739;
MatrixA(27,28) = 12.5385;
MatrixA(27,29) = -6.88258;
MatrixA(27,30) = -0.0960616;
MatrixA(27,31) = 0.134153;
MatrixA(27,32) = -0.0313777;
MatrixA(27,33) = -0.247673;
MatrixA(28,1) = -6182.51;
MatrixA(28,2) = -14496.9;
MatrixA(28,3) = -4267.68;
MatrixA(28,8) = -58.1288;
MatrixA(28,9) = 62.8709;
MatrixA(28,10) = -6914.46;
MatrixA(28,11) = 146.128;
MatrixA(28,12) = 43.0644;
MatrixA(28,13) = 41.5101;
MatrixA(28,14) = -132.432;
MatrixA(28,15) = 53.49;
MatrixA(28,20) = 3.03912;
MatrixA(28,21) = 0.0361078;
MatrixA(28,22) = 0.0017212;
MatrixA(28,23) = -4.11865;
MatrixA(28,24) = -1.67113;
MatrixA(28,25) = -0.00661214;
MatrixA(28,26) = -7.04602;
MatrixA(28,27) = 13.0185;
MatrixA(28,28) = -176.419;
MatrixA(28,29) = -8.96368;
MatrixA(28,30) = 0.204447;
MatrixA(28,31) = 0.175691;
MatrixA(28,32) = -1.55959;
MatrixA(28,33) = 0.166875;
MatrixA(29,1) = -6182.51;
MatrixA(29,2) = -14496.9;
MatrixA(29,3) = 4266.4;
MatrixA(29,8) = 62.8709;
MatrixA(29,9) = -58.1288;
MatrixA(29,10) = 146.128;
MatrixA(29,11) = -6914.46;
MatrixA(29,12) = -41.4544;
MatrixA(29,13) = -43.138;
MatrixA(29,14) = -53.469;
MatrixA(29,15) = 132.201;
MatrixA(29,20) = 3.03912;
MatrixA(29,21) = -0.0361062;
MatrixA(29,22) = 0.0017212;
MatrixA(29,23) = 4.11905;
MatrixA(29,24) = -1.67113;
MatrixA(29,25) = 0.00621049;
MatrixA(29,26) = 13.0185;
MatrixA(29,27) = -7.04602;
MatrixA(29,28) = -8.96368;
MatrixA(29,29) = -176.419;
MatrixA(29,30) = 0.175691;
MatrixA(29,31) = 0.204447;
MatrixA(29,32) = 0.166875;
MatrixA(29,33) = -1.55959;
MatrixA(30,1) = 3788.97;
MatrixA(30,2) = -10.5218;
MatrixA(30,3) = 3616.3;
MatrixA(30,8) = 4428.95;
MatrixA(30,9) = -618.658;
MatrixA(30,10) = -31.9155;
MatrixA(30,11) = -27.1366;
MatrixA(30,12) = 64.4207;
MatrixA(30,13) = 7.53788;
MatrixA(30,14) = -7.89082;
MatrixA(30,15) = 10.2286;
MatrixA(30,20) = 439.18;
MatrixA(30,21) = -1.5215;
MatrixA(30,22) = 0.248734;
MatrixA(30,23) = -414.124;
MatrixA(30,24) = -241.537;
MatrixA(30,25) = -0.579103;
MatrixA(30,26) = 15.4884;
MatrixA(30,27) = 7.00845;
MatrixA(30,28) = -9.41814;
MatrixA(30,29) = -8.56444;
MatrixA(30,30) = -164.092;
MatrixA(30,31) = 0.513169;
MatrixA(30,32) = 0.0496371;
MatrixA(30,33) = 0.054433;
MatrixA(31,1) = 3788.97;
MatrixA(31,2) = -10.5218;
MatrixA(31,3) = -3616.8;
MatrixA(31,8) = -618.658;
MatrixA(31,9) = 4428.95;
MatrixA(31,10) = -27.1366;
MatrixA(31,11) = -31.9155;
MatrixA(31,12) = -8.12227;
MatrixA(31,13) = -60.2147;
MatrixA(31,14) = -10.2214;
MatrixA(31,15) = 7.89751;
MatrixA(31,20) = 439.18;
MatrixA(31,21) = 1.5215;
MatrixA(31,22) = 0.248734;
MatrixA(31,23) = 414.105;
MatrixA(31,24) = -241.537;
MatrixA(31,25) = 0.579094;
MatrixA(31,26) = 7.00845;
MatrixA(31,27) = 15.4884;
MatrixA(31,28) = -8.56444;
MatrixA(31,29) = -9.41814;
MatrixA(31,30) = 0.513169;
MatrixA(31,31) = -164.092;
MatrixA(31,32) = 0.054433;
MatrixA(31,33) = 0.0496371;
MatrixA(32,1) = -45.1589;
MatrixA(32,2) = -119.095;
MatrixA(32,3) = -18.6987;
MatrixA(32,8) = 20.6888;
MatrixA(32,9) = 20.701;
MatrixA(32,10) = -65.7908;
MatrixA(32,11) = -30.1747;
MatrixA(32,12) = 2.65446;
MatrixA(32,13) = -2.61277;
MatrixA(32,14) = -19.4577;
MatrixA(32,15) = 9.14902;
MatrixA(32,20) = 562.147;
MatrixA(32,21) = 0.0292459;
MatrixA(32,22) = 0.318373;
MatrixA(32,23) = -387.724;
MatrixA(32,24) = -309.162;
MatrixA(32,25) = 0.235969;
MatrixA(32,26) = 8.35756;
MatrixA(32,27) = 8.35621;
MatrixA(32,28) = -75.2094;
MatrixA(32,29) = -9.10682;
MatrixA(32,30) = 0.0878867;
MatrixA(32,31) = 0.0873601;
MatrixA(32,32) = -160.069;
MatrixA(32,33) = 0.0574235;
MatrixA(33,1) = -45.1589;
MatrixA(33,2) = -119.095;
MatrixA(33,3) = 17.4994;
MatrixA(33,8) = 20.701;
MatrixA(33,9) = 20.6888;
MatrixA(33,10) = -30.1747;
MatrixA(33,11) = -65.7908;
MatrixA(33,12) = 2.60477;
MatrixA(33,13) = -2.66255;
MatrixA(33,14) = -9.14128;
MatrixA(33,15) = -3.5309;
MatrixA(33,20) = 562.147;
MatrixA(33,21) = -0.029244;
MatrixA(33,22) = 0.318373;
MatrixA(33,23) = 387.706;
MatrixA(33,24) = -309.162;
MatrixA(33,25) = -0.235955;
MatrixA(33,26) = 8.35621;
MatrixA(33,27) = 8.35756;
MatrixA(33,28) = -9.10682;
MatrixA(33,29) = -75.2094;
MatrixA(33,30) = 0.0873601;
MatrixA(33,31) = 0.0878867;
MatrixA(33,32) = 0.0574235;
MatrixA(33,33) = -160.069;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -2.55228;
MatrixB(13,1) = -2.55228;
MatrixB(20,1) = 0.000132454;
MatrixB(21,1) = 0.0167659;
MatrixB(22,1) = -3.49179e-06;
MatrixB(23,1) = 0.0179408;
MatrixB(24,1) = -3.47847e-05;
MatrixB(25,1) = 0.0216405;
MatrixB(26,1) = 1.14787;
MatrixB(27,1) = -1.14762;
MatrixB(28,1) = -0.0160447;
MatrixB(29,1) = 0.0161695;
MatrixB(30,1) = 1.20426;
MatrixB(31,1) = -1.23385;
MatrixB(32,1) = 2.21205e-05;
MatrixB(33,1) = 4.74512e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -2.63226e-12;
MatrixC(2,2) = -3.22423e-12;
MatrixC(2,3) = 11.0072;
MatrixC(2,8) = 10.1608;
MatrixC(2,9) = -10.1608;
MatrixC(2,10) = -0.382386;
MatrixC(2,11) = 0.382386;
MatrixC(2,12) = -38.0028;
MatrixC(2,13) = -38.0604;
MatrixC(2,14) = -36.5735;
MatrixC(2,15) = -36.5714;
MatrixC(2,20) = 3.15183e-14;
MatrixC(2,21) = -0.0718947;
MatrixC(2,22) = 2.30187e-14;
MatrixC(2,23) = -0.0165802;
MatrixC(2,24) = 7.68717e-14;
MatrixC(2,25) = -0.00315067;
MatrixC(2,26) = 0.000358273;
MatrixC(2,27) = -0.000358273;
MatrixC(2,28) = -0.000219456;
MatrixC(2,29) = 0.000219456;
MatrixC(2,30) = -0.00346214;
MatrixC(2,31) = 0.00346214;
MatrixC(2,32) = -1.60646e-05;
MatrixC(2,33) = 1.60646e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.0160594;
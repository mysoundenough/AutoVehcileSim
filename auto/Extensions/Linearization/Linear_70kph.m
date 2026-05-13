% MATLAB linearized CarSim 2024.1 model, calculated at t = 120.009 s.
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

MatrixA(1,2) = -19.4444;
MatrixA(1,3) = -2.84153e-05;
MatrixA(1,20) = -0.00292273;
MatrixA(1,22) = 0.999996;
MatrixA(1,24) = -1.09842;
MatrixA(2,3) = 3.57566e-12;
MatrixA(2,23) = -1.09083e-16;
MatrixA(2,24) = 1;
MatrixA(3,2) = 5.57196e-16;
MatrixA(3,3) = -2.09047e-11;
MatrixA(3,23) = 0.00292274;
MatrixA(3,24) = 3.1882e-19;
MatrixA(3,25) = 1;
MatrixA(8,26) = 1;
MatrixA(9,27) = 1;
MatrixA(10,28) = 1;
MatrixA(11,29) = 1;
MatrixA(12,1) = 4.42822e-09;
MatrixA(12,2) = 0.275077;
MatrixA(12,3) = 0.000977345;
MatrixA(12,8) = 4.57014;
MatrixA(12,12) = -34.4411;
MatrixA(12,20) = 1.15921e-11;
MatrixA(12,21) = 1.75115;
MatrixA(12,22) = 2.4302e-14;
MatrixA(12,23) = 1.92767;
MatrixA(12,24) = -6.30637e-12;
MatrixA(12,25) = 0.95447;
MatrixA(12,26) = 0.0712997;
MatrixA(13,1) = -4.42815e-09;
MatrixA(13,2) = -0.275077;
MatrixA(13,3) = 0.000776125;
MatrixA(13,9) = -4.57014;
MatrixA(13,13) = -33.7567;
MatrixA(13,20) = -1.15678e-11;
MatrixA(13,21) = 1.75115;
MatrixA(13,22) = -2.4302e-14;
MatrixA(13,23) = 1.92767;
MatrixA(13,24) = 6.35497e-12;
MatrixA(13,25) = 0.95447;
MatrixA(13,27) = -0.0712997;
MatrixA(14,1) = 2.0315e-07;
MatrixA(14,2) = 0.0153727;
MatrixA(14,3) = -4.98675e-07;
MatrixA(14,10) = -0.901713;
MatrixA(14,14) = -35.5972;
MatrixA(14,20) = 5.92654e-11;
MatrixA(14,21) = 1.82763;
MatrixA(14,22) = 1.73185e-13;
MatrixA(14,23) = -2.28324;
MatrixA(14,24) = -3.24938e-11;
MatrixA(14,25) = 1.00871;
MatrixA(14,28) = 0.316448;
MatrixA(15,1) = -2.0315e-07;
MatrixA(15,2) = -0.0153727;
MatrixA(15,3) = 2.76725e-07;
MatrixA(15,11) = 0.901713;
MatrixA(15,15) = -35.6028;
MatrixA(15,20) = -5.92646e-11;
MatrixA(15,21) = 1.82763;
MatrixA(15,22) = -1.73383e-13;
MatrixA(15,23) = -2.28324;
MatrixA(15,24) = 3.2493e-11;
MatrixA(15,25) = 1.00871;
MatrixA(15,29) = -0.316448;
MatrixA(17,3) = -5.23569e-07;
MatrixA(20,1) = -62.4628;
MatrixA(20,2) = -128.402;
MatrixA(20,3) = 0.00654045;
MatrixA(20,8) = -4.41992;
MatrixA(20,9) = -4.41992;
MatrixA(20,10) = -28.9156;
MatrixA(20,11) = -28.9156;
MatrixA(20,12) = -0.271087;
MatrixA(20,13) = 0.275447;
MatrixA(20,14) = -0.482763;
MatrixA(20,15) = 0.550315;
MatrixA(20,20) = -12.2022;
MatrixA(20,21) = -8.21703e-07;
MatrixA(20,22) = -0.0356661;
MatrixA(20,23) = 0.000369677;
MatrixA(20,24) = 6.62737;
MatrixA(20,25) = -2.02597e-06;
MatrixA(20,26) = -0.335529;
MatrixA(20,27) = -0.335529;
MatrixA(20,28) = -0.167205;
MatrixA(20,29) = -0.167205;
MatrixA(20,30) = 0.902187;
MatrixA(20,31) = 0.902187;
MatrixA(20,32) = 0.829702;
MatrixA(20,33) = 0.829702;
MatrixA(21,1) = -9.16226e-13;
MatrixA(21,2) = -9.01389e-13;
MatrixA(21,3) = 30.5154;
MatrixA(21,8) = 1.88661;
MatrixA(21,9) = -1.88661;
MatrixA(21,10) = 17.1337;
MatrixA(21,11) = -17.1337;
MatrixA(21,12) = -37.1507;
MatrixA(21,13) = -37.1577;
MatrixA(21,14) = -33.4986;
MatrixA(21,15) = -33.4973;
MatrixA(21,20) = -2.00611e-13;
MatrixA(21,21) = -0.0450594;
MatrixA(21,22) = -8.73224e-15;
MatrixA(21,23) = -19.5707;
MatrixA(21,24) = -1.59078e-13;
MatrixA(21,25) = 0.0540742;
MatrixA(21,26) = -0.723458;
MatrixA(21,27) = 0.723458;
MatrixA(21,28) = -0.107016;
MatrixA(21,29) = 0.107016;
MatrixA(21,30) = -0.0104179;
MatrixA(21,31) = 0.0104179;
MatrixA(21,32) = -0.00827955;
MatrixA(21,33) = 0.00827955;
MatrixA(22,1) = -12.9189;
MatrixA(22,2) = -27.2183;
MatrixA(22,3) = 0.0614682;
MatrixA(22,8) = 22.4838;
MatrixA(22,9) = 22.4838;
MatrixA(22,10) = 17.113;
MatrixA(22,11) = 17.113;
MatrixA(22,12) = 2.05406;
MatrixA(22,13) = -2.05454;
MatrixA(22,14) = 7.3183;
MatrixA(22,15) = -7.30926;
MatrixA(22,20) = -0.593052;
MatrixA(22,21) = 2.46786e-07;
MatrixA(22,22) = -0.00173347;
MatrixA(22,23) = 3.54225e-06;
MatrixA(22,24) = 19.7746;
MatrixA(22,25) = -3.95575e-06;
MatrixA(22,26) = 7.63007;
MatrixA(22,27) = 7.63007;
MatrixA(22,28) = 7.22911;
MatrixA(22,29) = 7.22911;
MatrixA(22,30) = -0.0235593;
MatrixA(22,31) = -0.0235593;
MatrixA(22,32) = 0.109137;
MatrixA(22,33) = 0.109137;
MatrixA(23,1) = -1.90646e-12;
MatrixA(23,2) = -1.23097e-11;
MatrixA(23,3) = 6.88671;
MatrixA(23,8) = 6.70394;
MatrixA(23,9) = -6.70394;
MatrixA(23,10) = -3.11126;
MatrixA(23,11) = 3.11126;
MatrixA(23,12) = -37.0353;
MatrixA(23,13) = -37.0398;
MatrixA(23,14) = 39.9649;
MatrixA(23,15) = 40.0055;
MatrixA(23,20) = -7.09149e-12;
MatrixA(23,21) = -0.0304851;
MatrixA(23,22) = 1.98566e-14;
MatrixA(23,23) = -5.29874;
MatrixA(23,24) = -1.41059e-11;
MatrixA(23,25) = -0.259847;
MatrixA(23,26) = -0.137327;
MatrixA(23,27) = 0.137327;
MatrixA(23,28) = -0.26926;
MatrixA(23,29) = 0.26926;
MatrixA(23,30) = -0.565083;
MatrixA(23,31) = 0.565083;
MatrixA(23,32) = -0.507906;
MatrixA(23,33) = 0.507906;
MatrixA(24,1) = 4.36262;
MatrixA(24,2) = 3.33502;
MatrixA(24,3) = 0.0509553;
MatrixA(24,8) = -23.5454;
MatrixA(24,9) = -23.5454;
MatrixA(24,10) = 29.5006;
MatrixA(24,11) = 29.5006;
MatrixA(24,12) = -2.16177;
MatrixA(24,13) = 2.16103;
MatrixA(24,14) = 9.28627;
MatrixA(24,15) = -9.29335;
MatrixA(24,20) = 2.274;
MatrixA(24,21) = -9.3817e-07;
MatrixA(24,22) = 0.00664681;
MatrixA(24,23) = -0.00010854;
MatrixA(24,24) = -1.25207;
MatrixA(24,25) = -7.82569e-06;
MatrixA(24,26) = -8.34386;
MatrixA(24,27) = -8.34386;
MatrixA(24,28) = 9.08955;
MatrixA(24,29) = 9.08955;
MatrixA(24,30) = -0.175465;
MatrixA(24,31) = -0.175465;
MatrixA(24,32) = -0.0894102;
MatrixA(24,33) = -0.0894102;
MatrixA(25,1) = -2.15756e-12;
MatrixA(25,2) = -3.34633e-12;
MatrixA(25,3) = 37.4702;
MatrixA(25,8) = 88.1978;
MatrixA(25,9) = -88.1978;
MatrixA(25,10) = 77.2364;
MatrixA(25,11) = -77.2364;
MatrixA(25,12) = -59.399;
MatrixA(25,13) = -59.4102;
MatrixA(25,14) = -45.491;
MatrixA(25,15) = -45.5082;
MatrixA(25,20) = 2.96344e-13;
MatrixA(25,21) = -0.0288905;
MatrixA(25,22) = 7.45664e-13;
MatrixA(25,23) = 1.7027;
MatrixA(25,24) = -7.02222e-13;
MatrixA(25,25) = -0.0475322;
MatrixA(25,26) = 14.4501;
MatrixA(25,27) = -14.4501;
MatrixA(25,28) = 13.7845;
MatrixA(25,29) = -13.7845;
MatrixA(25,30) = -0.034002;
MatrixA(25,31) = 0.034002;
MatrixA(25,32) = 0.22281;
MatrixA(25,33) = -0.22281;
MatrixA(26,1) = -6291.45;
MatrixA(26,2) = 39.1824;
MatrixA(26,3) = -4499.86;
MatrixA(26,8) = -7066.75;
MatrixA(26,9) = 174.459;
MatrixA(26,10) = -38.3197;
MatrixA(26,11) = 69.7685;
MatrixA(26,12) = -7.13517;
MatrixA(26,13) = 44.1573;
MatrixA(26,14) = 35.5204;
MatrixA(26,15) = 29.6678;
MatrixA(26,20) = 1.96757;
MatrixA(26,21) = 0.0223189;
MatrixA(26,22) = 0.00575172;
MatrixA(26,23) = 0.00488237;
MatrixA(26,24) = -1.09469;
MatrixA(26,25) = 0.293399;
MatrixA(26,26) = -184.691;
MatrixA(26,27) = -6.61742;
MatrixA(26,28) = -6.91158;
MatrixA(26,29) = 12.4978;
MatrixA(26,30) = 0.184012;
MatrixA(26,31) = -0.184668;
MatrixA(26,32) = -0.390611;
MatrixA(26,33) = -0.0429292;
MatrixA(27,1) = -6291.45;
MatrixA(27,2) = 39.1824;
MatrixA(27,3) = 4499.14;
MatrixA(27,8) = 174.459;
MatrixA(27,9) = -7066.75;
MatrixA(27,10) = 69.7685;
MatrixA(27,11) = -38.3197;
MatrixA(27,12) = -44.1502;
MatrixA(27,13) = 7.1364;
MatrixA(27,14) = -29.672;
MatrixA(27,15) = -35.5515;
MatrixA(27,20) = 1.96757;
MatrixA(27,21) = -0.0223215;
MatrixA(27,22) = 0.00575172;
MatrixA(27,23) = -0.00525038;
MatrixA(27,24) = -1.09469;
MatrixA(27,25) = -0.293964;
MatrixA(27,26) = -6.61742;
MatrixA(27,27) = -184.691;
MatrixA(27,28) = 12.4978;
MatrixA(27,29) = -6.91158;
MatrixA(27,30) = -0.184668;
MatrixA(27,31) = 0.184012;
MatrixA(27,32) = -0.0429292;
MatrixA(27,33) = -0.390611;
MatrixA(28,1) = -6168.92;
MatrixA(28,2) = -14480.9;
MatrixA(28,3) = -4265.31;
MatrixA(28,8) = -54.5034;
MatrixA(28,9) = 68.5632;
MatrixA(28,10) = -6902.31;
MatrixA(28,11) = 147.295;
MatrixA(28,12) = 44.388;
MatrixA(28,13) = 43.0557;
MatrixA(28,14) = -134.624;
MatrixA(28,15) = 53.476;
MatrixA(28,20) = 4.60556;
MatrixA(28,21) = 0.0232905;
MatrixA(28,22) = 0.0134613;
MatrixA(28,23) = -6.39731;
MatrixA(28,24) = -2.52479;
MatrixA(28,25) = 0.00906369;
MatrixA(28,26) = -7.05344;
MatrixA(28,27) = 12.9849;
MatrixA(28,28) = -176.642;
MatrixA(28,29) = -8.90882;
MatrixA(28,30) = 0.367362;
MatrixA(28,31) = 0.330433;
MatrixA(28,32) = -2.41763;
MatrixA(28,33) = 0.262502;
MatrixA(29,1) = -6168.92;
MatrixA(29,2) = -14480.9;
MatrixA(29,3) = 4263.98;
MatrixA(29,8) = 68.5632;
MatrixA(29,9) = -54.5034;
MatrixA(29,10) = 147.295;
MatrixA(29,11) = -6902.31;
MatrixA(29,12) = -43.0456;
MatrixA(29,13) = -44.3944;
MatrixA(29,14) = -53.4557;
MatrixA(29,15) = 134.425;
MatrixA(29,20) = 4.60556;
MatrixA(29,21) = -0.0232888;
MatrixA(29,22) = 0.0134613;
MatrixA(29,23) = 6.39765;
MatrixA(29,24) = -2.52479;
MatrixA(29,25) = -0.00946317;
MatrixA(29,26) = 12.9849;
MatrixA(29,27) = -7.05344;
MatrixA(29,28) = -8.90882;
MatrixA(29,29) = -176.642;
MatrixA(29,30) = 0.330433;
MatrixA(29,31) = 0.367362;
MatrixA(29,32) = 0.262502;
MatrixA(29,33) = -2.41763;
MatrixA(30,1) = 1667.94;
MatrixA(30,2) = -10.673;
MatrixA(30,3) = 1630.89;
MatrixA(30,8) = 1963.48;
MatrixA(30,9) = -278.944;
MatrixA(30,10) = -31.395;
MatrixA(30,11) = -26.2267;
MatrixA(30,12) = 31.7088;
MatrixA(30,13) = 4.45583;
MatrixA(30,14) = -7.91078;
MatrixA(30,15) = 10.4115;
MatrixA(30,20) = 706.858;
MatrixA(30,21) = -2.95745;
MatrixA(30,22) = 2.06611;
MatrixA(30,23) = -667.255;
MatrixA(30,24) = -387.589;
MatrixA(30,25) = 0.343151;
MatrixA(30,26) = 24.5433;
MatrixA(30,27) = 5.71989;
MatrixA(30,28) = -9.433;
MatrixA(30,29) = -8.50076;
MatrixA(30,30) = -252.549;
MatrixA(30,31) = 12.7814;
MatrixA(30,32) = 0.0757092;
MatrixA(30,33) = 0.0841174;
MatrixA(31,1) = 1667.94;
MatrixA(31,2) = -10.673;
MatrixA(31,3) = -1631.42;
MatrixA(31,8) = -278.944;
MatrixA(31,9) = 1963.48;
MatrixA(31,10) = -26.2267;
MatrixA(31,11) = -31.395;
MatrixA(31,12) = -4.3005;
MatrixA(31,13) = -32.8285;
MatrixA(31,14) = -10.4049;
MatrixA(31,15) = 7.91677;
MatrixA(31,20) = 706.858;
MatrixA(31,21) = 2.95745;
MatrixA(31,22) = 2.06611;
MatrixA(31,23) = 667.202;
MatrixA(31,24) = -387.589;
MatrixA(31,25) = -0.34316;
MatrixA(31,26) = 5.71989;
MatrixA(31,27) = 24.5433;
MatrixA(31,28) = -8.50076;
MatrixA(31,29) = -9.433;
MatrixA(31,30) = 12.7814;
MatrixA(31,31) = -252.549;
MatrixA(31,32) = 0.0841174;
MatrixA(31,33) = 0.0757092;
MatrixA(32,1) = -45.6916;
MatrixA(32,2) = -125.876;
MatrixA(32,3) = -24.0414;
MatrixA(32,8) = 23.5447;
MatrixA(32,9) = 23.5462;
MatrixA(32,10) = -70.9154;
MatrixA(32,11) = -29.5023;
MatrixA(32,12) = 2.17343;
MatrixA(32,13) = -2.14938;
MatrixA(32,14) = -18.9429;
MatrixA(32,15) = 9.27901;
MatrixA(32,20) = 876.39;
MatrixA(32,21) = 0.0198588;
MatrixA(32,22) = 2.56159;
MatrixA(32,23) = -604.307;
MatrixA(32,24) = -480.532;
MatrixA(32,25) = 1.77715;
MatrixA(32,26) = 8.34418;
MatrixA(32,27) = 8.34357;
MatrixA(32,28) = -111.483;
MatrixA(32,29) = -9.09004;
MatrixA(32,30) = 0.175661;
MatrixA(32,31) = 0.175275;
MatrixA(32,32) = -249.549;
MatrixA(32,33) = 0.0892331;
MatrixA(33,1) = -45.6916;
MatrixA(33,2) = -125.876;
MatrixA(33,3) = 21.0655;
MatrixA(33,8) = 23.5462;
MatrixA(33,9) = 23.5447;
MatrixA(33,10) = -29.5023;
MatrixA(33,11) = -70.9154;
MatrixA(33,12) = 2.15013;
MatrixA(33,13) = -2.17268;
MatrixA(33,14) = -9.27194;
MatrixA(33,15) = -1.37819;
MatrixA(33,20) = 876.39;
MatrixA(33,21) = -0.0198569;
MatrixA(33,22) = 2.56159;
MatrixA(33,23) = 604.265;
MatrixA(33,24) = -480.532;
MatrixA(33,25) = -1.77714;
MatrixA(33,26) = 8.34357;
MatrixA(33,27) = 8.34418;
MatrixA(33,28) = -9.09004;
MatrixA(33,29) = -111.483;
MatrixA(33,30) = 0.175275;
MatrixA(33,31) = 0.175661;
MatrixA(33,32) = 0.0892331;
MatrixA(33,33) = -249.549;

MatrixB = zeros(33, 1);

MatrixB(12,1) = -1.59748;
MatrixB(13,1) = -1.59748;
MatrixB(20,1) = 0.000135471;
MatrixB(21,1) = 0.00862157;
MatrixB(22,1) = -3.33905e-06;
MatrixB(23,1) = 0.0125186;
MatrixB(24,1) = -3.53434e-05;
MatrixB(25,1) = 0.00695674;
MatrixB(26,1) = 1.11081;
MatrixB(27,1) = -1.11055;
MatrixB(28,1) = -0.00528171;
MatrixB(29,1) = 0.00540869;
MatrixB(30,1) = 2.26101;
MatrixB(31,1) = -2.29122;
MatrixB(32,1) = 3.11741e-05;
MatrixB(33,1) = 3.95137e-05;

MatrixC = zeros(2, 33);

MatrixC(1,23) = 1;
MatrixC(2,1) = -1.01113e-12;
MatrixC(2,2) = -6.23222e-13;
MatrixC(2,3) = 14.0593;
MatrixC(2,8) = 12.1992;
MatrixC(2,9) = -12.1992;
MatrixC(2,10) = -0.307489;
MatrixC(2,11) = 0.307489;
MatrixC(2,12) = -39.0169;
MatrixC(2,13) = -39.0242;
MatrixC(2,14) = -36.282;
MatrixC(2,15) = -36.2813;
MatrixC(2,20) = -9.72102e-14;
MatrixC(2,21) = -0.0458194;
MatrixC(2,22) = 1.56567e-14;
MatrixC(2,23) = -0.0240424;
MatrixC(2,24) = -6.31063e-14;
MatrixC(2,25) = -0.00196647;
MatrixC(2,26) = 0.000527001;
MatrixC(2,27) = -0.000527001;
MatrixC(2,28) = -0.000143578;
MatrixC(2,29) = 0.000143578;
MatrixC(2,30) = -0.00490255;
MatrixC(2,31) = 0.00490255;
MatrixC(2,32) = -1.02011e-05;
MatrixC(2,33) = 1.02011e-05;

MatrixD = zeros(2, 1);

MatrixD(2,1) = 0.00676384;
% This data file was originally made by the University of Michigan on Feb. 25, 2005.  
% Updated with new engine data 06/11/2005
% cleaned up by Yukio Watanabe (Mechanical Simulation) on Mar. 9, 2018 

% LIMITS
% UQM's max current is 'adjustable,' above is an estimate
m_min_volts=60;	% minimum voltage for motor/controller set, V

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NIMH battery parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ADVISOR data file:  ESS_NIMH6.m     
ess_description='Spiral Wound NiMH Used in Insight & Japanese hybrid';
% Assume fix temperature of the model
ess_fixtemp=40;
enable_stop=1;

% SOC RANGE over which data is defined (for VOC)
ess_soc=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];  % (--)
% The following data was obtained at 25 deg C.  Assume all values are the
% same for all temperatures (for VOC)
ess_tmp=[0 25];  % (C) place holder for now

% SOC RANGE over which data is defined (for resistance)
ess_soc_res=[0 0.2 0.6 1];  % (--)
% The following data was obtained at 25 deg C.  Assume all values are the
% same for all temperatures (for resistance)
ess_tmp_res=[0 25 45];  % (C) place holder for now

% LOSS AND EFFICIENCY parameters (from ESS_hybrid_pack) 
% Parameters vary by SOC horizontally, and temperature vertically
% the average of 5 discharge cycles at 6.5A at 25 deg C was 5.995Ah.
% Data (Ah): 6.030 5.973 5.990 5.989 5.995
ess_max_ah_cap=[6.0 6.0];	% (A*h), max. capacity at 6.5 A, indexed by ess_tmp

% module's resistance to being discharged, indexed by ess_soc and ess_tmp
% The discharge resistance is the average of 4 tests from 10 to 90% soc at the following
%  discharge currents: 6.5, 6.5, 18.5 and 32 Amps
%  The 0 and 100 % soc points were extrapolated
ess_r_dis=[
	0.0754	0.06	0.0538	0.0624
	0.0377	0.03	0.0269	0.0312
    0.0377	0.03	0.0269	0.0312  ]; 

% module's resistance to being charged, indexed by ess_soc and ess_tmp
% The discharge resistance is the average of 4 tests from 10 to 90% soc at the following
%  discharge currents: 5.2, 5.2, 15 and 26 Amps
%  The 0 and 100 % soc points were extrapolated
ess_r_chg=[
    0.047	0.041	0.0396	0.0408
	0.0235	0.0205	0.0198	0.0204
    0.0235	0.0205	0.0198	0.0204  ]; 
   
% module's open-circuit (a.k.a. no-load) voltage, indexed by ess_soc and ess_tmp
ess_voc=[
	7.2370	7.4047	7.5106	7.5873	7.6459	7.6909	7.7294	7.7666	7.8078	7.9143	8.3645
	7.2370	7.4047	7.5106	7.5873	7.6459	7.6909	7.7294	7.7666	7.8078	7.9143	8.3645
];  

% LIMITS (from ESS_hybrid_pack)
ess_min_volts=6;% 1 volt per cell times 6 cells lowest from data was 255V so far 8/26/99
ess_max_volts=9; % 1.5 volts per cell times 6 cells highest from data so far was 361V 8/26/99

% OTHER DATA (from ESS_hybrid_pack except where noted)						
ess_module_num=40;  %20 modules in INSIGHT pack, 40 modules in hybrid Pack
ess_cap_scale=1; % scale factor for module max ah capacity





% This initialization file was originally made by the University of Michigan 
% on Feb. 25, 2005.  

% For rule based control

clear all;			% Initialize workspace

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load initialization data file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ev_battery_data;
disp('Data loaded sucessfully!');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Simulation initial conditions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ess_init_soc=0.6;   %initial battery state of charge (1.0 = 100% charge)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BATTERY CONTROL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SOC boundaries
high_soc=0.75;  % highest desired battery state of charge
low_soc=0.50;   % below this value, the engine must be on and charge
stop_soc=0.45;  % lowest desired battery state of charge, avoid reaching this point
regstop_soc=0.8;  % reach this point, regenerative brake will stop
soc_control=0.55;   % for charging mode control
target_soc=0.6; % try to maintain the soc 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation and Results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time_step = 0.025;  %Time step for plot
%sim('hybrid1.mdl');
%display('Simulation completed!');
%hybrid1_sim_plot;
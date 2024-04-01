close all;
clc;
clear;

%% Simulation Details
disp("Welcome to Comparison of Wireless Sensor Simulation");
disp("............................................................");
disp("............................................................");
pause(3)

names = {'MRMS-C', 'RMMS',  'PPCM'};
files = {'sim_results_predicted_mobile_sink.mat', 'sim_results_random_mobility.mat', 'sim_results_vehicular_mobility_static_SN.mat'};

container_maps = cell(1, length(names));
container_maps(:) = {containers.Map()};

file_names = containers.Map(names, files);
rounds_vals = containers.Map(names, container_maps);
sim_vals_summed = containers.Map(names, container_maps);

%% Load Saved Values for Comparison

disp("Loading Saved Values");
disp("Start");
disp("............................................................");
pause(1)

for file_name = keys(file_names)
    load(file_names(char(file_name)));
    rounds_vals(char(file_name)) = rounds;
    sim_vals_summed(char(file_name)) = sim_params;
    clear file_name SN rounds sim_params dims
end

disp("End");
pause(1)

%% Data Visualisation for Summed Data

disp("Visualization for Summed Data");
disp("Start");
disp("............................................................");
pause(1)

figure_num = 0;
figure_num = plot_data_summed(figure_num, file_names, rounds_vals, sim_vals_summed);

disp("End");
pause(1)

%% Convert Summed Data to Per Round Data
sim_vals_per_round = convert_summed_to_per_round(sim_vals_summed);

%% Data Visualisation for Per Round Data

disp("Visualization for Per Round Data");
disp("Start");
disp("............................................................");
pause(1)

[~] = plot_data_per_round(figure_num, file_names, rounds_vals, sim_vals_per_round);

disp("End");
pause(1)
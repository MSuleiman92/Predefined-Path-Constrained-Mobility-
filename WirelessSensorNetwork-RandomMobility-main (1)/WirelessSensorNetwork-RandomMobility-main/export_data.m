function export_data(SN, rounds, sim_params, dims)
%EXPORT_DATA Summary of this function goes here
%   Detailed explanation goes here

save('sim_results_random_mobility.mat', 'SN', 'rounds', 'sim_params', 'dims')
T = removevars(struct2table(SN.n),{'Xs', 'Ys', 'ALPHAs', 'dnp', 'COLs'});
writetable(T, 'SN_results_random_mobility.xls', 'FileType', 'spreadsheet')

end


function export_data(SN, rounds, sim_params, dims)
%EXPORT_DATA Summary of this function goes here
%   Detailed explanation goes here

save('sim_results_predicted_mobile_sink.mat', 'SN', 'rounds', 'sim_params', 'dims')
T = removevars(struct2table(SN.n),{'Xs', 'Ys', 'ALPHAs', 'dnp', 'COLs'});
writetable(T, 'SN_results_predicted_mobile_sink.xls', 'FileType', 'spreadsheet')

end


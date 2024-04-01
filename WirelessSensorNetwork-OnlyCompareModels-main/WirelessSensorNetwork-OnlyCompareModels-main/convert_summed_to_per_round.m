function sim_vals_per_round = convert_summed_to_per_round(sim_vals_summed)
%CONVERT_SUMMED_TO_PER_ROUND Summary of this function goes here
%   Detailed explanation goes here

sim_vals_per_round = containers.Map();

for file_name = keys(sim_vals_summed)
    sim_params_summed = sim_vals_summed(char(file_name));
    
    sim_params_per_round = containers.Map();
    for param = keys(sim_params_summed)
        summed_param_vals = sim_params_summed(char(param));
        
        per_round_param_vals = [summed_param_vals(1)];
        for i = 2:length(summed_param_vals)
            per_round_param_vals(i) = summed_param_vals(i) - summed_param_vals(i - 1);
        end
        
        sim_params_per_round(char(param)) = per_round_param_vals;
    end
    
    sim_vals_per_round(char(file_name)) = sim_params_per_round;
    
end

end


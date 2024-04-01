function figure_num = plot_data_per_round(figure_num, file_names, rounds_vals, sim_vals)
%PLOT_DATA_PER_ROUND Summary of this function goes here
%   Detailed explanation goes here

figure_num = figure_num + 1;
figure(figure_num)

i = 0;
colors = containers.Map( {1, 2, 3, 4, 5, 6, 7}, {'r', 'g', 'b', 'k', 'm', 'y', 'c'} );
for param = ["dead nodes", "total energy", "packets", "contact time", "interconnect time"]
    i = i + 1;
    subplot(2, 3, i)
       
    color_num = 0;
    for file_name = keys(file_names)
        sim_params = sim_vals(char(file_name));
        rounds = rounds_vals(char(file_name));
        
        color_num = color_num + 1;
        %scatter(1:rounds, sim_params(char(param)), 'LineWidth', 1, 'MarkerEdgeColor', colors(color_num));
        plot(1:rounds, sim_params(char(param)), colors(color_num), 'Linewidth', 1);
        hold on
    end
    
    xlim([0 rounds]);
    axis tight
    title( [capitalize(param) + ' Per Round', 'Against Round'] );
    xlabel 'Rounds';

    ylabel ( capitalize(param) );
    legend(keys(file_names), 'Location', 'best');
    
    hold off;
end

end


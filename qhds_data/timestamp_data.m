
% load data

% zeusing_data = VarName1;
% zeusing_data(:, 2) = VarName5;
% zeusing_data(:, 3) = VarName6;
% 
% t2_data = zeusing_data(:, 3);
% 
% zeusing_stat = mean( t2_data );
% zeusing_stat(:, 2) = std( t2_data);

% xele_data = VarName1;
% xele_data(:, 2) = VarName5;
% xele_data(:, 3) = VarName6;
% 
% t2_data = xele_data(:, 3);
% 
% xele_stat = mean( t2_data );
% xele_stat(:, 2) = std( t2_data);

% up delay analysis
% up_delay(:, 1) = VarName4;
% up_delay(:, 2) = VarName4;
% up_delay(:, 3) = VarName4;


stat_mean_up = mean(up_delay(:, 1));
stat_mean_up(2) = mean(up_delay(:, 2));
stat_mean_up(3) = mean(up_delay(:, 3));

stat_std_up = std(up_delay(:, 1));
stat_std_up(2) = std(up_delay(:, 2));
stat_std_up(3) = std(up_delay(:, 3));

stat_min_up = min(up_delay(:, 1));
stat_min_up(2) = min(up_delay(:, 2));
stat_min_up(3) = min(up_delay(:, 3));

stat_max_up = max(up_delay(:, 1));
stat_max_up(2) = max(up_delay(:, 2));
stat_max_up(3) = max(up_delay(:, 3));
    
% dfittool






% load data
% load multi_sx;
% load tcp_fm1;

multi_timestamp = char(fm1_multi(:, 1));

fm1_tcp_v1_01_timestamp = char(fm1_tcp_v1_01(:, 1));
fm1_tcp_v1_21_timestamp = char(fm1_tcp_v1_21(:, 1));
fm1_tcp_v1_01_multi_timestamp = char(fm1_tcp_v1_01_multi(:, 1));

fm10_tcp_v1_01_timestamp = char(fm10_tcp_v1_01(:, 1));
fm10_tcp_v1_21_timestamp = char(fm10_tcp_v1_21(:, 1));
fm10_tcp_v1_01_multi_timestamp = char(fm10_tcp_v1_01_multi(:, 1));

% common time stamp
common_time_stamp = intersect(fm1_tcp_v1_01_timestamp, fm1_tcp_v1_21_timestamp, 'rows');
common_time_stamp = intersect(fm1_tcp_v1_01_multi_timestamp, common_time_stamp, 'rows');
common_time_stamp = intersect(fm10_tcp_v1_01_timestamp, common_time_stamp, 'rows');
common_time_stamp = intersect(fm10_tcp_v1_21_timestamp, common_time_stamp, 'rows');
common_time_stamp = intersect(fm10_tcp_v1_01_multi_timestamp, common_time_stamp, 'rows');
common_time_stamp = intersect(common_time_stamp, multi_timestamp, 'rows');

% common data rows
multi_delay = find(ismember(multi_timestamp, common_time_stamp, 'rows'));
fm1_tcp_v1_01_delay = find(ismember(fm1_tcp_v1_01_timestamp, common_time_stamp, 'rows'));
fm1_tcp_v1_21_delay = find(ismember(fm1_tcp_v1_21_timestamp, common_time_stamp, 'rows'));
fm1_tcp_v1_01_multi_delay = find(ismember(fm1_tcp_v1_01_multi_timestamp, common_time_stamp, 'rows'));

fm10_tcp_v1_01_delay = find(ismember(fm10_tcp_v1_01_timestamp, common_time_stamp, 'rows'));
fm10_tcp_v1_21_delay = find(ismember(fm10_tcp_v1_21_timestamp, common_time_stamp, 'rows'));
fm10_tcp_v1_01_multi_delay = find(ismember(fm10_tcp_v1_01_multi_timestamp, common_time_stamp, 'rows'));

% construt the result data
result_delay = cell(0);

result_delay(:, 1) = cellstr(common_time_stamp);
% multi sx
result_delay(:, 2) = fm1_multi(multi_delay, 2);

% fm1 tcp v1_01
result_delay(:, 3) = fm1_tcp_v1_01(fm1_tcp_v1_01_delay, 2);

% fm1 tcp v1_21
result_delay(:, 4) = fm1_tcp_v1_21(fm1_tcp_v1_21_delay, 2);

% fm1 tcp v1_01_multi
result_delay(:, 5) = fm1_tcp_v1_01_multi(fm1_tcp_v1_01_multi_delay, 2);

% fm10 tcp v1_01
result_delay(:, 6) = fm10_tcp_v1_01(fm10_tcp_v1_01_delay, 2);

% fm10 tcp v1_21
result_delay(:, 7) = fm10_tcp_v1_21(fm10_tcp_v1_21_delay, 2);

% fm10 tcp v1_01_multi
result_delay(:, 8) = fm10_tcp_v1_01_multi(fm10_tcp_v1_01_multi_delay, 2);

result_relate_delay = [];
for ii=2:8
    result_relate_delay(:, ii-1) = cell2mat(result_delay(:, ii)) - cell2mat(result_delay(:, 2));
end
    





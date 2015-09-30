
% load data
% load xele_net;
% load zeusing_udp;

% xele_net = VarName1;
% xele_net(:, 2) = num2cell(VarName4);

% zeusing_udp = VarName1;
% zeusing_udp(:, 2) = num2cell(VarName4);

xele_net_timestamp = char(xele_net(:, 1));
zeusing_udp_timestamp = char(zeusing_udp(:, 1));
% fm8 tcp v1_01
fm8_v1_01_timestamp = char(fm8_v1_01(:, 1));


% common time stamp
common_time_stamp = intersect(xele_net_timestamp, zeusing_udp_timestamp, 'rows');
common_time_stamp = intersect(fm8_v1_01_timestamp, common_time_stamp, 'rows');


% common data rows
xele_net_delay = find(ismember(xele_net_timestamp, common_time_stamp, 'rows'));
zeusing_udp_delay = find(ismember(zeusing_udp_timestamp, common_time_stamp, 'rows'));

fm8_v1_01_delay = find(ismember(fm8_v1_01_timestamp, common_time_stamp, 'rows'));

% construt the result data
result_delay = cell(0);

result_delay(:, 1) = cellstr(common_time_stamp);
% xele net 
result_delay(:, 2) = xele_net(xele_net_delay, 2);

% zeusing udp 
result_delay(:, 3) = zeusing_udp(zeusing_udp_delay, 2);

% fm8 v1_01 tcp
result_delay(:, 4) = fm8_v1_01(fm8_v1_01_delay, 2);

result_relate_delay = [];
for ii=2:4
    result_relate_delay(:, ii-1) = cell2mat(result_delay(:, ii)) - cell2mat(result_delay(:, 2));
end
    





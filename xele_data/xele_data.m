
% load data
% load xele_net;
% load zeusing_udp;

% xele_net = VarName1;
% xele_net(:, 2) = num2cell(VarName4);

% zeusing_udp = VarName1;
% zeusing_udp(:, 2) = num2cell(VarName4);

xele_net_timestamp = char(xele_net(:, 1));
zeusing_udp_28333_timestamp = char(zeusing_udp_28333(:, 1));
zeusing_udp_28444_timestamp = char(zeusing_udp_28444(:, 1));
zeusing_udp_55521_timestamp = char(zeusing_udp_55521(:, 1));

% fm8_v1_01_timestamp = char(fm8_v1_01(:, 1));


% common time stamp
common_time_stamp = intersect(xele_net_timestamp, zeusing_udp_28333_timestamp, 'rows');
common_time_stamp = intersect(zeusing_udp_28444_timestamp, common_time_stamp, 'rows');
common_time_stamp = intersect(zeusing_udp_55521_timestamp, common_time_stamp, 'rows');

% common_time_stamp = intersect(fm8_v1_01_timestamp, common_time_stamp, 'rows');


% common data rows
xele_net_delay = find(ismember(xele_net_timestamp, common_time_stamp, 'rows'));
zeusing_udp_28333_delay = find(ismember(zeusing_udp_28333_timestamp, common_time_stamp, 'rows'));
zeusing_udp_28444_delay = find(ismember(zeusing_udp_28444_timestamp, common_time_stamp, 'rows'));
zeusing_udp_55521_delay = find(ismember(zeusing_udp_55521_timestamp, common_time_stamp, 'rows'));

% fm8_v1_01_delay = find(ismember(fm8_v1_01_timestamp, common_time_stamp, 'rows'));

% construt the result data
result_delay = cell(0);

result_delay(:, 1) = cellstr(common_time_stamp);
% xele net 
result_delay(:, 2) = xele_net(xele_net_delay, 2);

% zeusing udp 28333
result_delay(:, 3) = zeusing_udp_28333(zeusing_udp_28333_delay, 2);

% zeusing udp 28444
result_delay(:, 4) = zeusing_udp_28444(zeusing_udp_28444_delay, 2);

% zeusing udp 55521
result_delay(:, 5) = zeusing_udp_55521(zeusing_udp_55521_delay, 2);

% fm8 v1_01 tcp
% result_delay(:, 4) = fm8_v1_01(fm8_v1_01_delay, 2);

result_relate_delay = [];
for ii=2:5
    result_relate_delay(:, ii-1) = cell2mat(result_delay(:, ii)) - cell2mat(result_delay(:, 2));
end
    





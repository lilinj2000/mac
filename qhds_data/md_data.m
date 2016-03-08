
% load data
% load xele_net;
% load zeusing_udp;

% xele_32002 = VarName1;
% xele_32002(:, 2) = num2cell(VarName4);

% slash_30100 = VarName1;
% slash_30100(:, 2) = num2cell(VarName4);

% xele_32004 = VarName1;
% xele_32004(:, 2) = num2cell(VarName4);

% zeusing_12313 = VarName1;
% zeusing_12313(:, 2) = num2cell(VarName4);

% zeusing_12345 = VarName1;
% zeusing_12345(:, 2) = num2cell(VarName4);

% ctp1_multi = VarName1;
% ctp1_multi(:, 2) = num2cell(VarName4);

% ctp1_tcp = VarName1;
% ctp1_tcp(:, 2) = num2cell(VarName4);

% ctp1_udp = VarName1;
% ctp1_udp(:, 2) = num2cell(VarName4);

% ctp5_multi = VarName1;
% ctp5_multi(:, 2) = num2cell(VarName4);

% ctp5_tcp = VarName1;
% ctp5_tcp(:, 2) = num2cell(VarName4);

% ctp5_udp = VarName1;
% ctp5_udp(:, 2) = num2cell(VarName4);


xele_32002_timestamp = char(xele_32002(:, 1));
slash_30100_timestamp = char(slash_30100(:, 1));

% xele_32004_timestamp = char(xele_32004(:, 1));
% zeusing_12313_timestamp = char(zeusing_12313(:, 1));
% zeusing_12345_timestamp = char(zeusing_12345(:, 1));
% ctp1_multi_timestamp = char(ctp1_multi(:,1));
% ctp1_tcp_timestamp = char(ctp1_tcp(:,1));
% ctp1_udp_timestamp = char(ctp1_udp(:,1));
% ctp5_multi_timestamp = char(ctp5_multi(:,1));
% ctp5_tcp_timestamp = char(ctp5_tcp(:,1));
% ctp5_udp_timestamp = char(ctp5_udp(:,1));

% common time stamp
common_time_stamp = intersect(xele_32002_timestamp, slash_30100_timestamp, 'rows');

% common_time_stamp = intersect(zeusing_12313_timestamp, common_time_stamp, 'rows');
% common_time_stamp = intersect(zeusing_12345_timestamp, common_time_stamp, 'rows');
% 
% common_time_stamp = intersect(ctp1_multi_timestamp, common_time_stamp, 'rows');
% common_time_stamp = intersect(ctp1_tcp_timestamp, common_time_stamp, 'rows');
% common_time_stamp = intersect(ctp1_udp_timestamp, common_time_stamp, 'rows');
% 
% common_time_stamp = intersect(ctp5_multi_timestamp, common_time_stamp, 'rows');
% common_time_stamp = intersect(ctp5_tcp_timestamp, common_time_stamp, 'rows');
% common_time_stamp = intersect(ctp5_udp_timestamp, common_time_stamp, 'rows');


% common data rows
xele_32002_delay = find(ismember(xele_32002_timestamp, common_time_stamp, 'rows'));
slash_30100_delay = find(ismember(slash_30100_timestamp, common_time_stamp, 'rows'));
% xele_32004_delay = find(ismember(xele_32004_timestamp, common_time_stamp, 'rows'));
% zeusing_12313_delay = find(ismember(zeusing_12313_timestamp, common_time_stamp, 'rows'));
% zeusing_12345_delay = find(ismember(zeusing_12345_timestamp, common_time_stamp, 'rows'));

% ctp1_multi_delay = find(ismember(ctp1_multi_timestamp, common_time_stamp, 'rows'));
% ctp1_tcp_delay = find(ismember(ctp1_tcp_timestamp, common_time_stamp, 'rows'));
% ctp1_udp_delay = find(ismember(ctp1_udp_timestamp, common_time_stamp, 'rows'));
% 
% ctp5_multi_delay = find(ismember(ctp5_multi_timestamp, common_time_stamp, 'rows'));
% ctp5_tcp_delay = find(ismember(ctp5_tcp_timestamp, common_time_stamp, 'rows'));
% ctp5_udp_delay = find(ismember(ctp5_udp_timestamp, common_time_stamp, 'rows'));


% construt the result data
result_delay = cell(0);

result_delay(:, 1) = cellstr(common_time_stamp);
% xele_32002 net 
result_delay(:, 2) = xele_32002(xele_32002_delay, 2);

% slash_30100  
result_delay(:, 3) = slash_30100(slash_30100_delay, 2);

% xele_32004
% result_delay(:, 3) = xele_32004(xele_32004_delay, 2);

% zeusing_12313
% result_delay(:, 4) = zeusing_12313(zeusing_12313_delay, 2);

% zeusing_12345
% result_delay(:, 5) = zeusing_12345(zeusing_12345_delay, 2);

% ctp1_multi
% result_delay(:, 6) = ctp1_multi(ctp1_multi_delay, 2);

% ctp1_tcp
% result_delay(:, 7) = ctp1_tcp(ctp1_tcp_delay, 2);

% ctp1_udp
% result_delay(:, 8) = ctp1_udp(ctp1_udp_delay, 2);

% ctp5_multi
% result_delay(:, 9) = ctp5_multi(ctp5_multi_delay, 2);

% ctp5_tcp
% result_delay(:, 10) = ctp5_tcp(ctp5_tcp_delay, 2);

% ctp5_udp
% result_delay(:, 11) = ctp5_udp(ctp5_udp_delay, 2);

result_relate_delay = [];
for ii=2:3
    result_relate_delay(:, ii-1) = cell2mat(result_delay(:, ii)) - cell2mat(result_delay(:, 2));
end

for ii=2:2
    result_std(ii-1) = std(result_relate_delay(:, ii));
    result_mean(ii-1) = mean(result_relate_delay(:, ii));
end
    
% dfittool





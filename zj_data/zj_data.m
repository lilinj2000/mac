
% load data
% load xele_net;
% load zeusing_udp;

% xele_32003 = VarName1;
% xele_32003(:, 2) = num2cell(VarName4);

% xele_32004 = VarName1;
% xele_32004(:, 2) = num2cell(VarName4);

% zeusing_12313 = VarName1;
% zeusing_12313(:, 2) = num2cell(VarName4);

% zeusing_12345 = VarName1;
% zeusing_12345(:, 2) = num2cell(VarName4);


xele_32003_timestamp = char(xele_32003(:, 1));
xele_32004_timestamp = char(xele_32004(:, 1));
zeusing_12313_timestamp = char(zeusing_12313(:, 1));
zeusing_12345_timestamp = char(zeusing_12345(:, 1));

% common time stamp
common_time_stamp = intersect(xele_32003_timestamp, xele_32004_timestamp, 'rows');
common_time_stamp = intersect(zeusing_12313_timestamp, common_time_stamp, 'rows');
common_time_stamp = intersect(zeusing_12345_timestamp, common_time_stamp, 'rows');


% common data rows
xele_32003_delay = find(ismember(xele_32003_timestamp, common_time_stamp, 'rows'));
xele_32004_delay = find(ismember(xele_32004_timestamp, common_time_stamp, 'rows'));
zeusing_12313_delay = find(ismember(zeusing_12313_timestamp, common_time_stamp, 'rows'));
zeusing_12345_delay = find(ismember(zeusing_12345_timestamp, common_time_stamp, 'rows'));


% construt the result data
result_delay = cell(0);

result_delay(:, 1) = cellstr(common_time_stamp);
% xele_32003 net 
result_delay(:, 2) = xele_32003(xele_32003_delay, 2);

% xele_32004
result_delay(:, 3) = xele_32004(xele_32004_delay, 2);

% zeusing_12313
result_delay(:, 4) = zeusing_12313(zeusing_12313_delay, 2);

% zeusing_12345
result_delay(:, 5) = zeusing_12345(zeusing_12345_delay, 2);

result_relate_delay = [];
for ii=2:5
    result_relate_delay(:, ii-1) = cell2mat(result_delay(:, ii)) - cell2mat(result_delay(:, 2));
end

for ii=2:4
    result_std(ii-1) = std(result_relate_delay(:, ii));
    result_mean(ii-1) = mean(result_relate_delay(:, ii));
end
    
% dfittool





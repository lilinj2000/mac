function [ timestamp ] = fetchTimeStamp( source_data )
%FETCHTIMESTAMP fetch the timestamp
%   �˴���ʾ��ϸ˵��

% convert the timestamp to vec
% 1) convert time
timestamp = char(source_data(:, 1));
% 2) convert the milli second
ms = cellfun(@(x) num2str(x, '%03d'), source_data(:, 2), 'UniformOutput', false);
ms = char(ms);
% 3) concat the timestamp
timestamp = strcat(timestamp, '.', ms);

end


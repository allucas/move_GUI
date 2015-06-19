function [ timeVector ] = kin2acc( timeStamp )
% Y:M:D:H:M:S:MS
timeChange = 0;
year = '';
month = '';
day = '';
hour = '';
minute = '';
second = '';
[year, rest] = strtok(timeStamp,':');
[month, rest] = strtok(rest(2:end),':');
[day, rest] = strtok(rest(2:end),':');
[hour, rest] = strtok(rest(2:end),':');
[minute, rest] = strtok(rest(2:end),':');
[second, rest] = strtok(rest(2:end),':');

if str2num(rest(2)) >= 5
    second = num2str((str2num(second) + 1));
end

if ~(timeChange == 0)
    if hour < timeChange 
        day = str2num(day) - 1;
        day = num2str(day);
        hour = (str2num(hour) - timeChange) + 24;
        hour = num2str(hour);
    else
        hour = str2num(hour) - timeChange;
        hour = num2str(hour);
    end

end

timeVector = [str2num(year),str2num(month),str2num(day),str2num(hour)...
    ,str2num(minute),str2num(second)];



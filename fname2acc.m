function [ fnameV ] = fname2acc( fname )
%Convert folder name into a date vector
[year,month] = strtok(fname,'.');
[month,day] = strtok(month(2:end),'.');
[day,hour] = strtok(day(2:end),'.');
[hour,minute] = strtok(hour(2:end),'.');
[minute,second] = strtok(minute(2:end),'.');
second = second(2:end);

fnameV = [str2num(year),str2num(month),str2num(day),str2num(hour),str2num(minute),...
    str2num(second)];

end


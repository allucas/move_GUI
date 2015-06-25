function [ diff ] = timeDiff(t1,t2) 
% 1:42 p.m.
% Find the time difference between two time vectors t1 MUST be the latter
% time
% The output is in seconds

if (datenum(t1) > datenum(t2)) && (t2(1,4) ~= 0) 
    if t1(1,4) == 0
        t1(1,4) = 24;
    end
end

diff = abs((t1(1,4)*3600) + t1(1,5)*60 + t1(1,6)) - ((t2(1,4)*3600) + (t2(1,5)*60) + t2(1,6));

end


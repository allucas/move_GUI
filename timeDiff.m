function [ diff ] = timeDiff(t1,t2) 
% Find the time difference between two time vectors t1 MUST be the latter
% time
% The output is in seconds

if t1(1,4) == 0
    t1(1,4) = 24;
end


if ~(t1(1,4) == t2(1,4))
    
    min = (t1(1,5) - t2(1,5)) + 60;

else
    
    min = (t1(1,5) - t2(1,5));

end

if (t1(1,6) - t2(1,6)) < 0 
    
    sec = t1(1,6) - t2(1,6) + 60;
    min = min - 1;
    
else
    
    sec = t1(1,6) - t2(1,6);

end

    diff = min*60 + sec;

end


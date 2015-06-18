function [ changedTime ] = hourChange( timeVec, t )
%Changes the hour from an input in the datevec format

if (timeVec(1,4) + t) >= 24
    timeVec(1,3) = timeVec(1,3) + 1;
    timeVec(1,4) = timeVec(1,4) + t - 24;

elseif (timeVec(1,4) + t) < 0
    timeVec(1,3) = timeVec(1,3) - 1;
    timeVec(1,4) = timeVec(1,4) + t + 24;

else 
    timeVec(1,4) = timeVec(1,4) + t;
    
end

changedTime = timeVec;

end


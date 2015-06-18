function [kinectTime] = acc2kinV(timeVec, t)
% Goes from Accelerometer time, to Kinect time 

kinectTime = {};

% Seconds and Milliseconds

    timeStr = num2str(timeVec(1,6));
    [second, milli]= strtok(timeStr,'.');
    milli = milli(2:end-1);

    if numel(milli) == 0
        milli = ['000'];
    elseif numel(milli) == 2
        milli = [milli,'0'];
    elseif numel(milli) == 1
        milli = [milli,'00'];
    end
    
%% Add or remove time

if (timeVec(1,4) + t) >= 24
    timeVec(1,3) = timeVec(1,3) + 1;
    timeVec(1,4) = timeVec(1,4) + t - 24;

elseif (timeVec(1,4) + t) < 0
    timeVec(1,3) = timeVec(1,3) - 1;
    timeVec(1,4) = timeVec(1,4) + t + 24;

else 
    timeVec(1,4) = timeVec(1,4) + t;
    
end

% Store data into output array

    kinectTime{1,1} = [num2str(timeVec(1,1)),':',num2str(timeVec(1,2)),':',num2str(timeVec(1,3)),...
        ':',num2str(timeVec(1,4)),':',num2str(timeVec(1,5)),':',second,':',milli];


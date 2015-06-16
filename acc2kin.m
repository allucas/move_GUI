function [kinectTime] = acc2kin( timeVec_c )
% Goes from Accelerometer time, to Kinect time
[r,c] = size(timeVec_c);

timeVec_v = [];

kinectTime = {r,1};

for k = 1:r
    timeVec_v(k,:) = timeVec_c{k,1};
end

% Seconds and Milliseconds

for j = 1:r
    timeStr = num2str(timeVec_v(j,6));
    [second, milli]= strtok(timeStr,'.');
    seconds{j} = second;
 
    milli = milli(2:end-1);

    
    millis{j} = milli;
    
end

for i = 1:r
    kinectTime{i,1} = [num2str(timeVec_v(i,1)),':',num2str(timeVec_v(i,2)),':',num2str(timeVec_v(i,3)),...
        ':',num2str(timeVec_v(i,4)),':',num2str(timeVec_v(i,5)),':',seconds{i},':',millis{i}];
end


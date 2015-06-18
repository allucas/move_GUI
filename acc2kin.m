function [kinectTime] = acc2kin( timeVec_c, add_time )
% Goes from Accelerometer time, to Kinect time
[r,c] = size(timeVec_c);

if add_time == 0
    fprintf('No additional time added')
else
    fprintf('Additional time added')
end

timeVec_v = [];

kinectTime = {};

for k = 1:r
    timeVec_v(k,:) = timeVec_c{k,1};
end

% Seconds and Milliseconds

for j = 1:r
    timeStr = num2str(timeVec_v(j,6));
    [second, milli]= strtok(timeStr,'.');
    seconds{j} = second;
 
    milli = milli(2:end-1);

    if numel(milli) == 0
        milli = ['000'];
    elseif numel(milli) == 2
        milli = [milli,'0'];
    elseif numel(milli) == 1
        milli = [milli,'00'];
    end
    
    millis{j} = milli;
    
    
end

for i = 1:r
    kinectTime{i,1} = [num2str(timeVec_v(i,1)),':',num2str(timeVec_v(i,2)),':',num2str(timeVec_v(i,3)),...
        ':',num2str(timeVec_v(i,4)),':',num2str(timeVec_v(i,5)),':',seconds{i},':',millis{i}];
end


clc, clear all;
% Go to events.mat folder
% cd('/Users/AlfredoLucas/Documents/MATLAB/Move_Project/summerStuff/files');
 load events.mat


% For 1 Day

 cd('/Users/AlfredoLucas/Documents/MATLAB/Move_Project/summerStuff/code/move_GUI')

%% Create start-end time cell array 
% Time format: 1-Year, 2-Month, 3-Day, 4-Hour, 5-Minute, 6-Second

% For event start time
[r,c] = size(events{1,1}.st_mat);
for i = 1:r
    TimeStart{i,1} = hourChange(datevec(events{1,1}.st_mat(i)),7);
    TimeStartKin{i,1} = acc2kinV(datevec(events{1,1}.st_mat(i)),7);
end

% For event end time
 for j = 1:r
     TimeStop{j,1} = hourChange(datevec(events{1,1}.ed_mat(j)),7);
     TimeStopKin{j,1} = acc2kinV(datevec(events{1,1}.ed_mat(j)),7);
 end
 
 % Make a list of the hours (day, hour, number of events)
 
 
 ii = 1;
 
 hr_list(1,1) = TimeStart{1}(3);
 hr_list(1,2) = TimeStart{1}(4);
 
 for k = 2:r
     if TimeStart{k-1}(4) == TimeStart{k}(4)
     else
         hr_list(ii,1) = TimeStart{k}(3);
         hr_list(ii,2) = TimeStart{k}(4);
         ii = ii + 1;
     end
 end


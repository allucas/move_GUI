% Go to events folder
% cd('/Users/AlfredoLucas/Documents/MATLAB/Move_Project/summerStuff/files');
% load events.mat


% For 1 Day

% cd('/Users/AlfredoLucas/Documents/MATLAB/Move_Project/summerStuff/code/move_GUI')

%% Create start-end time cell array 

kinTimeStart = {};
kinTimeStop = {};

% For event start time
[r,c] = size(events{1,1}.st_mat);
for i = 1:r
    Time{i,1} = datevec(events{1,1}.st_mat(i));
end
kinTimeStart = acc2kin(Time);

% For event end time
 for j = 1:r
     Time2{j,1} = datevec(events{1,1}.ed_mat(j));
 end
 kinTimeStop = acc2kin(Time2);
 
 timeCell = {kinTimeStart, kinTimeStop};

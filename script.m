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
 hr_list(1,3) = 1;
 count = 1;
 for k = 2:r
     if TimeStart{k-1}(4) == TimeStart{k}(4)
         count = count + 1;
         hr_list(ii,3) = count;
     else
         if count == 1
             hr_list(ii,3) = 1;
         end
         ii = ii + 1;
         hr_list(ii,1) = TimeStart{k}(3);
         hr_list(ii,2) = TimeStart{k}(4);
         count = 1;
     end
 end

%% Make a string with the day and hour in order to access the folder

[rr,cc] = size(hr_list);
fName = {};
for jj = 1:rr
    fName{jj} = [num2str(hr_list(jj,1)),'.',num2str(hr_list(jj,2))];
end

%Maybe start a for loop here for different videos in different folders

%% Go to the folder with the specified date

folderName = ['*',fName{3},'*'];
folderName = dir(folderName);
folderName = folderName.name;
cd(folderName);

%% Read Timestamp file
fid = fopen('PCTimeStamp_thread.txt');

timeStamp = {};
counter = 1;
if fid < 0
    fprintf('Error opening file')
else
    while ~(feof(fid))
        line = fgetl(fid);
        [s,rest] = strtok(line,',');
        [p,rest] = strtok(rest(2:end),',');
        timeStamp{counter} = rest(3:end);
        counter = counter + 1;
    end 
end

fclose(fid);

%% Make the timestamps go from kinect 

startTime = kin2acc(timeStamp{1});


%%
frameRate = 15;
oneS = hourChange(datevec(events{1,1}.st_mat(50)),7);
oneE = hourChange(datevec(events{1,1}.ed_mat(50)),7);
two = fname2acc(folderName);

eStartFrame = timeDiff(oneS,two)*frameRate;
eEndFrame = timeDiff(oneE,two)*frameRate;

loops = round(abs(eStartFrame - eEndFrame));

%% Video object, for reference check: http://www.mathworks.com/help/matlab/import_export/read-video-files.html

vidObj = VideoReader('out.mp4');
vidHeight = vidObj.Height;
vidWidth = vidObj.Width;
s = struct('cdata',zeros(vidHeight,vidWidth,'uint8'),'colormap',[]); %Matlab movie structure
frames = get(vidObj,'NumberOfFrames');
kk = 1;


  for kk = 1:loops
      s(kk).cdata = read(vidObj, eStartFrame + kk);
  end
  
%% Main loop
load folders.mat
[rF,cF] = size(folders);
i = 0;
j = 0;
for i = 1:r
    for j = 1:rF
        nameOfFolder = fname2acc(folders(j).name);
        if (datenum(nameOfFolder) > datenum(TimeStart{i}))
        elseif ((timeDiff(TimeStart{i},nameOfFolder)) < 3600)...
                && (TimeStart{i}(3) == nameOfFolder(3))
            fprintf('This is the folder: '); folders(j).name
            fprintf(' For this timestamp: '); TimeStart{i}
            input('\n Press enter to continue \n')
        end
    end
    fprintf('No more folders... \n')
end


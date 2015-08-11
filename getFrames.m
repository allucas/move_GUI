function [ s ] = getFrames( startE, endE, extraSeconds )
%getFrames: Creates a matlab video structure with the appropiate frames
%between the start and end event timestamp in the datevec format. 
%The extra seconds are added to the beginning and the end of the event.

load folders.mat
[rF,cF] = size(folders);
i = 0;
j = 0;
startFrame = 0;
endFrame = 0;
frameDiff = 0;
frameRate = 15;
extraFrames = 2*(extraSeconds*frameRate);

for j = 1:rF
        
        nameOfFolder = fname2acc(folders(j).name);
        
        if (datenum(nameOfFolder) > datenum(startE))
            
        elseif ((timeDiff(startE,nameOfFolder)) < 3610)...
                && ((startE(3) == nameOfFolder(3))||...
                ((startE(3) ~=  nameOfFolder(3)) && ((startE(4) == 0) && (nameOfFolder(4) == 23))))
            
            temp = acc2kinV(startE,0);
            % fprintf('Folder: %s Timestamp: %s \n',folders(j).name, temp);
            
            %Set parameters
            startFrame = timeDiff(startE,nameOfFolder)*frameRate;
            endFrame = timeDiff(endE,nameOfFolder)*frameRate;
            frameDiff = round(endFrame - startFrame);
            
            %Go to folder
             % Use this: cd(['/net/expData/Move/Patient_Data/Patient1/IR/',folders(j).name])
             % cd(folders(j).name)
            cd(['/Volumes/net/expData/Move/Patient_Data/Patient1/IR/',folders(j).name])
            % Load Video object
            vidObj = VideoReader('out.mp4');
            vidHeight = vidObj.Height;
            vidWidth = vidObj.Width;
            s = struct('cdata',zeros(vidHeight,vidWidth,'uint8'),'colormap',[]); %Matlab movie structure
          
            for kk = 1:(frameDiff + extraFrames)
                s(kk).cdata = read(vidObj, (startFrame - (extraFrames/2)) + kk);
            end
            
        end
end


end


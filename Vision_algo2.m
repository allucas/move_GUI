%% Vision Algorithm
clc, clear all;

%% Create Background

% Load Video object
            vidObj = VideoReader('out.mp4');
            vidHeight = vidObj.Height;
            vidWidth = vidObj.Width;
            s = struct('cdata',zeros(vidHeight,vidWidth,1,'double'),'colormap',[]); %Matlab movie structure
            c = struct('cdata',zeros(vidHeight,vidWidth,1,'double'),'colormap',[]); %Matlab movie structure
            starts = 1;
            ends = 100;
            ends2 = 600;
            tic
            for kk = starts:ends
                s(kk-(starts-1)).cdata = read(vidObj, kk);
            end
            
%             for l = ends:ends2
%                 c(kk-(starts-1)).cdata = read(vidObj, kk);
%             end
            toc
            %% Create difference frame
            [r,c] = size(s);
            diff = struct('cdata',zeros(vidHeight,vidWidth,1,'uint8'),'colormap',[]);
            for ii = 1:c
                if (ii + 1) <= c
                    diff(ii).cdata = abs(s((ii + 1)).cdata(:,:,1) - s(100).cdata(:,:,1));
                else
                end
            end
        [temp,frames] = size(diff);
        
        tic
            for i = 245:370
                for j = 1:465
                    for k = 1:frames
                        if diff(k).cdata(i,j,1) > 25
                            diff(k).cdata(i,j,1) = 255;
                        else
                            diff(k).cdata(i,j,1) = 0;
                        end
                    end
                end
            end
            someone = 0;
            for kk = 1:frames
                if sum(sum(diff(kk).cdata(245:370,1:465,1))) > 200000;
                    someone = 1;
                    break
                end
            end
           toc 

            
            % cdata(245:370,1:465,1)
            
            
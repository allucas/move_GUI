[r,c] = size(events);

for i = 1:r
    for j = 1:c
        [rr,cc] = size(events{i,j}.st_mat);
        analyzed_mat{i,j} = zeros(rr,cc);
    end
end

save('someone_mat.mat','someone_mat');
function skin = get_skin(Image,Ground_Truth)
%BrightFactor = 1.0;
l = 1551894;
skin = zeros(l,2);
cnt = 1;
[~,img_num] = size(Image);
for i = 1:img_num
    image = cell2mat(Image(1,i));
    
    image = rgb2ycbcr(image);
    ground = cell2mat(Ground_Truth(1,i));
    ground = ground(:,:,1);
    [N,M] = size(ground);
    for n = 1:N
        for m = 1:M
           if(ground(n,m) == 255)
                skin(cnt,:) = image(n,m,2:3);
                cnt = cnt + 1;
           end
        end
    end
    
end
end
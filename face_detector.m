function  [p_image] = face_processor(image,MU,SIGMA)

scale = 100;
B=[0 1 0
   1 1 1
   0 1 0];
 n_time = 1;

[N,M,~] = size(image); 

    imshow(image);    
    image = rgb2ycbcr(image);
    temp = reshape(image(:,:,2:3),N*M,2);
    p_image = mvnpdf(double(temp),MU,SIGMA)*scale;
    p_image = reshape(p_image,N,M);
    p_image = imbinarize(p_image,'global');
    
    %optimization2
    %se1=strel('disk',1);%这里是创建一个半径为5的平坦型圆盘结构元素
    %p_image=imerode(p_image,se1);
    
    %optimization 1
    for time = 1:n_time
        p_image=imdilate(p_image,B);
    end
end
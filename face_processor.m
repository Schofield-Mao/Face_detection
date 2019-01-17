function p_image = face_processor(image)
 %load mu & sigma of skin gaussian
    MU = load('data/MU');
    MU = MU.MU;
    SIGMA = load('data/SIGMA');
    SIGMA = SIGMA.SIGMA;
    [N,M,~] = size(image);  

    %adjust the intesity of light of image
    BrightFactor = 1;
    image = Bright_image(image,BrightFactor);

    %binarize the original image
    scale = 100;
    image = rgb2ycbcr(image);
    temp = reshape(image(:,:,2:3),N*M,2);
    p_image = mvnpdf(double(temp),MU,SIGMA)*scale;
    p_image = reshape(p_image,N,M);
    p_image = imbinarize(p_image,'global');
    
    %optimization2：erode
     se1=strel('disk',1);%这里是创建一个半径为5的平坦型圆盘结构元素
     p_image=imerode(p_image,se1);
    
    %optimization1:dilate
      n_time = 2;
      B=[0 1 0
         1 1 1
         0 1 0];
     for time = 1:n_time
         p_image=imdilate(p_image,B);
     end
end
%% load data
[Image,Ground_Truth] = load_data();

%% get skin
skin = get_skin(Image,Ground_Truth);


MU1 = mean(skin(:,1));
VAR = cov(skin(:,1));
MU2 = mean(skin(:,2));
VAR = cov(skin(:,2));
SIGMA = cov(skin);
MU = mean(skin);
%% fit normal distribution
BrightFactor = 1;
image = imread('test.jpg');
image = imresize(image,0.5);
Ima_hsv = rgb2hsv( image ); %图片的颜色空间转换 
Ima_hsv( : , : , 3 ) = Ima_hsv( : , : , 3 ) * BrightFactor;
image = uint8(hsv2rgb( Ima_hsv )*255); % hsv => rgb
    
p_img = face_detector(image,MU,SIGMA);
[m,n] = size(p_img);



subplot(2,1,2)
imshow(image);
 [x,y,w,h,cnt,flag] = boxsanner(p_img);
 for i = 1:cnt-1
 diff(i);

 if(flag(i) == 1)
 rectangle('Position',[y(i)-w(i)/2,x(i)-h(i)/2,w(i),h(i)],'LineWidth',2,'EdgeColor','r');
 end
 end

 subplot(2,1,1)
imshow(p_img);

 for i = 1:cnt-1
  diff(i);
 if(flag(i) == 1)
 rectangle('Position',[y(i)-w(i)/2,x(i)-h(i)/2,w(i),h(i)],'LineWidth',2,'EdgeColor','r');
 end
 end
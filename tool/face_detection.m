%% load data
%[Image,Ground_Truth] = load_data();

%% get skin
skin = load('data/skin');%get_skin(Image,Ground_Truth);
skin = skin.skin;
SIGMA = cov(skin);
MU = mean(skin);


%% fit normal distribution
BrightFactor = 1.0;
image = imread('test.jpg');
image = imresize(image,0.5);
image = Bright_image(image,BrightFactor);


subplot(2,1,2)
imshow(image);
 [x,y,w,h,cnt,flag] = face_detector(image);
 for i = 1:cnt-1
 rectangle('Position',[y(i)-w(i)/2,x(i)-h(i)/2,w(i),h(i)],'LineWidth',2,'EdgeColor','r');
 end

 subplot(2,1,1)
imshow(p_img);

 for i = 1:cnt-1
 rectangle('Position',[y(i)-w(i)/2,x(i)-h(i)/2,w(i),h(i)],'LineWidth',2,'EdgeColor','r');
 end
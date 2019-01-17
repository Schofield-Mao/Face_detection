addpath('./tool')
%% fit normal distribution
image = imread('test.jpg');%load image
image = imresize(image,[300,400]);%resize the image


%draw result
imshow(image);
[x,y,w,h,cnt] = face_detector(image);
for i = 1:cnt
    rectangle('Position',[y(i)-w(i)/2,x(i)-h(i)/2,w(i),h(i)],'LineWidth',2,'EdgeColor','r');
end
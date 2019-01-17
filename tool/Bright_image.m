function image = Bright_image(image,BrightFactor)
Ima_hsv = rgb2hsv( image ); %图片的颜色空间转换 
Ima_hsv( : , : , 3 ) = Ima_hsv( : , : , 3 ) * BrightFactor;
image = uint8(hsv2rgb( Ima_hsv )*255); % hsv => rgb
end
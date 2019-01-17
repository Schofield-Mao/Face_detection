temp = p;
for i = 1:10
I=imrotate(p,-5+i,'bilinear','crop');
temp = temp+I;
end
temp = temp /10;
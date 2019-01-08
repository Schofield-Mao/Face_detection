function [x,y,w,h,cnt,flag] = boxsanner(image)
h_min = 70;
h_max = 100;

parm = 0.35;
x = zeros(100,1);
y = zeros(100,1);
flag = zeros(100,1);
h = zeros(100,1);
w = zeros(100,1);
cnt = 1;
[m,n] = size(image);

for H = h_min:4:h_max
    W =  round(H*0.8);
    area = W*H;
    for i = H/2+1:4:m-H/2+1
        for j = W/2+1:4:n-W/2+1
            temp = image(i-H/2:i+H/2-1,j-W/2:j+W/2-1);
            s1 = sum(sum(temp));
            s2 = sum(temp(1,:))+sum(temp(:,1))+sum(temp(H,:))+sum(temp(:,W));
            if(abs(s1/area-parm) < 0.01 && s2 <= (W+W+H+H)/10)         
                x(cnt) = i;
                y(cnt) = j;
                w(cnt) = W;
                h(cnt) = H;
                cnt = cnt + 1;
            end
        end
    end
end

for i = 1:cnt-1
    flag(i) = 1;
    for j = i+1:cnt-1
        if(abs(x(i)-x(j))<w(i)*0.6 && abs(y(i)-y(j))<h(i)*0.6)
           flag(i) = 0;
        end
    end
end

end
function [X,Y,W,H,c] = boxsanner(image,face_pattern)

%limit£ºdefine dissimilarrity:H*W*limit the between face pattern and real face
limit = 0.26;

    %define the range of box size
    h_min = 30;
    h_max = 90;

    %coordinate of box
    x = zeros(100,1);
    y = zeros(100,1);

    %box valid?
    flag = ones(100,1);

    %size of box
    h = zeros(100,1);
    w = zeros(100,1);
    
    %valid box counter
    cnt = 0;
    
    [m,n] = size(image);

for H = h_min:4:h_max%range the box on step 4
    W =  round(H*0.8);%define the ratio between H & W
    pattern = imresize(face_pattern,[H,W]);%resize pattern
    for i = H/2+1:4:m-H/2+1%scan hight on step 4
        for j = W/2+1:4:n-W/2+1%scan width on step 4
            temp = image(i-H/2:i+H/2-1,j-W/2:j+W/2-1);%get window
            difference = sum(sum(abs(pattern-temp)));%get difference
            if(difference<H*W*limit)%get 0.24 by adjustment   
                %if valid, record information
                cnt = cnt + 1;
                x(cnt) = i;
                y(cnt) = j;
                w(cnt) = W;
                h(cnt) = H;
            end
        end
    end
end

%delete the window that is too close
for i = 1:cnt
    flag(i) = 1;
    for j = i+1:cnt
        if(abs(x(i)-x(j))<w(i)*0.6 && abs(y(i)-y(j))<h(i)*0.6)
           flag(i) = 0;
        end
    end
end

c = 0;
for i = 1:cnt
    if(flag(i))
      c = c + 1;
      X(c) = x(i);
      Y(c) = y(i);
      H(c) = h(i);
      W(c) = w(i);
    end
end


end
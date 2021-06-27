clc
clear
close all
img=im2double(imread('moon.tif'));
kernel=[1,2,1;2,4,2;1,2,1];
A1=zeros(540,466);
for i=2:539
    for j=2:465
        a=1/16*(img(i-1:i+1,j-1:j+1)).*kernel;
        b=0;
        for k=1:3
            for m=1:3
                b=b+(a(k,m));
            end
        end
        A1(i,j)=(b);
    end
end
figure
imshow(A1)
kernel=[1,1,1;1,1,1;1,1,1];
A2=zeros(540,466);
for i=2:539
    for j=2:465
        a=1/9*(img(i-1:i+1,j-1:j+1)).*kernel;
        b=0;
        for k=1:3
            for m=1:3
                b=b+(a(k,m));
            end
        end
        A2(i,j)=(b);
    end
end
figure
imshow(A2)
%% p4_B
A3=img-A1;
figure(3)
imshow((A3))
A4=img-A2;
figure(4)
imshow(A4)
%g(x,y)=f(x,y)+k*gmask(x,y)
A5=img+(3).*A3;
figure(5)
imshow((A5))
A6=img+(2).*A4;
figure
imshow(A6)

        






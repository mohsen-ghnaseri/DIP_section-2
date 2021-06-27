%% P5_A
clc
close all
clear
I=im2double(imread('bone-scan.tif'));
figure
imshow(I)
A2=0;
A3=zeros(800,500);
for i=2:799
    for j=2:499
        A2(i,j)=I(i,j+1)+I(i,j-1)+I(i+1,j)+I(i-1,j)-4*I(i,j);
        A3(i,j)=A2(i,j);
    end
end
a4=A3-min((min(A3)));
a4=a4/(max(max(a4)));
figure
imshow((a4))
%% P5_B
B=double(I);
C=B-A3;
figure
imshow((C))
%% P5_C
A4=0;
A5=zeros(800,500);
for i=2:799
    for j=2:499
        A4(i,j)=abs(-I(i-1,j+1)-2*I(i+1,j)-I(i-1,j-1)+I(i+1,j+1)...
          +2*I(i+1,j)+I(i+1,j-1))+abs(-I(i-1,j+1)-2*I(i,j+1)-I(i+1,j+1)...
          +I(i-1,j-1)+2*I(i,j-1)+I(i+1,j-1));
        A5(i,j)=A4(i,j);
    end
end
figure
imshow((A5))
%%
A6=A5;
s=5;
for i=3:798
    for j=3:498
        a=0;
        for k=-2:2
            for m=-2:2
                a=a+(A5(i+k,j+m))/(s^2);
            end
        end
        A6(i,j)=a;
    end
end
figure
imshow(A6)
 %% p5_e
 E=C.*A6;

 figure
 imshow(E)
 %% P5_F
 F=E+I;
 figure
 imshow(F)
 %% P5_G
 G=1.5*(F.^.7);
 figure
 imshow(G)
 


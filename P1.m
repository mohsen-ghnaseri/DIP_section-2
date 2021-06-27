clc
close all
clear
A=im2double(imread('spine.tif'));
figure(1)
imshow(A)
%% p1_A

C=1;
A1=C*A.^.6;    
figure(2)
subplot(3,2,1);
imshow(A1);title('gama=.6')
A2=C*A.^.4;  
subplot(3,2,3);
imshow(A2);title('gama=.4')
A3=C*A.^.3;  
subplot(3,2,5);
imshow(A3);title('gama=.3')
subplot(3,2,2);
imhist(A1);title('histogram of image gama=.6')
subplot(3,2,4);
imhist(A2);title('histogram of image gama=.4')
subplot(3,2,6);
imhist(A3);title('histogram of image gama=.3')
    
   
%% p1_B

 B=imread('spine.tif');
 D=double(B);
 figure(3)
 subplot(2,2,1);
 imshow(uint8(D));title('orginal image');
 A4=150*log10(D+1);
 figure(3)
 subplot(2,2,2);
 imshow(uint8(A4));title('C=150');
 A5=90*log10(D+1);
 subplot(2,2,3);
 imshow(uint8(A5));title('C=90');
 A6=60*log10(D+1);
 subplot(2,2,4);
 imshow(uint8(A6));title('C=60');
 figure
 subplot(2,2,1);
 imhist(uint8(D));title('histogram of orginal image')
 subplot(2,2,2);
 imhist(uint8(A4));title('histogram of image C=150')
 subplot(2,2,3);
 imhist(uint8(A5));title('histogram of image C=90')
 subplot(2,2,4);
 imhist(uint8(A6));title('histogram of image C=60')
 %% P1_C
 G=imread('kidney.tif');
 G1=zeros(414,360);
 G2=zeros(414,360);
 for i=1:414
     for j=1:360
         if(160<=G(i,j)&&G(i,j)<=255)
             G1(i,j)=250;
         else
             G1(i,j)=10;
         end
     end
 end
  figure
  imshow(uint8(G1))
 for i=1:414
     for j=1:360
         if(80<=G(i,j)&&G(i,j)<=160)
             G2(i,j)=15;
         else
             G2(i,j)=G(i,j);
         end
     end
 end
 figure
 imshow(uint8(G2))
 %% p1_D
 K=imread('dollar.tif');

 K1=bitget(K,1);
 subplot(3,3,1)
 imshow(logical(K1));title('BIT=1');
 K2=bitget(K,2);
 subplot(3,3,2)
 imshow(logical(K2));title('BIT=2');
 K3=bitget(K,3);
 subplot(3,3,3)
 imshow(logical(K3));title('BIT=3');
 K4=bitget(K,4);
 subplot(3,3,4)
 imshow(logical(K4));title('BIT=4');
 K5=bitget(K,5);
 subplot(3,3,5)
 imshow(logical(K5));title('BIT=5');
 K6=bitget(K,6);
 subplot(3,3,6)
 imshow(logical(K6));title('BIT=6');
 K7=bitget(K,7);
 subplot(3,3,7)
 imshow(logical(K7));title('BIT=7');
 K8=bitget(K,8);
 subplot(3,3,8)
 imshow(logical(K8));title('BIT=8');
 subplot(3,3,9)
 imshow(K);title('orginal image');
 
 
 
 
 
 
 
 
 
 
 
    
    

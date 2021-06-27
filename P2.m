%% p2_A
clc
close all
clear
A1=imread('road1.jpg');
A2=imread('road2.jpg');
A3=imread('road3.jpg');
A4=zeros(1,256);
A5=zeros(1,256);
A6=zeros(1,256);
for k=0:255
    for i=1:450
        for j=1:800
            if(A1(i,j)==k)
                A4(k+1)=A4(k+1)+1;
            end
        end
    end
end
A4=A4/(size(A1,1)*size(A1,2));

bar(0:255,A4,'FaceColor',[0 .8 .4])
xlim([0 255])
ylim([0 max(A4)])
figure
%%
for G=0:255
    for i=1:480
        for j=1:640
            if(A2(i,j)==G)
                A5(G+1)=A5(G+1)+1;
            end
        end
    end
end
A5=A5/(size(A2,1)*size(A2,2));
bar(0:255,A5,'FaceColor',[.3 .7 .7])
xlim([0 255])
ylim([0 max(A5)])
figure
%%
for D=0:255
    for i=1:450
        for j=1:800
            if(A3(i,j)==D)
                A6(D+1)=A6(D+1)+1;
            end
        end
    end
end

A6=A6/(size(A3,1)*size(A3,2));
bar(0:255,A6,'FaceColor',[.3 .3 .3])
xlim([0 255])
ylim([0 max(A6)])
%% p2_B
B1=A1;
B2=A2;
B3=A3;
FN=zeros(1,size(A4,2));
FN(1)=A4(1);
for i=2:size(A4,2)
    FN(i)=FN(i-1)+A4(i);
end
FN=round(FN*255);
B5=zeros(1,size(A5,2));
B5(1)=A5(1);
for i=2:size(A5,2)
    B5(i)=B5(i-1)+A5(i);
end
B5=round(B5*255);
B6=zeros(1,size(A6,2));
B6(1)=A6(1);
for i=2:size(A6,2)
    B6(i)=B6(i-1)+A6(i);
end
B6=round(B6*255);
for i=1:size(B1,1)
    for j=1:size(B1,2)
        B1(i,j)=B5(B1(i,j)+1);
    end
end

for i=1:size(B2,1)
    for j=1:size(B2,2)
        B2(i,j)=B5(B2(i,j)+1);
    end
end
for i=1:size(B3,1)
    for j=1:size(B3,2)
        B3(i,j)=B6(B3(i,j)+1);
    end
end
figure
subplot(3,2,1);imshow(A1);
subplot(3,2,2);imshow(B1);
subplot(3,2,3);imshow(A2);
subplot(3,2,4);imshow(B2);
subplot(3,2,5);imshow(A3);
subplot(3,2,6);imshow(B3);
%% P2_C
C1=A1;
C2=A2;
C3=A3;
window=29;
C1_localhist = uint8(local_histogram(C1,window));
C2_localhist = uint8(local_histogram(C2,window));
C3_localhist = uint8(local_histogram(C3,window));
figure
subplot(3,2,1);imshow(A1);
subplot(3,2,2);imshow(C1_localhist);
subplot(3,2,3);imshow(A2);
subplot(3,2,4);imshow(C2_localhist);
subplot(3,2,5);imshow(A3);
subplot(3,2,6);imshow(C3_localhist);

%%
B1=A1;
B2=A2;
B3=A3;
FN=zeros(1,size(A4,2));
FN(1)=A4(1);
for i=2:size(A4,2)
    FN(i)=FN(i-1)+A4(i);
end
FN=round(FN*255);
B5=zeros(1,size(A5,2));
B5(1)=A5(1);
for i=2:size(A5,2)
    B5(i)=B5(i-1)+A5(i);
end
B5=round(B5*255);
B6=zeros(1,size(A6,2));
B6(1)=A6(1);
for i=2:size(A6,2)
    B6(i)=B6(i-1)+A6(i);
end
B6=round(B6*255);
for i=1:size(B1,1)
    for j=1:size(B1,2)
        B1(i,j)=B5(B1(i,j)+1);
    end
end

for i=1:size(B2,1)
    for j=1:size(B2,2)
        B2(i,j)=B5(B2(i,j)+1);
    end
end
for i=1:size(B3,1)
    for j=1:size(B3,2)
        B3(i,j)=B6(B3(i,j)+1);
    end
end
figure
subplot(3,2,1);imshow(A1);
subplot(3,2,2);imshow(B1);
subplot(3,2,3);imshow(A2);
subplot(3,2,4);imshow(B2);
subplot(3,2,5);imshow(A3);
subplot(3,2,6);imshow(B3);







%% P2_d2
D=imread('squares.tif');
window=29;
C1_localhist = uint8(local_histogram(D,window));

figure
subplot(1,2,1);imshow(D);
subplot(1,2,2);imshow(C1_localhist);




            function C_localhist=local_histogram(C,window)
C_localhist=zeros(size(C,1),size(C,2));
for i=((window-1)/2)+1:size(C,1)-((window-1)/2)
    for j=((window-1)/2)+1:size(C,2)-((window-1)/2)
        C4=zeros(1,256);
        C5=zeros(1,256);
        C6=zeros(1,256);
        for m=i-((window-1)/2):i+((window-1)/2)
            for n= j-((window-1)/2):j+((window-1)/2)
                C11=C(m,n);
                C4(1,C11+1)=C4(1,C11+1)+1;
            end
        end
        C5=C4/((window)^2);
        C6(1)=C5(1);
        for k=2:size(C4,2)
            C6(1,k)=C6(1,k-1)+C5(1,k);
            
        end
        C6=floor(C6*255);
        C_localhist(i,j)=C6(1,C(i,j)+1);
        
    end
end
            end






             
        
    
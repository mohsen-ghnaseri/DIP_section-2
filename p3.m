%% p3_a
clc
clear 
close all
img1=imread('imageorg.png');
img2=imread('imagegoal.png');
A1=zeros(1,256);
A2=zeros(1,256);
for k=0:255
for i=1:size(img1,1)
    for j=1:size(img1,2)
        if(img1(i,j)==k)
            A1(k+1)=A1(k+1)+1;
        end
    end
end
end
for k=0:255
    for i=1:size(img2,1)
        for j=1:size(img2,2)
            if(img2(i,j)==k)
                A2(k+1)=A2(k+1)+1;
            end
        end
    end
end
subplot(2,2,1);
imshow(img1)
subplot(2,2,2);
bar(0:255,A1,'facecolor',[.3 .4 .6]);
xlim([0 255])

subplot(2,2,3);
imshow(img2)
subplot(2,2,4);
bar(0:255,A2,'FaceColor',[0 .8 .4])
xlim([0 255])
%% p3_b
img3=imread('imageorg.png');
img4=imread('imagegoal.png');
equalized_goal=img4;
g_hist=myimhist(img4);
window=19;
blocksize=window+1;
image=zeros(size(img4,1)+blocksize,size(img4,2)+blocksize);
image(blocksize/2:size(img4,1)+blocksize/2-1,blocksize/2:size(img4,2)+blocksize/2-1)=img4;
image=uint8(image);

img4=zeros(size(img4,1)+blocksize,size(img4,2)+blocksize);
img4(blocksize/2:size(img4,1)+blocksize/2-1,blocksize/2:size(img4,2)+blocksize/2-1)=img4;
img4=uint8(img4);
spec=image;
for m=blocksize/2:size(image,1)-1*blocksize/2
    for n=blocksize/2:1:size(image,2)-1*blocksize/2
        o_hist=myimhist(image(m-blocksize/2+1:m+blocksize/2-1,n-blocksize/2+1:n+blocksize/2-1));
        torg=round(255*cumsum(o_hist./sum(o_hist)));
        equalize_goal=img4(m-blocksize/2+1:m+blocksize/2-1,n-blocksize/2+1:n+blocksize/2-1);
        g_hist=myimhist(equalized_goal);
        tg=round(255*cumsum(g_hist./sum(g_hist)));
        tall=repmat(tg',[1 length(torg')]);
        [~,t]=min(abs(tall-torg));
        imageblock=image(m-blocksize/2+1:m+blocksize/2-1,n-blocksize/2+1:n+blocksize/2-1);
        spec(m,n)=round(t(1+imageblock(blocksize/2,blocksize/2)));
    end
end
spec=spec(blocksize/2:size(img4,1)+blocksize/2-1,blocksize/2:size(img4,2)+blocksize/2-1);
figure
subplot(3,2,1)
imshow(img3);
xlabel('org image');
subplot(3,2,2)
bar(myimhist(img3));
xlabel('org image histogram')
subplot(3,2,3)
imshow(img4);
xlabel('goal image')
subplot(3,2,4)
bar(myimhist(img4));
xlabel('goal image histogram')

subplot(3,2,5)
imshow(spec);
xlabel('spec')
subplot(3,2,6)
bar(myimhist(spec));
xlabel('spec image hist')
function [histogram]=myimhist(image_x)
histogram=[]
for i=0:1:255
    histogram(i+1)=length(find(image_x==i));
end
end
        
        
        
        
        
        
        
        
        
        
        





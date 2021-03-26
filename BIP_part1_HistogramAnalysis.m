clear; clf; clc;

% part 1 : Enhance Contrast
% analyse the original image

%mri-bright.256
figure(1);

ipfn = 'mri-bright.256';
ipfp = fopen(ipfn, 'r');
ipimg = fread(ipfp, [256,256], 'uchar');
ipimg =ipimg';

mri_bright=ipimg;
subplot(2,2,1);
image(mri_bright); %original
colormap(gray(256));
axis('image') ;
title('mri-bright.256');

subplot(2,2,3);
h = zeros(256,1);
for level=0:255
    h( level+1)=sum(sum(mri_brigh=
    =level));
end

bar(h); %histogram
set(gca,'XLim',[0 255]);
set(gca,'YLim',[0 3000]);

%mri-dark.256
ipfn = 'mri-dark.256';
ipfp = fopen(ipfn, 'r');
ipimg = fread(ipfp, [256,256], 'uchar');

mri_dark=ipimg';
subplot(2,2,2);
image(mri_dark); %original
colormap(gray(256));
axis('image') ;
title('mri-dark.256');

subplot(2,2,4);
k = zeros(256,1);
for level=0:255
    k( level+1)=sum(sum(ipimg==level));
end
bar(k); %histogram
set(gca,'XLim',[0 255]);
set(gca,'YLim',[0 3000]);
fclose(ipfp);

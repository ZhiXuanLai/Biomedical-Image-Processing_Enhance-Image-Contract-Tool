%Enhance Contrast
%mri-bright.256

figure(2);
subplot(1,2,1);
ipfn = 'mri-bright.256';
ipfp = fopen(ipfn, 'r');
ipimg = fread(ipfp, [256,256], 'uchar');
EC_bright =ipimg';

EC_bright=EC_bright.^3 ;
s=max(max(EC_bright))/255EC_bright=round(EC_bright./s) ; %
turn the pixel values back to [0 : 255]
image(EC_bright);
colormap(gray(256));
axis('image');
title('mri-bright.256 after EnhanceContrast');

%histogram
subplot(1,2,2);
h = zeros(256,1);
for level=0:255
    h( level+1)=sum(sum(EC_bright==level));
end
bar(h);
set(gca,'XLim',[0 300]);
set(gca,'YLim',[0 3000]);

%mri-dark.256

figure(3);
subplot(1,2,1);
ipfn = 'mri-dark.256';
ipfp = fopen(ipfn, 'r');
ipimg = fread(ipfp, [256,256], 'uchar');
EC_dark =ipimg';

EC_dark=EC_dark.^0.2 ;
s=255/max(max(EC_dark)) ;
EC_dark=round(EC_dark.*s) ; % turn the pixel values back to [0 : 255]
image(EC_dark);
colormap(gray(256));
axis('image');

%histogram
subplot(1,2,2);
h = zeros(256,1);
for level=0:255
    h( level+1)=sum(sum(EC_dark==level));
end
bar(h);
set(gca,'XLim',[0 255]);
set(gca,'YLim',[0 3000]);
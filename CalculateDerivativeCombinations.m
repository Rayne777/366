
DataDir = './Data/';
load([DataDir,'Dxf.mat'], 'Dxf');
load([DataDir,'Dyf.mat'], 'Dyf');
%%% load the pre-calculated x- and y-derivative images.
figure(1); 
subplot(1,2,1); 
imagesc(Dxf); 
colormap gray;
title('Dx f')
axis image off;
subplot(1,2,2); 
imagesc(Dyf); 
colormap gray;
axis image off;
title('Dy f')
%%% display x- and y-derivative images.
[IHeight,IWidth] = size(Dxf);
Qxxf = zeros(IHeight,IWidth);
Qxyf = zeros(IHeight,IWidth);
Qyyf = zeros(IHeight,IWidth);
%%% allocate memory for three matrix variable `Qxxf’, `Qxyf’, and `Qyyf’ which will
%%% store the combinations of x- and y-derivatives at each pixel location.
%%% to be written by you from here:
%%% Calculate the values of `Qxxf’, `Qxyf’, and `Qyyf’ at each pixel location.
Qxxf = Dxf.*Dxf;
Qxyf= Dxf.*Dyf;
Qyyf = Dyf.*Dyf;
 %%% to be written by you till here.
figure(2); 
subplot(1,3,1); 
imagesc(Qxxf); 
colormap gray;
axis image off;
title('Qxx f')
subplot(1,3,2); 
imagesc(Qxyf); 
colormap gray;
axis image off;
title('Qxy f')
subplot(1,3,3); 
imagesc(Qyyf); 
colormap gray;
axis image off;
title('Qyy f')
%%% display three combinations of derivative images.
h= fspecial('gaussian',[7 7],2);
%%% prepares a two-D Gaussian filter of size 7×7.
SQxxf = filter2(h,Qxxf);
SQxyf = filter2(h,Qxyf);
SQyyf = filter2(h,Qyyf);
%%% smooth the combinations of derivative images using Gaussian smoothing.
save SQf.mat SQxxf SQxyf SQyyf;
%%% saves the results in a MATLAB data file `SQf.mat’.
figure(3); 
subplot(1,3,1); 
imagesc(SQxxf); 
colormap gray;
axis image off;
title('S[Qxx f]')
subplot(1,3,2); 
imagesc(SQxyf); 
colormap gray;
axis image off;
title('S[Qxy f]')
subplot(1,3,3); 
imagesc(SQyyf); 
colormap gray;
axis image off;
title('S[Qyy f]')
%%% display smooth versions of the combined derivative images.


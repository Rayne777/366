DataDir = './Data/';
load([DataDir,'SQf.mat'], 'SQxxf', 'SQxyf', 'SQyyf');

[IHeight,IWidth] = size(SQxxf);
Rf = zeros(IHeight,IWidth);

%%% missing lines from here
%%% .....
Rf = SQxxf.*SQyyf- SQxyf.*SQxyf-0.01*(SQxxf + SQyyf).^2;


%%% missing lines till here

save Rf.mat Rf;

imagesc(Rf);
colormap gray;
axis image off;
title('R[f]')

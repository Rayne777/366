DataDir = './Data/';

InputImage = imread([DataDir,'kodim09gray.png']); 

load([DataDir,'Rf.mat'], 'Rf');

RfMax = max(Rf(:));

[IHeight,IWidth] = size(Rf);

CornerFlagImage = zeros(IHeight,IWidth);

%%% missing lines from here
%%% .....
for i = 1:IHeight
    for j = 1:IWidth
        if Rf(i,j)>0.1*max(Rf)
            CornerFlagImage(i,j)=1;
        else
            CornerFlagImage(i,j)=0;
        end
    end
end

%%% missing lines till here

[PosC, PosR] = find(CornerFlagImage == 1);
imshow(InputImage);
hold on;
plot(PosR,PosC,'r.','Markersize',15);
axis image;
hold off;

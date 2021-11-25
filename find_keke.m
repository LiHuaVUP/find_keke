function [loc_keke,cfull]=find_keke(image)

map_generated=imread(image);

keke_here=imread('keke.jpeg');
[eigve,eigva]=eig(double(rgb2gray(keke_here)),'vector');
eig_keke=abs(eigva);

rows=size(map_generated,1)./75;
cols=size(map_generated,2)./75;

cfull=NaN(rows,cols);

for i=1:rows;
    for j=1:cols;
        map_here=map_generated((1:75)+(i-1)*75,(1:75)+(j-1)*75,:);
        [eigve,eigva]=eig(double(rgb2gray(map_here)),'vector');
        eig_here=abs(eigva);
        [c,p]=corr(eig_here,eig_keke);
        cfull(i,j)=c;
    end
end

c_line=(sort(cfull(:),'descend'));
num=find(diff(c_line)==nanmin(diff(c_line)));

[x,y]=find(cfull>=c_line(num));

loc_keke=[x y];

for i=1:length(x);

map_generated((1:75)+(x(i)-1)*75,(1:75)+(y(i)-1)*75,1)=255;
map_generated((1:75)+(x(i)-1)*75,(1:75)+(y(i)-1)*75,2)=0;
map_generated((1:75)+(x(i)-1)*75,(1:75)+(y(i)-1)*75,3)=0;

end

imshow(map_generated);
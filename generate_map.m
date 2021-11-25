function [final_map,yao_order]=generate_map(rows,cols,num_keke);
close all;
keke=imread('keke.jpeg');
kotori=imread('kotori.jpeg');
you=imread('you.jpeg');

yao_order=(randperm(rows*cols,num_keke))';
prob_map=rand(rows*cols,1)-0.5;

prob_map(yao_order)=0;
prob_map=reshape(prob_map,rows,cols);
[x,y]=find(prob_map==0);
yao_order=[x y];

for i=1:rows;
    for j=1:cols;
        if prob_map(i,j)>0;
            final_map((1:75)+(i-1)*75,(1:75)+(j-1)*75,:)=kotori;
        elseif prob_map(i,j)<0;
            final_map((1:75)+(i-1)*75,(1:75)+(j-1)*75,:)=you;
        elseif prob_map(i,j)==0;
            final_map((1:75)+(i-1)*75,(1:75)+(j-1)*75,:)=keke;
        end
    end
end

imshow(final_map);


            
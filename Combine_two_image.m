clear all;

A_l = imread('car_left.tif');
A_r = imread('car_right.tif');
[A_lx, A_ly] = size(A_l);
diff = [0];
for i=1:A_ly
    diff(i)=sum(A_l(:,A_ly))-sum(A_r(:,i));
end
minD=min(diff);
new_x=find(diff==minD);

[A_rx, A_ry] = size(A_r);
diff2 = [0];
for i=1:A_ry
    diff2(i)=sum(A_l(:,A_ry))-sum(A_l(:,i));
end
minD2=min(diff2);
new_x2=find(diff2==minD2);

new = A_r(:,1:new_x);
figure;imshow(new);
figure;imshow(A_l);
final = [new,A_l(:,new_x2:A_ly)];
figure;imshow(final);
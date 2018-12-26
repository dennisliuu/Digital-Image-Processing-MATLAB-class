clear;
% Input parameter
A=imread('cameraman.tif');
times = 3;
% Haar processing
[size_A, x] = size(A);
small_s = size_A / times;
col=max(size(A));
row=min(size(A));
inp=A;
op=zeros(col,row);
while(col>small_s)
    len=0;
    while(len<2)
        for j=1:row
            for i=0:col/2-1
                op(j,i+1)=(A(j,2*i+2)+A(j,2*i+1))*.5;
                op(j,col/2+i+1)=(A(j,2*i+1)-A(j,2*i+2))*.5;
            end
        end
        A=op';
        len=len+1;
    end
    col=col/2;
    row=row/2;
    A=op';
end
imshow(uint8(A));

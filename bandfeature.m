function [f]=bandfeature(data,n)
[~,w]=size(data{1});
w=w/2;l=0;
for i=1:n
    for j=(i+1):n
        [a{i,j} b{i,j}]=cspmain(data{i},data{j},w);
    end 
end

for i=0:(n-1)
    if((i+2)<=n)
    t{i+1}=[b{1:i,i+1} a{i+1,(i+2):n}];
    else
        t{(i+1)}=[b{1:i,i+1}];
    end
end
f=vertcat(t{1:n});
for i=1:n
    for j=1:w
        l=[l i];
    end
end
l=l';
l=l(2:((w*n)+1));
f=[f l];
end

        

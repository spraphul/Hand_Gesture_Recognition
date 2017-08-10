function filtereddata=filterdes(data)
%Lp=Lowpassfilter();
%Hp=Highpassfilter();
Hd=untitled();
for i=1:8
    for j=1:300
        filtereddata{i}(:,j)=adaptivefiltr(filter(Hd,data{i}(:,j)));
end
end
end
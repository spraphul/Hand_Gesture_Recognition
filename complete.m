function f1=complete(data)
t=(0:length(data{1}(:,1))-1)/2000;l=0;k=0;x=1;
%Lp=Lowpassfilter();
%Hp=Highpassfilter();
for i=1:8
    for j=1:150
filtereddata{i}(:,j)=data{i}(:,j);
       % filtereddata{i}(:,j)=filter(Lp,adaptivefiltr(filter(Hp,data{i}(:,j))));
f{i}(j,1)=trapz((0:length(filtereddata{i}(:,j))-1)/2000,abs(filtereddata{i}(:,j)));%Integrated EMG
f{i}(j,2)=mean(abs(filtereddata{i}(:,j)));%Mean absolute value
f{i}(j,3)=rms(filtereddata{i}(:,j));
f{i}(j,4)=var(filtereddata{i}(:,j));
f{i}(j,5)=getwlfeat(filtereddata{i}(:,j));%waveform length;
f{i}(j,6)=zerocross(filtereddata{i}(:,j));
f{i}(j,7)=trapz((0:length(filtereddata{i}(:,j))-1)/2000,(abs(filtereddata{i}(:,j)).^2)); %simple square integral;
f{i}(j,8)=sum(diff(sign(diff(filtereddata{i}(:,j))))~=0);% Slope Sign Change 
f{i}(j,9)=meanfreq(filtereddata{i}(:,j),1000);% mean frequency in terms of sampling rate
f{i}(j,10)=medfreq(filtereddata{i}(:,j),1000);%median frequency
f{i}(j,11:16)=getarfeat(filtereddata{i}(:,j),6);
%f{i}(j,(17):(60))=getmswtfeat(filtereddata{i}(:,j),800,800,2000);
    end
end
for i=1:8
    for j=151:300
filtereddata{i}(:,j)=data{i}(:,j);
        % filtereddata{i}(:,j)=filter(Lp,adaptivefiltr(filter(Hp,data{i}(:,j))));
     f{i}(j-150,17)=trapz((0:length(filtereddata{i}(:,j))-1)/2000,abs(filtereddata{i}(:,j)));%Integrated EMG
f{i}(j-150,18)=mean(abs(filtereddata{i}(:,j)));%Mean absolute value
f{i}(j-150,19)=rms(filtereddata{i}(:,j));
f{i}(j-150,20)=var(filtereddata{i}(:,j));
f{i}(j-150,21)=getwlfeat(filtereddata{i}(:,j));%waveform length;
f{i}(j-150,22)=zerocross(filtereddata{i}(:,j));
f{i}(j-150,23)=trapz((0:length(filtereddata{i}(:,j))-1)/2000,(abs(filtereddata{i}(:,j)).^2)); %simple square integral;
f{i}(j-150,24)=sum(diff(sign(diff(filtereddata{i}(:,j))))~=0);% Slope Sign Change 
f{i}(j-150,25)=meanfreq(filtereddata{i}(:,j),2000);% mean frequency in terms of sampling rate
f{i}(j-150,26)=medfreq(filtereddata{i}(:,j),2000);%median frequency
f{i}(j-150,(27):(32))=getarfeat(filtereddata{i}(:,j),6);
%f{i}(j-150,(77):(77+43))=getmswtfeat(filtereddata{i}(:,j),800,800,2000);
    end
end
        
f2=vertcat(f{1:8});
for k=1:8
    for l=1:150
        x=[x k];
    end
end
x=x';
x=x(2:1201);
f1=horzcat(f2,x);
end
    
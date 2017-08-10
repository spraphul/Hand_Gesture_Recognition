function f=features(sig)
%t=(0:length(sig(:,1))-1)/8000;
for i=1:100
signal1(:,i)=filterdesign(sig(:,i));
signal(:,i)=adaptivefiltr(signal1(:,i));
t=(0:length(signal(:,1))-1)/1000;
f(i,1)=trapz(t,abs(signal(:,i)));%Integrated EMG
f(i,2)=mean(abs(signal(:,i)));%Mean absolute value
f(i,3)=rms(signal(:,i));
f(i,4)=var(signal(:,i));
f(i,5)=getwlfeat(signal(:,i));%waveform length;
f(i,6)=zerocross(signal(:,i));
f(i,7)=trapz(t,(abs(signal(:,i)).^2)); %simple square integral;
f(i,8)=sum(diff(sign(diff(signal(:,i))))~=0);% Slope Sign Change 
f(i,9)=meanfreq(signal(:,i),1000);% mean frequency in terms of sampling rate
f(i,10)=medfreq(signal(:,i),1000);%median frequency
f(i,11:16)=getarfeat(signal(:,i),6);
%f(i,17:60)=getmswtfeat(signal(:,i),1536,1536,1000);
end
end
function [f]=wavelet_features(signal , num_levels)


m=size(signal,1);


%f=zeros(m,4*(len-1));
%t=0:11520;
for i=1:m
[c,l]=wavedec(signal(i,:),10,'db4');
[cd1,cd2,cd3,cd4,cd5,cd6,cd7,cd8,cd9,cd10]=detcoef(c,l,[1 2 3 4 5 6 7 8 9 10]);

%len=length(cd10);
%ind=1;

%f(i,1)=trapz(t,abs(cd10'));%Integrated EMG
f(i,1)=mean(abs(cd10'));%Mean absolute value
f(i,2)=rms(cd10');
f(i,3)=var(cd10');
f(i,4)=getwlfeat(cd10');%waveform length;
%f(i,6)=zerocross(cd10);
%f(i,6)=trapz(t,(abs(cd10').^2)); %simple square integral;
f(i,5)=sum(diff(sign(diff(cd10')))~=0);% Slope Sign Change 
f(i,6)=meanfreq(cd10',8000);% mean frequency in terms of sampling rate
f(i,7)=medfreq(cd10',8000);%median frequency
%f(i,11:16)=getarfeat(cd10,6);

end

end

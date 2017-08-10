function dat2= energyinfo1(data2,winsize,wininc,datawin,dispstatus)

if nargin < 6
    if nargin < 5
        if nargin < 4
            if nargin < 3
                winsize = size(data2{1},1);
            end
            wininc = winsize;
        end
        datawin = ones(winsize,1);
    end
    dispstatus = 0;
end
for m=1:8
datasize = size(data2{m},1);
Nsignals = size(data2{m},2);winsize=800;wininc=25;
numwin = floor((datasize - winsize)/wininc)+1;
% allocate memory
feat = zeros(numwin,Nsignals);
if dispstatus
    h = waitbar(0,'Computing AR features...');
end

st = 1;
en = winsize;

for i = 1:numwin
   if dispstatus
       waitbar(i/numwin);
   end
   curwin = data2{m}(st:en,:).*repmat(datawin,1,Nsignals);
   feat(i,:)=var(curwin);
   st = st + wininc;
   en = en + wininc;
end
[~,rownum1]=max(feat); 

    for i=1:Nsignals
        startend1{m}(1,i)=(rownum1(i)-1)*wininc+1;
        startend1{m}(2,i)=winsize+(rownum1(i)-1)*wininc+1;
    end
     for i=1:Nsignals
       dat2{m}(:,i)=data2{m}((startend1{m}(1,i)):startend1{m}(2,i),i);
     end
end
end
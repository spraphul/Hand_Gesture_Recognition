function g=training()
i=0;
%g=zeros(1440,5);
while(i<50)
d=input('Enter number 0\n');
if(d==0)
    i=i+1;
fprintf(' wait for 2 sec %d\n',i);
f=getit();
g(:,i)=f(:,1);
g(:,50+i)=f(:,2);
end
end
end
function l= getit()

a=audiorecorder(2000,24,1,3);
f=audiorecorder(2000,24,1,1);
record(a);
record(f);
pause(0.54)
b=getaudiodata(a);
g=getaudiodata(f);
l=horzcat(b(1:850),g(1:850));
end

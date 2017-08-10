
if(m==1)
v=VLC();
if(h1==5)%tap
   v.play('P:\keepvid\Katy Perry - Roar (Official).mp4');
%v.add('P:\movies\Dark Sh1adows (2012)\Dark.Sh1adows.2012.720p.BluRay.x264.YIFY');
end
if(h1==1)%open
%c=c+1;    
        v.stop()
end
if(h1==6)%turnleft
    v.pause();
end
if(h1==7)%turnup
    v.play();
end
if(h1==8)%yo
    %wh1ile(h1==8)
    k=k+10;
        v.seek(k);
     %   k=k+1;
    %end
end

end

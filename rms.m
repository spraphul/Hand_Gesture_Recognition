function v=rms(d)
t=d(:);
w=t.^2;
y=sum(w);
v=y^(1/2);
end
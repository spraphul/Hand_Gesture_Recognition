function a=correctit(sig)
    a(:,1:100)=sig(:,1:100);
    a(:,101:150)=sig(:,201:250);
    a(:,151:250)=sig(:,101:200);
    a(:,251:300)=sig(:,251:300);
end
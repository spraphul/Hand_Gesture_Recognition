function b_filt=filt(b,r)
    %X_mags=abs(fft(b));
    %num_bins = length(X_mags);
    %plot([0:1/(num_bins/2-1):1],X_mags(1:num_bins/2));
    [b1 a1]=butter(12,0.04,'high');
    b_filt=filter(b1,a1,b);
end
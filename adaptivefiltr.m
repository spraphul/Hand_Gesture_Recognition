function f1=adaptivefiltr(x)
Fs = 2000;
N = 850;
i = [0 : N-1]';

%create the initial signal
%x = sin(2*pi*200* i/Fs) + 0.66*sin(2*pi* 280*i/Fs) + 0.59*sin(2*pi*60*i/Fs) + 0.5^0.5*randn( N,1);

%create the reference signal of the adaptive filter
u = sin(2*pi*50* i/Fs)+sin(2*pi*100* i/Fs)+sin(2*pi*150* i/Fs)+sin(2*pi*200* i/Fs)+sin(2*pi*250* i/Fs)+sin(2*pi*300* i/Fs)+sin(2*pi*350* i/Fs)+sin(2*pi*400* i/Fs)+sin(2*pi*450* i/Fs)+sin(2*pi*500* i/Fs);

%adaptive filter architecture
L = 60;
step_size = 0.005;
w = zeros(1,L);

%un the adaptive filter
e(L) = x(L);
for k = L : N
regressor = flipud(u(k-L+ 1:k));
w = w + step_size * regressor' * e(k);
e(k+1) = x(k) - w * regressor;
end

%compute the spectrum of the initial signal and the filtered signal
f = [0 : Fs/N : Fs - Fs/N]';
F = abs(fft(x));
E = abs(fft(e));
f1=e;

%plot
%figure;
%subplot(411) ;plot(x); title('initial signal');
%subplot(412) ;plot(e); title('initial signal after filtering');
%subplot(413) ;plot(f,F( 1:length( f)));title( 'spectrum of initial
%signal');
%subplot(414) ;plot(f,E( 1:length( f)));title( 'spectrum of initial
%signal after filtering');
end

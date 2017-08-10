function filtr = filtrdesign(sig)
%FILTRDESIGN Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.0 and the DSP System Toolbox 9.2.
% Generated on: 24-Jun-2017 16:29:54

% Chebyshev Type II Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 2000;  % Sampling Frequency

Fstop1 = 29.6;          % First Stopband Frequency
Fpass1 = 30;          % First Passband Frequency
Fpass2 = 400;         % Second Passband Frequency
Fstop2 = 405;         % Second Stopband Frequency
Astop1 = 60;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 80;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its CHEBY2 method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Hd = design(h, 'cheby2', 'MatchExactly', match);
filtr=filter(Hd,sig);
% [EOF]
%Problem: With the double real 64-point FFT program DRFFT64(x, y)
%developed in Homework#7, please write

%(1) Convolution Computation: A real linear convolution program,
%which can compute the convolution of two 32 real-data, which are
%x[n]=[3, 6, 9,¡K, 96] and h[n]=32-2n, for n=1, 2,¡K, 32.
%Please write: 
%(a) a direct real convolution program; 
clear;
x  = [3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66 69 72....
    75 78 81 84 87 90 93 96];
h = [30 28 26 24 22 20 18 16 14 12 10 8 6 4 2 0 -2 -4 -6 -8 -10 -12 -14 -16....
    -18 -20 -22 -24 -26 -28 -30 -32];
y_my = conv_direct(x,h);
y_original = conv(x,h);
error = y_my - y_original;
error = norm(error.*error);

%(b) a real convolution program by calling DRFFT64(x, y) once.
clear;

x = [3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66 69 72....
    75 78 81 84 87 90 93 96];
h = [30 28 26 24 22 20 18 16 14 12 10 8 6 4 2 0 -2 -4 -6 -8 -10 -12 -14 -16....
    -18 -20 -22 -24 -26 -28 -30 -32];

y_my = conv_drfft64(x,h);
y_original = conv(x,h);

error = y_my - y_original;
error = norm(error.*error);

%(2) Autocorrelation Computation: A real data autocorrelation program,
%which can compute the autocorrelation of x[n] = n*(-1)^n, for n=1,2,...,32
%Please write: 
% (a) a direct real autocorrelation program; 
clear;

for i = 1:32
    x(i) = i * (-1)^i;
end
y_original = xcorr(x);
y_my = autocorr_direct(x);

error = y_my - y_original;
error = norm(error.*error);

%(b) a computation program by calling DRFFT64 (x, y) once.
clear;
N = 32;
L = 2*N-1;

for i = 1:N
    x(i) = i * (-1)^i;
end
x = [x zeros(1,N-length(x))];
y_original = xcorr(x);
y_my = autocorr_drfft64(x);

error = y_my - y_original;
error = norm(error.*error);


% Programming Problem:

%(1) Please write a complex 32-point FFT program (in Matlab or C-program),
%called X=FFT32(x), where x is a complex 32-point vector.
clear;

x  = [3+1i 6-2i 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66 69 72 75 78 81 84 87 90 93 96];

X_my = fft32(x);
X_original = fft(x);
error = X_my - X_original;
error = norm(error.*error);

% (2) Please use FFT32 to write a complex 64-point FFT program, called
% FFT64(x), where x is a complex 64-point vector.
clear;

x  = [3+1i 6-2i 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66....
    69 72 75 78 81 84 87 90 93 96 3+1i 6-2i 9 12 15 18 21 24 27 30 33 36 39....
    42 45 48 51 54 57 60 63 66 69 72 75 78 81 84 87 90 93 96-10i];

X_my = fft64(x);
X_original = fft(x);
error = X_my - X_original;
error = norm(error.*error);

% (3) Please write a double-real 64-point FFT program, called DRFFT64(x, y),
% where x, y are two real 64-point data vectors, by only calling FFT64
% FFT program once;
clear;
x  = [3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66 69 72....
    75 78 81 84 87 90 93 96 3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51....
    54 57 60 63 66 69 72 75 78 81 84 87 90 93 96];
h = [30 28 26 24 22 20 18 16 14 12 10 8 6 4 2 0 -2 -4 -6 -8 -10 -12 -14 -16....
    -18 -20 -22 -24 -26 -28 -30 -32 30 28 26 24 22 20 18 16 14 12 10 8 6 4 2....
    0 -2 -4 -6 -8 -10 -12 -14 -16 -18 -20 -22 -24 -26 -28 -30 -32];
[X_my, H_my] = drfft64(x,h);
X_original = fft(x);
H_original = fft(h);
error = X_my - X_original;
error = norm(error.*error);

%(4) Please write an inverse complex 64-point FFT program by only calling
%FFT64 FFT program once.
clear;

x  = [3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66 69 72....
    75 78 81 84 87 90 93 96 3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51....
    54 57 60 63 66 69 72 75 78 81 84 87 90 93 96];

X_my = fft64(x);
X_original = fft(x);

x_my = ifft64(X_my);
x_original = ifft(X_original);

error = x_my - x_original;
error = norm(error.*error);
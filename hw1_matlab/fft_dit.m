function x = fft_dit(x)
N = length(x);
if N > 1
    k   = [0:N-1];
    WNk = exp(-2j*pi/N.*k);
    f   = x(1:2:end);
    g   = x(2:2:end);
    F   = fft_dit(f);
    G   = fft_dit(g);
    x   = [F,F] + (WNk).*[G,G];
end
function FX = fft64(x)
N = 64;
k = [0:N-1];
WNk = exp(-2j*pi/N.*k);
f   = x(1:2:end);
g   = x(2:2:end);
F   = fft32(f);
G   = fft32(g);
FX   = [F,F] + (WNk).*[G,G];

function out = autocorr_drfft64(x)

L = length(x);
N = 2^nextpow2(2*L-1);
x = [x zeros(1, N-L)];

FX = fft64(x);

Ty = ifft64(abs(FX).^2);
Ty = real(Ty);

%Move negative lags before positive lags
out = [zeros(1, 2*L-1)];
out = [Ty(L+length(x)-2*L+2 : end),Ty(1 : L)];

%delete errors produzed from finite precision accuracy of computer
for i = 1:N
    if abs(imag(x(i))) < 1e-11
        x(i) = real(x(i));
    end
    if abs(real(x(i))) < 1e-11
        x(i) = x(i)-real(x(i));
    end
end

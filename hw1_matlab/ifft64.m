function x = ifft64(X)
N = 64;
FX=fft_dit(X)/N;
% Faster implementation , instead of 'mod' function,of
% Time inverse and modula by N
x(1) = FX(1);
x(2:N) = FX(N:-1:2);

%delete errors produzed from finite precision accuracy of computer
for i = 1:N
    if abs(imag(x(i))) < 1e-11
        x(i) = real(x(i));
    end
    if abs(real(x(i))) < 1e-11
        x(i) = x(i)-real(x(i));
    end
end

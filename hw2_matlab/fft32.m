function FX = fft32(x)
if length(x) == 32
    FX = fft_dit(x);
elseif length(x) < 32
    x = [x zeros(1, 32 - length(x))];
    FX = fft_dit(x);
end
    


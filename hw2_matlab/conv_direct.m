function y_my = conv_direct(x,h)
y = zeros(1,32 + 32 -1);

for i = 1: 64
    y(i) = 0;                   
    for j = 1: 32
        if (i - j < 1 || i - j > 32) 
            continue;
        end
        y(i) = y(i) +  x(i - j) * h(j); % convolve: multiply and accumulate   
    end
end
y_my = [y(2:end)];

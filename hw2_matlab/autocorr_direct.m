function y_my = autocorr_direct(x,h)
N = 32;
L = 2*N-1;
x = [x zeros(1, L-length(x))];
y_my = zeros(1,L);

for k=1:L
    for i=1:L
        if((i - k + N)<1 || i > N)
            continue;
        end
        y_my(k) =y_my(k)+ x(i)*x(i - k + N);
    end
end

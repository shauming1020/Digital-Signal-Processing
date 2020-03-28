function [Fx,Fy] = drfft64(x,y)
N = 64;
% Form a complex sequence
z=x+1i*y;

F_kz=fft64(z);

%Time Reverse and Mod N
F_nkz(1)=conj(F_kz(1));
F_nkz(2:N)= conj(F_kz(N:-1:2));

%Get results of N-point FFT of x and y
Fx = (F_kz + F_nkz)/2;
Fy = (F_kz - F_nkz)/(2j);
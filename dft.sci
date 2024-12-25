// Referensi: https://youtu.be/mkGsMWi_j4Q?si=sJDzQNiH3thedkU4

function [Xk] = dft(x, k)
    x = [0 0.707 1 0.707 0 -0.707 -1 -0.707]
    N = length(x)
    Xk = complex(0,0)
    
    for n = 1:N
        bn1 = -1 * (2 * %pi * k * (n-1)) / N // bn=2*pi*k*n/N
        bn2 = bn1 * (180/%pi)
        e = complex(cosd(bn2), sind(bn2)) // rumus Euler , cos x + j sin x
        val = x(n) * e
        Xk = Xk + val
    end
endfunction

Xmag=[] // akar A^2k + B^2k
Xmag(1)=dft(x, 1)
disp(Xmag(1))

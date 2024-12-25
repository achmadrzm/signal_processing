//Sinyal sinus diskrit

A = 10; //amplitudo
phi = 0; //fasa
F = 0.5; //frekuensi sinyal
T = 1/F; //periode
Fs = 12*F; //frekuensi sampling
Ts = 1/Fs; //periode sampling
n = 3;
t = 0:Ts:n*T; //waktu diskrit

//persamaan sinyal sinus
sinus_signal = A * sin(2*%pi*F*t + phi);

// Plot sinyal sinus
plot2d3(t, sinus_signal)
plot(t, 0, 'k')
xlabel('Waktu')
ylabel('Amplitudo')
title('Sinyal Sinus Diskrit')

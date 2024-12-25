//Sinyal sinus kontinu

t = 0:0.001:6; //waktu kontinu
f = 0.5; //frekuensi
A = 10; //amplitudo
phi = 0; //fasa

//persamaan sinyal sinus
sinus_signal = A * sin(2*%pi*f*t + phi);

// Plot sinyal sinus
plot(t, sinus_signal,)
plot(t, 0, 'k')
xlabel('Waktu')
ylabel('Amplitudo')
title('Sinyal Sinus Kontinu')

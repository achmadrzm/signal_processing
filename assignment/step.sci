// Sinyal step

L = 5;
n = -L:L;
x = [zeros(1, L), ones(1, L+1)];
a = gca();
a.y_location = 'middle';
plot2d3(n, x);
title('Sinyal Step')
xlabel('n')

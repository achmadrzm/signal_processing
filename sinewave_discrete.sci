// user parameters
NUM_OF_PERIODS = 1;
NUM_OF_SAMPLING = [4, 10, 50, 100];

for i = 1:length(NUM_OF_SAMPLING)
    // define x-axis (samples)
    x = 0 : (NUM_OF_PERIODS/NUM_OF_SAMPLING(i)) : NUM_OF_PERIODS;

    // define sine function of x
    y = sin(2*(%pi)*x);

    // plot signal
    subplot(2,2,i);
    plot2d3(x,y);
    title(sprintf('NUM\_OF\_SAMPLING = %d', NUM_OF_SAMPLING(i)));
end

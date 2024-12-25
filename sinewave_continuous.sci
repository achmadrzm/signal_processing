// user parameters
NUM_OF_PERIODS = 1;
NUM_OF_SAMPLING = 4;

// define x-axis (samples)
x = 0 : (NUM_OF_PERIODS/NUM_OF_SAMPLING) : NUM_OF_PERIODS;

// define sine function of x
y = sin(2*(%pi)*x);

// plot signal
plot(x,y);

// halt to observe the signal
halt();

for i=1:5;
    // update x with higher sampling rate
    i = i*10;
    disp(1);
    text = 'number of samples: ';
    disp(text, i);
    
    // define x-axis (samples)
    x = 0 : (NUM_OF_PERIODS/i) : NUM_OF_PERIODS;
    
    // define sine function of x
    y = sin(2*(%pi)*x);
    
    // plot signal
    plot(x,y);
    
    // halt to observe the signal
    halt();
end

// clear all variables history from previous execution
clear;

// Global variables
global samples x X;

// user parameters
NUM_OF_PERIODS = 1;
NUM_OF_SAMPLING = 20;
amplitude = 1;
frequency = 1;
frequency_based = 1;

MODE = 'Single_Signal';
// MODE = 'Multiple_Signal';

function Set_sampling_frequency()
    global samples;
    samples = 0 : (NUM_OF_PERIODS / NUM_OF_SAMPLING) : NUM_OF_PERIODS;
endfunction

function Create_input()
    global samples x;
    if MODE == 'Single_Signal' then
        x = amplitude * sin(2*(%pi)*frequency*samples);
    elseif MODE == 'Multiple_Signal' then
        x1 = sin(2*(%pi)*frequency_based*1*samples);
        x2 = 3 * sin(2*(%pi)*frequency_based*2*samples);
        x3 = 0.5 * sin(2*(%pi)*frequency_based*4*samples);
        x = x1 + x2 + x3;
    end
endfunction

function FFT()
    global x X;
    X = abs(fft(x));
endfunction

function Plot_FFT()
    global X;
    clf;
    plot(X);
    title('FFT of the signal');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
endfunction

Set_sampling_frequency();
Create_input();
FFT();
Plot_FFT();

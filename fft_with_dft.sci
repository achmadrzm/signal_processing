// clear all variables history from previous execution
clear;

//constants
pi=%pi;
i=%i;
e=%e;

// global variables
TOTAL_SAMPLING_TIME = 1;  // in second
SAMPLING_FREQUENCY  = 50; // in Hz
INPUT_FREQUENCY     = 1;  // in Hz

// function to create an input
function[x, y, num_data] = create_input(sampling_time, input_frequency, sampling_frequency)
  x  = 0 : (sampling_time/sampling_frequency) : sampling_time;
  y = sin(2*(%pi)*input_frequency*x);
  num_data = x-1;
endfunction

// function to execute fft
function[FFT_result]=execute_fft(signal)
  FFT_result = fft(signal);
endfunction

// modify function to execute fft with dft
function[FFT_result]=execute_fft_with_dft(signal)
    num_data=length(signal);
    for k=0:(num_data-1)
        // calculate even part
        temp_even=0;
        for n=0:((num_data/2)-1)
            temp_complex = e^(-i*2*pi*k*n/(num_data/2));
            temp_even(n+1)= signal((2*n)+1)*temp_complex;
        end
        Ek= sum(temp_even);
        
        // calculate odd part
        temp_odd=0;
        for n=0:((num_data/2)-1)
            temp_complex = e^(-i*2*pi*k*n/(num_data/2));
            temp_odd(n+1)= signal((2*n)+2)*temp_complex;
        end
        Ok= sum(temp_odd);
        
        temp_complex_add = e^(-i*2*pi*k/num_data);
        
        // calculate X(k)
        X(k+1)= Ek+(Ok*temp_complex_add);
        FFT_result(k+1)=sqrt((real(X(k+1))^2)+(imag(X(k+1))^2));
    end
endfunction

// function plot graph
function[]=plot_graph_2d(x,y,title_text,plot_discrete_as_well)
  plot(x,y);
  if plot_discrete_as_well=='yes' then
      plot2d3('gnn',x,y); 
  end 
  title(title_text);
endfunction

//------------------------------------------------------------------//
// calling functions
//------------------------------------------------------------------//
[x, y ,num_data]=create_input(TOTAL_SAMPLING_TIME,INPUT_FREQUENCY,SAMPLING_FREQUENCY); // create input signal
[Y] = abs(execute_fft_with_dft(y)); // perform fft

//x_axis_reps=num_data;
x_axis_reps=0:SAMPLING_FREQUENCY;
clf;
subplot(1,2,1), plot_graph_2d(x,y,'Sinyal input','yes');
subplot(1,2,2), plot2d3('gnn',x_axis_reps,Y);title('FFT dari sinyal input');

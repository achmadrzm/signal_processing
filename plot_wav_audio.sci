// load wav file
wav_file = "F:\achmadrzm\!!KAMPUS\4. SEMESTER 4\Pemrosesan Sinyal\praktisi mengajar\record.wav";

// check further wav file information
// https://help.scilab.org/docs/2024.0.0/en_US/wavread.html
wav_info = wavread(wav_file, "info");

wav_info_string = [
    'WAV encoding code: ',
    'WAV number of channels: ',
    'WAV sampling frequency (in Hz): ',
    'WAV average bytes per second: ',
    'WAV block alignment: ',
    'WAV bits per sample (per channel): ',
    'WAV bytes per sample (per channel): ',
    'WAV length of sound data (per channel): '];

// display wav file information
for i = 1:8
    disp(wav_info_string(i), wav_info(i));
end

// get the data for x- and y- axis
y = wavread(wav_file);
text = 'Number of data of wav file';
disp(text, size(y));

// plot signal
plot2d(y(1,:));

function bandwidth = my_function(filename)

% Load the WAV file into MATLAB
[audio_signal, sample_rate] = audioread(filename);

% Calculate the power spectral density (PSD) of the audio signal
[psd, frequencies] = periodogram(audio_signal, [], [], sample_rate);

% Normalize the PSD so that the total energy is equal to 1
psd_normalized = psd / sum(psd);

% Calculate the cumulative sum of the normalized PSD
cumulative_sum = cumsum(psd_normalized);

% Find the indices where the cumulative sum exceeds 0.9
indices = find(cumulative_sum >= 0.9);

% Calculate the bandwidth by subtracting the lowest frequency from the highest frequency
bandwidth = frequencies(indices(end)) - frequencies(indices(1));

end
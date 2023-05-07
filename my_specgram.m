function [S, f, t] = my_specgram(samples, window_size, overlap, nfft, fs)
    % Calculate the length of the signal
    len = length(samples);
    
    % Calculate the number of frames
    num_frames = floor((len-overlap)/(window_size-overlap));
    
    % Initialize the spectrogram matrix
    S = zeros(nfft/2+1, num_frames);
    
    % Calculate the time vector
    t = (0:num_frames-1)*(window_size-overlap)/fs;
    
    % Calculate the frequency vector
    f = (0:nfft/2)*fs/nfft;
    
    % Loop through each frame
    for i = 1:num_frames
        % Extract the current frame
        frame = samples((i-1)*(window_size-overlap)+1 : (i-1)*(window_size-overlap)+window_size);
        
        % Apply the window function to the frame
        frame = frame .* hanning(window_size);
        
        % Calculate the FFT of the frame
        X = fft(frame, nfft);
        
        % Calculate the power spectrum
        Pxx = X.*conj(X)/nfft;
        
        % Store the power spectrum in the spectrogram matrix
        S(:,i) = Pxx(1:nfft/2+1);
    end
    
    % Plot the spectrogram
    figure ;
    imagesc(t, f, 10*log10(S));
    axis xy;
    title('Spectrogram Using My Function');
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    colorbar;
end
function BW = bandwidth()
    [y,fs] = audioread('audio.wav');
    n = length(y);
    ts = 1/fs;
    df = fs/n;
    Ysig = fftshift(fft(y))*ts;
    f = -(fs/2):df:(fs/2-df);
    E=abs(Ysig).^2*df;
    Etot=sum(E);
    Eacc=0;
    for index_counter=find(f==0):n;
        Eacc=Eacc+E(index_counter);
        if Eacc>=0.5*0.9*Etot
            BW=f(index_counter);
            break;
        end
    end
end
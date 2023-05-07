function BW = bandwidth_me()
   
    Eacc=0;
    for index_counter=find(f==0):n;
        Eacc=Eacc+E(index_counter);
        if Eacc>=0.5*0.9*Etot
            BW=f(index_counter);
            break;
        end
    end
end
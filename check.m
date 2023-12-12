function eta = check(eta)
    if( eta<0.03 || eta>0.4 )
        eta = 0.03 + (0.4 - 0.03) * rand();
    end
end
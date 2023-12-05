function dif = calculateDif(zenith, atm_tran, sun_gap, AngIn, m)
    % Solar constant
    solar_constant = 1367;

    % The proportion of the total normal radiant flux scattered
    P_dif = 0.2 + (0.7 - 0.2)*rand;
    
    % Total normal radiation R_glb
    R_glb = (solar_constant*power(atm_tran,m)/(1-P_dif));
    
    % The time interval of analysis
    dur = 1;
    
    % The proportion of the amount of scattered radiation
    weight = cos(zenith);
    
    % Calculate the scattered radiation dif 散射太阳辐射量
    dif = R_glb * P_dif * dur * sun_gap * weight * cos(AngIn);
    dif = abs(dif);
end
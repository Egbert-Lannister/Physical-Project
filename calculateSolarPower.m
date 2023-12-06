function P_solar = calculateSolarPower(G_st)
    % Photovoltaic cell area
    A = 12;
    P_solar = A*G_st;
end
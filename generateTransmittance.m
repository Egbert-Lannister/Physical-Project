function atm_tran = generateTransmittance()
    % Atmospheric transmittance
    atm_tran = 0.2 + (0.99 - 0.2) * rand();
end
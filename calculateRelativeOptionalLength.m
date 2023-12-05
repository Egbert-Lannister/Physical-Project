function m = calculateRelativeOptionalLength(Elev, zenith)
    % Relative optical length
    m = exp((-0.000118 * Elev) - (1.638*10e-9 * power(Elev,2)))/cos(zenith);
end
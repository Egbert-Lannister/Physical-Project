% Calculate amount of direct solar radiation dir 直接太阳辐射量
function dir = calculateDir(Elev, zenith, delta, latitude, phi)
    % Solar constant
    solar_constant = 1367;
    
    % Atmospheric transmittance
    atm_tran = 0.2 + (0.99 - 0.2) * rand();

    % Relative optical length
    m = exp((-0.000118 * Elev) - (1.638*10e-9 * power(Elev,2)))/cos(zenith);

    % Sky sector duration
    sun_dur = (2/15)*acos(-tan(delta)*tan(latitude));

    % The porosity of the solar graph sector 
    sun_gap = generatePorosity;

    AngIn = calculateSkySectionIncidenceAngle(zenith, h_theta, phi);

    % Amount of direct solar radiation dir
    dir = solar_constant*power(atm_tran,m)*sun_dur*sun_gap*cos(AngIn);
    dir = abs(dir);
end
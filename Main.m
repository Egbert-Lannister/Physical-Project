function Main

% This is the Main Function

% Calculate the Declination Angle delta
delta = calculateDeclinationAngle(year, month, day);

% Calculate the Hour Angle varphi
varphi = calculateHourAngle(longitude, hour);

% Calculate the sun's altitude Angle h_theta
h_theta = calculateAltitudeAngle(delta, varphi, latitude);

% Calculate zenith Angle zenith
zenith = calculateZenithAngle(h_theta);

% Calculate the azimuth Angle phi 
phi = calculateAzimuthAngle(h_theta, latitude, delta); 

% Calculate sky sector incidence Angle
AngIn = calculateSkySectionIncidenceAngle(zenith, h_theta, phi);

% Calculate relative optical length
m = calculateRelativeOptionalLength(Elev, zenith);

% Generate the atmospheric transmittance
atm_tran = generateTransmittance();

% Generate the porosity of the solar graph sector
sun_gap = generatePorosity();

% Calculate the amount of direct solar radiation dir
dir = calculateDir(delta, latitude, AngIn, atm_tran, m, sun_gap);

% Calculate the scattered radiation dif
dif = calculateDif(zenith, atm_tran, sun_gap, AngIn, m);

% Total solar radiation G_st
G_st = dir + dif;

% Calculate the power of solar
P_solar = calculateSolarPower(G_st);

% Calculate the power of cell
P_cell = calculateCellPower(T, dir, G_st);

% Calculate the efficiency
eta = P_cell/P_solar;

end
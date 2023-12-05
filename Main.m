% This is the Main Function

% input the date
year = input('Please input the year:');
month = input('Please input the month:');
day = input('Please input the day:');

% input the time hour
hour = input('Please input the hour:');

% input the longitude and latitude
longitude = input('Please input the longitude:');
latitude = input('Please input the latitude:');

% input the altitude
Elev = input('Please input the altitude:');

% input the temperature
T = input('Please input the temperature:');

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

disp('Total solar radiation G is');
disp(G_st);
disp('The power of solar is');
disp(P_solar);
disp('The power of cell is');
disp(P_cell);
disp('The efficiency of cell is');
disp(eta);

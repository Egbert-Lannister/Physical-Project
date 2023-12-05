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




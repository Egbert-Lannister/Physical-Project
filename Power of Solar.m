clear
clc

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

% Count days in the year

Leapyear = 0;
% Judge leap year
if mod(year,4) == 0
    if mod(year,100) == 0
        if mod(year, 400) ==0
            Leapyear = 1;
        else 
            Leapyear = 0;
        end
    else
        Leapyear = 1;
    end
end

date = 0;
mon = [31,28,31,30,31,30,31,31,30,31,30,31];
for i = 1:month - 1
    date = date + mon(i);
end
date = date + day;
if Leapyear == 1
    if month >= 3
        date = date + 1;
    end
end

% Calculate the Declination Angle delta 计算赤纬角
delta = 23.45*sin(2*pi*(284+date)/365);

% Calculate the Hour Angle varphi 计算时角
time_diff = (longitude - 120);
ST = hour + time_diff;
varphi = 15 * (ST - 12);

% Calculate the sun's altitude Angle h_theta 计算太阳高度角
h_theta = asin(sin(delta)*sin(varphi) + cos(delta)*cos(varphi)*cos(latitude));

% Calculate zenith Angle zenith 计算天顶角
zenith = (pi/2) - h_theta;

% Calculate the azimuth Angle phi 计算方位角
phi = acos((sin(h_theta)*sin(latitude)-sin(delta))/(cos(h_theta)*cos(latitude)));

% Solar constant
solar_constant = 1367;

% Atmospheric transmittance 大气透射率
atm_tran = 0.2 + (0.99 - 0.2) * rand();

% Relative optical length 相对光学长度
m = exp((-0.000118 * Elev) - (1.638*10e-9 * power(Elev,2)))/cos(zenith);

% Sky sector duration 太阳扇区持续时间
sun_dur = (2/15)*acos(-tan(delta)*tan(latitude));

% The porosity of the solar graph sector 太阳图扇区的孔隙度
sun_gap = 0.1 * rand();

% Sky sector incidence Angle 天空扇区入射角
AngIn = acos(cos(zenith)*cos(h_theta) + sin(zenith)*sin(h_theta)*cos(phi));

% Amount of direct solar radiation dir 直接太阳辐射量
dir = solar_constant*power(atm_tran,m)*sun_dur*sun_gap*cos(AngIn);
dir = abs(dir);

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

% Total solar radiation G
G = dir + dif;

% Photovoltaic cell area
A = 24;

% the power of solar
P_solar = A*G;

disp('Total solar radiation G is');
disp(G);
disp('The power of solar is');
disp(P_solar);


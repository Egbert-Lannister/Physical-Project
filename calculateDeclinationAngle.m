% Calculate the Declination Angle delta 计算赤纬角
function delta = calculateDeclinationAngle(year)
date = calculateNumofDay(year);
delta = 23.45*sin(2*pi*(284+date)/365);
end
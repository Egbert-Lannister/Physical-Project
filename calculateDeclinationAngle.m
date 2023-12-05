% Calculate the Declination Angle delta 计算赤纬角
function delta = calculateDeclinationAngle(year, month, day)
dayNum = calculateNumofDay(year, month, day);
delta = 23.45*sin(2*pi*(284+dayNum)/365);
end
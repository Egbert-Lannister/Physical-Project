% Calculate the Hour Angle varphi 计算时角
function varphi = calculateHourAngle(longitude)
    time_diff = (longitude - 120);
    ST = hour + time_diff;
    varphi = 15 * (ST - 12);
end
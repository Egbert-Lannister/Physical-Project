% Calculate the sun's altitude Angle h_theta
function h_theta = calculateAltitudeAngle(delta, varphi, latitude)
h_theta = asin(sin(delta)*sin(varphi) + cos(delta)*cos(varphi)*cos(latitude));
end
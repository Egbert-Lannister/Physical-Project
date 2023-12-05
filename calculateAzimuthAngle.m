% Calculate the azimuth Angle phi 
function phi = calculateAzimuthAngle(h_theta, latitude, delta)
phi = acos((sin(h_theta)*sin(latitude)-sin(delta))/(cos(h_theta)*cos(latitude)));
end
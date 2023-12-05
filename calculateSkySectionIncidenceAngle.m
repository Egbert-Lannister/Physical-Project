% Calculate sky sector incidence Angle
function AngIn = calculateSkySectionIncidenceAngle(zenith, h_theta, phi)
AngIn = acos(cos(zenith)*cos(h_theta) + sin(zenith)*sin(h_theta)*cos(phi));
end
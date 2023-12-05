% Calculate amount of direct solar radiation dir
function dir = calculateDir(delta, latitude, AngIn, atm_tran, m, sun_gap)
    % Solar constant
    solar_constant = 1367;

    % Sky sector duration
    sun_dur = (2/15)*acos(-tan(delta)*tan(latitude));

    % Amount of direct solar radiation dir
    dir = solar_constant*power(atm_tran,m)*sun_dur*sun_gap*cos(AngIn);
    dir = abs(dir);
end
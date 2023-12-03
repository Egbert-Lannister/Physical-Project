% input the temperature
T = 300.0; % 开尔文温度

% Output voltage
V_pv = 30;

% Resistance parameter
R_p = 10;
R_ph = 0.5;
R_s = 20;
R_diode = 80000;

q = 1.602e-19;
k = 1.381e-23;

G = 6.31983;
G_st = 10.7380;

% Calculate the standard test current value I_st
I_st = V_pv/(R_s + ((R_p*R_ph*R_diode)/(R_diode*R_ph+R_p*R_ph+R_p*R_diode)));

% Photoelectric effect short-circuit current
I_sc = (G/G_st)*I_st;

% Light intensity
I = G;

% Reverse saturation current value
I_rev = (-1)*((I*T)/(exp((q*V_pv)/(k*T)) - 1));

v = k*T/q;

% Output current
I_pv = I_sc - I_rev*(exp((q*v)/(k*T)) - 1);

% Photovoltaic cell power
P_cell = I_pv*V_pv;

P_solar = 257.7123;

% efficiency
eta = P_cell/P_solar;




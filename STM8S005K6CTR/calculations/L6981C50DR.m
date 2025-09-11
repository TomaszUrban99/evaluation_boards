% STMicroelectornics L6981C50DR
% Design of power components

% Data
Iout = 0.4; % Maximum DC output current
eta = 0.85; % Efficiency
Vin_max = 30; % Max input voltage [V]
Vout = 5; % Output voltage [V]

% Duty cycle
D = Vout / ( Vin_max * eta );

% Switching frequency [Hz]
fsw = 260 * 10^3;

% Current ripple
deltaIl = 0.3 * Iout;


% Input capacitor

% I RMS

% Inductor - minimum inductance
Lmin = (Vout * (Vin_max - Vout)) / (deltaIl * fsw * Vin_max);

% Schottky Diode

% Current rating [A]
If = Iout * ( 1 - D ); 
If_rated = If * 1.3;

% Maximum reverse voltage [V]
Vr = Vin_max * 1.25;

% Forward voltage [V]
Vf = 0.53; 

% Power dissipation [W]
PD = If_rated * Vf;

% Values
% Dissipated power: 222 mW
% Rated forward current: 418 mA
% Forward voltage: 530 mV
% Chosen Schottky Diode: PMEG6010CEJ,115

% Soft-start capacitor - Css
Iss = 4.5 * 10^(-6); % Soft-start current [A]
tss = 10 * 10^(-3); % Soft-start time [s]
Vssth = 0.63; % Soft-start threshold voltage [V]

Vin = 0:1:Vin_max;
Css = (Iss * tss) ./ (Vssth + 2.6 * ((Vout + Vf)./Vin));

% Calculated value between 33 nF and 1 uF - according to datasheet it is
% not recommended to use capacitor between those values - NO SOFT-START

ESR = 18 * 10^(-3);
deltaVout = ESR * deltaIl;
Cout = deltaIl / ( 8 * fsw * deltaVout );
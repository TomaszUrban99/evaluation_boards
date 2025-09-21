% STM8S005 - crystal calculation
fhse = 8 * 10^6; % HSE frequency [Hz]
C0 = 2 * 10^(-12); % Shunt capacitance [F]
CL = 8 * 10^(-12); % Load capacitance [F]
Cs = 5 * 10^(-12); % Stray capacitance [F]

ESR = 40; % [Ohm]
DL = 200 * 10^(-6); % Drive level [W]

% CL1 = CL2 - capacitance of one capacitor
CL1 = 2 * (CL - Cs); 

% Critical gm
gm_critical = (2 * pi * fhse)^2 * ESR * (2 * C0 + CL1)^2; 
% gm is >> than gm_critical

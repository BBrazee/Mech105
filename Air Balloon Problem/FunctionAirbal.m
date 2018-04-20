function [v, a, d,t] = FunctionAirbal()
% Function to find velocity and position of Hot Air Balloon
D = 17.3; %Diameter in meters
rho_air = 1.2; %kg/m^3
Area = 4*pi*(D/2)^2; %Area Ballon
Volume = (4/3)*pi*(D/2)^3; %Volume Balloon
Cd = 0.47; %Coefficent of Drag
Mp = 265; %Mass Payload
Pa = 101300; %Atmosphereic Pressure kg/(m*s^2)
Pb = Pa; %balloon pressure
R = 287; %Joules/kg (m^2/s^2)
T = 373.15; %Kelvin
g = 9.81; %m/s^2

rho_balloon = Pb/(R*T);
M_ab = rho_balloon*Volume;

F_b = rho_air*g*Volume;
F_g = M_ab*g;
F_p = Mp*g; 

%F_d = 0.5*rho_air*v^2*Area*Cd;

%total_force = F_b - F_d - F_g - F_p;
m = rho_air*g + M_ab + Mp;
a_init = (F_b - F_g - F_p)/m;

v = zeros(1,61);
a = zeros(1,61);
d = zeros(1,61);
t = 0:1:60;
a(1) = a_init;

for i=1:length(v)-1
    v(i+1)= v(i)+a(i)*0.1;
    a(i+1) = (F_b - F_g - F_p - (0.5*rho_air*v(i)*Area*Cd))/m;
    d(i+1) = d(i) + v(i)*1 + 0.5*a(i)*1^2;
end
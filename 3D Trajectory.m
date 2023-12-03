clear
clc
% Define parameter
R = 1; % radius
beta = 70;  
theta = 40;  
beta = beta * pi / 180;  
theta = theta * pi / 180;  
d = R * cos(beta); % Calculate the value of d
% Create phi values 
phi = linspace(0, 2 * pi, 100);  
% Calculatex, y 
x = R * sin(beta) * sin(phi);  
y = R * sin(beta) * cos(phi) * sin(theta) + d * cos(theta);  
% Calculate solar zenith angle
z = R * sin(beta) * cos(phi) * cos(theta) - d * sin(theta);  
  
% scatter3 is used to draw the origin and save the handle
scatter3(0, 0, 0, 'g', 'filled', 'DisplayName', 'Origin');  
hold on;

% Use plot3 to draw the plane and save the handle 
circle_x = R * cos(phi);  
circle_y = R * sin(phi);   
plot3(circle_x, circle_y, zeros(size(circle_x)), 'Color', 'cyan', 'DisplayName', 'Base Plane');  
grid on;
hold on;

  
% Create 3D graphics
plot3(x,y,z,'red');

hold on;

plot3(x(sign(z)<0),y(sign(z)<0),z(sign(z)<0),'blue');

hold on;

% Display legend
legend({'Origin', 'Base Plane', 'Day', 'Night'}, 'Location', 'northoutside' ...
    ,'NumColumns',4);
% Set graphic properties
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title("3D Trajectory");

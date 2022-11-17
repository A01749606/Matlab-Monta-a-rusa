clc, clear

% Datos
del_t = input("Dame el tamaño de paso del tiempo (s): ");
v0 = input("Dame la velocidad inicial (m/s): ");
x0 = 0;
g = 9.81;
y0 =(x0.^3/500) - (3*x0.^2)/35 + 3*cos((2*3.141592*x0)/15) + 30;
t = del_t;

% Vía
x_via = 0:35;
y_via =(x_via.^3/500) - (3*x_via.^2)/35 + 3*cos((2*3.141592*x_via)/15) + 30;
hold on;
plot(x_via,y_via);


% Punto que se mueve
carro = plot(NaN, NaN, 'db');
box on;
grid on;

% Gráfica
while x0 <= 35

    % Velocidad y posición
    % v = sqrt((v0.^2)-2*g(0-y0));
    xn = x0 + v0 * t;
    y =(xn.^3/500) - (3*xn.^2)/35 + 3*cos((2*3.141592*xn)/15) + 30;
    x0 = xn;
    t = t + del_t;

    fprintf("%f = %f , %f \n", t, xn, y)

    %set(carro, 'XData', xn, 'YData', y);
    plot(xn,y,'db');
    drawnow
    
end
hold off;





% X(i+1) = X(i)+V delta t
% X(i+1) = X(i) + (delta x)cos Angulo
% Angulo = Arctan(f'(x))
% Y(i+1) = f(x(i+1))
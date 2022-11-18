clc, clear
% Sacar velocidad negativa
% Que se dejen de ver los puntos anteriores

% Datos
g = 9.81;

del_t = input("Dame el tamaño de paso del tiempo (s): ");
t = del_t;

v0 = input("Dame la velocidad inicial (m/s): ");

x0 = 27;
y0 = (x0.^3/500) - (3*x0.^2)/35 + 3*cos((2*3.141592*x0)/15) + 30;
yn = 0;



% Vía
x_via = 0:40;
y_via =(x_via.^3/500) - (3*x_via.^2)/35 + 3*cos((2*3.141592*x_via)/15) + 30;
hold on;
plot(x_via,y_via);


% Gráfica
box on;
grid on;

while x0 <= 35
    
    
    % Velocidad y posición
    v = sqrt( (v0.^2) - (2*g) * (yn-y0) );
    xn = x0 + v * t;
    yn = (xn.^3/500) - (3*xn.^2)/35 + 3*cos((2*3.141592*xn)/15) + 30;

    % Actualizar valores de variables
    v0 = v;
    x0 = xn;
    y0 = yn;
    t = t + del_t;

    fprintf("%f = %f , %f \n", t, xn, yn)

    % Punto que se mueve
    carro = plot(xn,yn,'db');
    drawnow
    pause(t/10)
    
    
end
hold off;





% X(i+1) = X(i)+V delta t
% X(i+1) = X(i) + (delta x)cos Angulo
% Angulo = Arctan(f'(x))
% Y(i+1) = f(x(i+1))

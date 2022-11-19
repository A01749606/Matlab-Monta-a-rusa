clc, clear
% Falta velocidad negativa

% Datos
g = 9.81;

del_t = input("Dame el tamaño de paso del tiempo (s): ");
t = del_t;

v0 = input("Dame la velocidad inicial (m/s): ");

xprima0 = 0;
xn = 0;
y0 = (xprima0.^3/500) - (3*xprima0.^2)/35 + 3*cos((2*3.141592*xprima0)/15) + 30;
yn = 0;



% Vía
x_via = 0:40;
y_via =(x_via.^3/500) - (3*x_via.^2)/35 + 3*cos((2*3.141592*x_via)/15) + 30;
hold on;
plot(x_via,y_via);


% Gráfica
box on;
grid on;

while xn <= 34
    
    % Velocidad y posición en la vía
    v = sqrt( (v0.^2) - (2*g) * (yn-y0) );
    xpriman = xprima0 + v * t;


    % Angulo de posición
    syms x
    y = (x.^3/500) - (3*x.^2) / 35 + 3*cosd(2*pi*x/15) + 30;
    derivada = diff(y);  
    subs(derivada, x, 0.01);
    ang = double( atand(subs(derivada,x,0.01)) );


    % Desplazamiento real del carrito
    xn=xprima0+(xpriman-xprima0)*cosd(ang);
    yn = (xn.^3/500) - (3*xn.^2)/35 + 3*cos((2*3.141592*xn)/15) + 30;


    % Actualizar valores de variables
    v0 = v;
    x0 = xn;
    y0 = yn;
    t = t + del_t;


    % Imprimir Valores de tiempo y posición
    fprintf("%f = %f , %f \n", t, xn, yn)

    % Punto que se mueve
    carro = plot(xn,yn,'db');
    drawnow
    pause(t/100)
    delete(carro);
    
    
end
hold off;
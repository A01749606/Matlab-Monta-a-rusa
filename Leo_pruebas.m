clear, clc
% Falta velocidad negativa

% Datos
g = -9.81;
m = 10;

del_t = input("Dame el tamaño de paso del tiempo (s): ");
t = del_t;

v0 = input("Dame la velocidad inicial (m/s): ");

xprima0 = input("Dame la posición inicial (m): ");
xn = 0;
yn = (xprima0.^3/500) - (3*xprima0.^2)/35 + 3*cos((2*3.141592*xprima0)/15) + 30;
y0 = yn;
h0 = 5.85;
h = yn;



% Vía
x_via = 0:40;
y_via =(x_via.^3/500) - (3*x_via.^2)/35 + 3*cos((2*3.141592*x_via)/15) + 30;
hold on;
plot(x_via,y_via,'r');


% Gráfica
box on;
grid on;

while xn <= 34.99


    %Energías
    Ek = 0.5*m*v0^2;
    Ep = m*g*(h-h0);   
    %fprintf("%f, %f\n",Ep, Ek);
    

    % Velocidad
    raizv = (v0.^2) + (2*g) * (h-h0);

    if raizv > 0
       v = sqrt(raizv);
       disp("pos")
    
    else
       v = sqrt(abs(raizv))*-1;
       disp("neg")
    
    end


    % Angulo de posición
    syms x
    y = (x.^3/500) - (3*x.^2) / 35 + 3*cosd(2*pi*x/15) + 30;
    derivada = diff(y);  
    subs(derivada, x, 0.01);
    ang = double( atand(subs(derivada,x,0.01)) );
    fprintf("θ=%f\n", ang)


    % Desplazamiento real del carrito
    xpriman = xprima0 + v * t;
    xn = xprima0 + (xpriman - xprima0)*cosd(ang);
    yn = (xpriman.^3/500) - (3*xpriman.^2)/35 + 3*cos((2*3.141592*xpriman)/15) + 30;


    % Actualizar valores de variables
    v0 = v;
    x0 = xn;
    y0 = yn;
    t = t + del_t;


    % Imprimir Valores de velocidad, tiempo y posición
    %(t= %f , t)
    fprintf("posx= %f vel= %f \n", xn, v)

    % Punto que se mueve
    carro = plot(xpriman,yn,'db');
    drawnow
    pause(t/100)
    delete(carro);
    
    
end
hold off;

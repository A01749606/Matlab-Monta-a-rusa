clear, clc
% Datos
g = 9.81;
m = 100;
del_t = .03;
t = del_t;
v0 = -40;
v = v0;
xn = 34;
x0 = xn;
xprima0 = 0;
yn = (x0.^3/500) - (3*x0.^2)/35 + 3*cos((2*3.141592*x0)/15) + 30;
y0 = yn;
mu = 1.5;
k = 3;
r0 = 100000;

% Vía
x_via = 0:40;
y_via =(x_via.^3/500) - (3*x_via.^2)/35 + 3*cos((2*3.141592*x_via)/15) + 30;
hold on;
plot(x_via,y_via,'r');
box on;
grid on;

while xn <= 34.99

    % Pre_velocidad
    syms x
    y = (x^3/500) - (3*x^2) / 35 + 3*cosd(2*pi*x/15) + 30;
    derivada = diff(y);
    dobledev= diff(y,'x',2);
    ang = double(atand(subs(derivada,x,xn)));

    rn = ((1+double(subs(derivada,x,xn))^2)^3/2)/double(subs(dobledev,x,xn));

    fric = g*cos(ang)+(v0.^2/r0);
    fric = mu*sign(fric);
    if rn == 0
        rn = 100000000000;
    end

    % Desplazamiento del carrito
    xpriman = xprima0 + v * del_t;
    xn = x0 + (xpriman - xprima0)*cosd(ang);
    yn = (xn.^3/500) - (3*xn.^2)/35 + 3*cos((2*3.141592*xn)/15) + 30;


    % Velocidad
    raizArriba1 = (v0.^2*(1-((fric/r0)+(k/m))*(abs(xpriman-xprima0))));
    raizArriba2 = (2*g*(yn-y0))-(2*g*fric*(abs(xn-x0)));
    raizArriba = raizArriba1 - raizArriba2;
    raizAbajo = (1+((fric/rn)+(k/m))*(abs(xpriman-xprima0)));
    raizv = raizArriba/raizAbajo;
    

    if raizv > 0
        v = sign(v0)*sqrt(raizv);

    elseif raizv <= 0
         v = -v0;
         xpriman = xprima0;
         xn = x0;
         yn = y0;
         rn = r0;
    end

    % Actualiza
    v0 = v;
    x0 = xn;
    xprima0 = xpriman;
    y0 = yn;
    r0 = rn;

    % Punto que se mueve
    carro = plot(xn,yn,'db');
    drawnow
    pause(t/10)
    delete(carro);

end
hold off;
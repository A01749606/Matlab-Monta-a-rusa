clc, clear
% Función de la montaña rusa
x = 0:50;
y =(x.^3/500) - (3*x.^2)/35 + 3*cos((2*3.141592*x)/15) + 30;
plot(x,y)

% Datos
del_t = input("Dame el tiempo: ");
masa = input("Masa (kg): ");
v0 = input("Velocidad inicial: ");
% fric = input("Fricción: ");
% drag = input("Coeficiente de arrastre: ");

%% Animación
x = 0:50;
y =(x.^3/500) - (3*x.^2)/35 + 3*cos((2*3.141592*x)/15) + 30;

%% Animated Figure
figure;
hold on;
plot(x,y);
plot(x(1),y(1),'db');
axis([min(x) max(x) min(y) max(y)]);
xlabel('X', 'Interpreter','Latex');
ylabel('Y', 'Interpreter','Latex');
grid on;
box on;
hPlot = plot(NaN, NaN, 'db');
for k = 2:length(x) %loop
    set(hPlot, 'XData', x(k), 'YData', y(k));
    drawnow
end
hold off;


% X(i+1) = X(i)+V delta t
% X(i+1) = X(i) + (delta x)cos Angulo
% Angulo = Arctan(f'(x))
% Y(i+1) = f(x(i+1))
clc; close all;

r     = [0; 100; 0];
v     = [0;   0; 0];
omega = deg2rad([0; 0; 0]);
phi   = deg2rad([0; 0; 0]);

time = 0:0.1:10;

[T, Y] = ode45(@model_ode, time, [r; v; omega; phi]);

figure(1);
plot(T, Y(:,1), T, Y(:,2), T, Y(:,3));
grid on;
%axis([0 10 0 100])
title('����������� ���������� �� �������');
xlabel('�����, �'); 
ylabel('����������, �');

figure(2);
plot(T, Y(:,4), T, Y(:,5), T, Y(:,6));
grid on;
%axis([0 10 0 100])
title('����������� �������� �� �������');
xlabel('�����, �'); 
ylabel('��������, �/�');

figure(3);
plot(T, Y(:,7), T, Y(:,8), T, Y(:,9));
grid on;
%axis([0 10 0 100])
title('����������� ������� �������� �� �������');
xlabel('�����, �'); 
ylabel('������� ��������, ���/�');

figure(4);
plot3(Y(:,1), Y(:,2), Y(:,3))
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
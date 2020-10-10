%-----Mathematics for Data science-----%
%------------ Homework 1 --------------%

clear
clc
close all
% f(x)=x^2 , -10<=x<=10
figure('name','Plot of f(x)=x^2')
x=-10:0.1:10;
y=x.^2;
plot(x,y,'LineWidth',2)
set(gca,'Color','c')
hold on 
area(x,y,'FaceColor','white');
title('f(x)=x^2')
xlabel('x-axis');ylabel('y=x^2')
%%
% f(x)=sin(x) , -2*pi<=x<=2*pi
figure('name','Plot of f(x)=sin(x)')
x=-2*pi:0.1:2*pi;
area(x,sin(x));title('f(x)=sin(x)');xlim([-2*pi 2*pi])
xlabel('x-axis');ylabel('y=sin(x)');grid on
%%
% f(x,y)=(x*y)^2 , -10<=x<=10 & -10<=y<=10
figure('name','Plot of f(x,y)=(x*y)^2')
[x,y]=meshgrid(-10:0.1:10);
z=(x.*y).^2;
mesh(x,y,z)
%shading interp
colorbar
zlim([-5000,10000])
xlabel('x-axis');ylabel('y-axis');zlabel('z=(x*y)^2');title('f(x,y)=(x*y)^2')
%%
% contour of f(x,y)=(x*y)^2 , -10<=x<=10 & -10<=y<=10
figure('name','Contour Plot of f(x,y)=(x*y)^2')
contourf(x,y,z,20);title('Contour plot of f(x,y)=(x*y)^2')
xlabel('x-axis');ylabel('y-axis')

 

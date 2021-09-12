clc
close all

%%
syms t1 t2 c l1 l2 l3
x = (l1*cos(t1) + l2*cos(t1+t2) + l3*cos(t1+t2+(180-t2-c)));
y = (l1*sin(t1) + l2*sin(t1+t2) + l3*sin(t1+t2+(180-t2-c)));

J = jacobian([x,y],[t1,t2])

syms th1(t) th2(t) t

q = [diff(th1(t),t) ; diff(th2(t),t)];

x = J * q
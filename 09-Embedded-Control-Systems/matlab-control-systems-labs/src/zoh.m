clc,clear;
syms s
h = tf ([0,4],[1,4])
Ts = 0.1
Hd = c2d(h,Ts, 'zoh')


syms s
x = tf ([0,0,2],[1,3,2])
Ts = 0.1
Xd = c2d(x,Ts, 'zoh')


syms s
y = tf ([0,0,60],[1,-1,-6])
Ts = 0.1
Yd = c2d(y,Ts, 'zoh')


syms s
z = tf ([0,0,2],[1,6,8])
Ts = 0.1
Zd = c2d(z,Ts, 'zoh')


syms s
k = tf ([0,2],[1,4])
Ts = 0.1
Kd = c2d(k,Ts, 'zoh')

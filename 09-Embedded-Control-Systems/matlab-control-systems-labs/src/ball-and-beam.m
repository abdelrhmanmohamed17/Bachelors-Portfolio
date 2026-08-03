clc,clear;
syms s
% 1
sys = tf ([-0.8054,4204,1.444*10^6],[1,469.1,3.676*10^4,1.356*10^6])
pid_test=pidtune(sys,'pid')
k=tf ([0.0133,2.37,94.5],[0,1,0])
T2 = series(sys,k) 
T = feedback(T2,1)


info_Before=stepinfo(5*sys)
info_After=stepinfo(5*T)


f=(-0.8054*s^2 + 4204*s + 1.444*10^6)/(s^3 + 469.1*s^2 + 36760*s +1.356*10^6 );
Before_in_Z=ztrans(f)

a=(2.37+94.5/s+0.0133*s)
Pid_in_Z=ztrans(a)

w=(-0.01071*s^4+54*s^3+2.909e04*s^2+3.82e06*s+1.365e08)/(0.9893*s^4+523.1*s^3+6.585e04*s^2+5.176e06*s+1.365e08)
Total_func_in_Z=ztrans(w)


rlocus(5*sys)
rlocus(5*T)


SP=5;
[y,t]=step(SP*sys); %get the response of the system to a step with amplitude SP
sserror=abs(SP-y(end)) %get the steady state error
SP=5;
[y,t]=step(SP*T); %get the response of the system to a step with amplitude SP
sserror2=abs(SP-y(end)) %get the steady state error


step(5*sys)
step(5*T)


pzplot(sys)
pzplot(T)


Before_Stability=isstable(5*sys)
After_Stability=isstable(5*T)


%zoh
Ts = 0.1
Hd = c2d(sys,Ts, 'zoh')

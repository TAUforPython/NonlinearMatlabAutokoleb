U=0;
%               variant 1
Usr = 0.005;    Udv=110;    Te=0.05;    Tdv=0.2;    Kd=0.03;
Ke=24;          Kdv=11;     Kr=0.03;

%               variant 2
% Usr = 0.0045;    Udv=110;    Te=0.045;    Tdv=0.17;    Kd=0.025;
% Ke=20;          Kdv=10;    Kr=0.027;


% %               variant 4
% Usr = 0.0035;    Udv=110;    Te=0.035;    Tdv=0.12;    Kd=0.015;
% Ke=15;          Kdv=7;    Kr=0.019;


% %               variant 5
% Usr = 0.003;    Udv=110;    Te=0.03;    Tdv=0.1;    Kd=0.01;
% Ke=12;          Kdv=5.5;    Kr=0.015;



%               variant 6
% Usr = 0.0025;   Udv=110;    Te=0.025;    Tdv=0.085;    Kd=0.008;
% Ke=10;          Kdv=4;    Kr=0.013;

% %               variant 7
% Usr = 0.002;   Udv=110;    Te=0.02;    Tdv=0.075;    Kd=0.0075;
% Ke=9;          Kdv=5.5;    Kr=0.011;

m=0;


b=Usr/Kd;
C=Udv*Kdv*Kr;


tp=-log(Te/Tdv)*Tdv*Te/(-Te+Tdv);
h_tp=(-Tdv*exp(-tp/Tdv)+Te*exp(-tp/Te))/(-Te+Tdv)+1;
dh_tp = (exp(-tp/Tdv)-exp(-tp/Te))/(-Te+Tdv);
Tekv = 1/dh_tp;
tau=tp-h_tp/dh_tp;

% b=0.75; C=125; k=0.04; T=0.1;
% W=tf([k],[T 1])*tf([1],[1 0]);
% for xi=0.5:0.1:0.8,
% W=tf([k],[T xi*2*T+1 xi]);
% nyquist(W);
% hold on;
% end;


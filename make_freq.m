function fgu;
LoadSys;
figure;
%---------- Frequency analysis ------------------------------------------
W=tf([1],[Tdv 1])*tf([1],[Te 1])*tf([1],[1 0]);
nyquist(W,[8:0.1:50]);
hold on;
a=0.3:0.05:3; 
plot(real(-1./(q(a,C,b)+i*q1(a,C,b))),imag(-1./(q(a,C,b)+i*q1(a,C,b))),'LineWidth',2);
clear a;
a=0.3:0.4:1.5; 
plot(real(-1./(q(a,C,b)+i*q1(a,C,b))),imag(-1./(q(a,C,b)+i*q1(a,C,b))),'.','MarkerSize',15);
for j=1:1:length(a)
    xy = -1./(q(a(j),C,b)+i*q1(a(j),C,b));
    txt_str=num2str(a(j));
    txt_str=strcat('a = ',txt_str);
    text(real(xy(length(xy))),imag(xy(length(xy)))-imag(xy(length(xy)))/4,txt_str,'Fontsize',10);
    hold on;
end;


function x=Wfreq(a,w)
LoadSys;
x = (Tdv.*i.*w+1).*(Te.*i.*w+1).*(i.*w) + q(a,C,b) + i.*q1(a,C,b);

function x=q(a,C,b)
m=0;
x=2.*C./pi./a.^2.*(sqrt(a.^2-b.^2)+sqrt(a.^2-(m.*b).^2));

function x=q1(a,C,b)
m=0;
x = -2.*C.*b.*(1-m)./pi./a.^2;


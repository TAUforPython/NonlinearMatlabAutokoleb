function mikhaylov_setka;
LoadSys;
figure;
%--------- find a and w for stable oscilatior loop ----------------
w = linspace(8, 12, 10);
a = linspace(1, 3, 10);

for i=1:1:length(a)
    xy=Wfreq(a(i),w);
    plot(xy);
    txt_str=num2str(a(i));
    txt_str=strcat('a = ',txt_str);
    text(real(xy(length(xy))),imag(xy(length(xy))),txt_str,'Fontsize',12);
    hold on;
end;
for i=1:1:length(w)
    xy=Wfreq(a,w(i));
    plot(xy);
    txt_str=num2str(w(i));
    txt_str=strcat('w = ',txt_str);
    text(real(xy(length(xy))),imag(xy(length(xy))),txt_str,'Fontsize',12);
    hold on;
    
end;
grid;


function x=Wfreq(a,w)
LoadSys;
x = (Tdv.*i.*w+1).*(Te.*i.*w+1).*(i.*w) + q(a,C,b) + i.*q1(a,C,b);

function x=q(a,C,b)
m = 0.25;
x = 2.*C./pi./a.^2.*(sqrt(a.^2 - b.^2) + sqrt(a.^2 - (m.*b).^2));

function x=q1(a,C,b)
m = 0.25;
x = -2.*C.*b.*(1-m)./pi./a.^2;

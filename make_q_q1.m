function fgu;
LoadSys;

%------------------ plot q(a,w) and q1(a,w) -------------------------
figure;
a=b:0.01:4*b;
plot(a,q(a,C,b));
xlabel('гмювемхе юлокхрсдш бундмнцн яхцмюкю');
ylabel('гмювемхе тсмйжхх q(a,w)');
grid
figure;
a=b*0.5:0.01:4*b;
plot(a,q1(a,C,b));
xlabel('гмювемхе юлокхрсдш бундмнцн яхцмюкю');
ylabel('гмювемхе тсмйжхх q1(a,w)');
grid

function x=Wfreq(a,w)
LoadSys;
x = (Tdv.*i.*w+1).*(Te.*i.*w+1).*(i.*w) + q(a,C,b) + i.*q1(a,C,b);

function x=q(a,C,b)
m=0.25;
x=2.*C./pi./a.^2.*(sqrt(a.^2-b.^2)+sqrt(a.^2-(m.*b).^2));

function x=q1(a,C,b)
m=0.25;
x = -2.*C.*b.*(1-m)./pi./a.^2;


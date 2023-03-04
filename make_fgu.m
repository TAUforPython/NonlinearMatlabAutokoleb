function make_fgu;
LoadSys;
figure;
% --------------------  FGU --------------
W = tf([1],[Tdv 1])*tf([1],[Te 1])*tf([1],[1 0]);

w = linspace(8, 15, 10);
a = linspace(1, 3, 10);

[mag_2d,phase_2d,w] = bode(W,w);
j = 1:1:length(mag_2d);
mag(j) = mag_2d;
phase(j) = phase_2d;
subplot(2,1,1);
M = -1./( q(a,C,b) + i*q1(a,C,b) );
fi = angle(M).*180./pi;

w_fi = w;

% for k=length(a):-1:1
%     ind_zero = find( (mag-(abs(M(k)))) <=0);
%     w_fi(k)=w(ind_zero(1));
% end;

axis([min(w) max(w) min(20*log10(abs(M))) max(20*log10(abs(M)))]);
hold on;
xlabel('частота'); 
ylabel('L');
for k=1:1:length(a)
    M = -1./(q(a(k),C,b)+i*q1(a(k),C,b));
    semilogx([min(w) max(w)],[20*log10(abs(M)) 20*log10(abs(M))],'--');
    hold on;
    semilogx(w,20*log10(mag),'lineWidth',3);
    txt_num = num2str(a(k));
    text(max(w)+0.1,20*log10(abs(M)),txt_num);
end;
subplot(2,1,2);
axis([min(w) max(w) min(fi) max(fi)]);
hold on;
xlabel('частота'); 
ylabel('фаза');

for k=1:1:length(a)
    M = -1./(q(a(k),C,b)+i*q1(a(k),C,b));
    semilogx([min(w) max(w)],[fi(k) fi(k)],'--');
    semilogx(w,phase,'lineWidth',3);
    hold on;
    semilogx(w_fi,fi); hold on;
    txt_num = num2str(a(k));
    text(max(w)+0.1,fi(k),txt_num);
    text(w_fi(length(w_fi)/2),fi(length(fi)/2),'ФГУ');
end;

function x = Wfreq(a,w)
LoadSys;
x = (Tdv.*i.*w+1).*(Te.*i.*w+1).*(i.*w) + q(a,C,b) + i.*q1(a,C,b);

function x = q(a,C,b)
m = 0.25;
x = 2.*C./pi./a.^2.*(sqrt(a.^2 - b.^2) + sqrt(a.^2 - (m.*b).^2));

function x = q1(a,C,b)
m = 0.25;
x = -2.*C.*b.*(1 - m)./pi./a.^2;

clc

a=input('Masukkan batas bawah x : ');
b=input('Masukkan batas atas x : ');
galat1=input('Masukkan galat Toleransi : ');
Cobs = 23.508;
s0 = 27.7;
k = 20;
r = 0.0250;
T = 0.6667;
Nd1 = normcdf(log(s0/k)+(r + 0.5 *a^2)*T)/a*sqrt(T);
Nd2 = normcdf(log(s0/k)+(r - 0.5 *a^2)*T)/a*sqrt(T);

f= @ (x) Cobs -(s0*Nd1 - k .* (exp(1).^(-r)*T)*Nd2);
% f = @(x) 6502 *x  + (x-50)/x * (882000) - 625485
% Algoritma
init=[a,b];
ya=f(a) ;  %Nilai f(a)
yb=f(b);   %Nilai f(b)
iter=0;
xm1=a;
galat=abs((b-a)/b);
while ya*yb>0
    disp('Ingat f(a) *f(b)>0, berarti tidak ada akar dalam selang '),
    break,
end
fprintf('\n \titerasi      \t\ta            \tb             \t\txm           \t\tf(xm)        \t\t Galat\n');
while galat>galat1
    iter=iter+1;
    xm= (a+b)/2;
    yxm=f(xm);
    a1=a;b1=b;  %inisialisasi untuk tampilan
    while yxm==0, break,
    end
    if ya*yxm<0
        b=xm;
        yb=yxm;
    else
        ya=yxm;
    end
    galat=abs((xm-xm1)/xm);
    xm1=xm;
    fprintf('\t%10.0f     \t%6.10f    \t%6.10f      \t%6.10f    \t %6.10f       \t%6.10f\n',[iter;a1;b1;xm;yxm;galat]);
end
fprintf('Akhirnya Adalah = %6.10f\n',xm);
xx=linspace(init(1),init(2),100);
yy=f(xx);
% Plot kurva dan titik estimasi
figure(1)
plot(xx,yy)
hold on
grid on
scatter(xm1,f(xm1),'filled','p')
plot(xx,zeros(length(xx),1))
xlabel('x')
ylabel('Implied volatility')
legend('p(c)','akar persamaan','garis f(c)=0')


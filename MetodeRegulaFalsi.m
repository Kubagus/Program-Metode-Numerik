clc
a=input('Masukkan batas bawah x : ');
b=input('Masukkan batas atas x : ');
galat1=input('Masukkan galat Toleransi : ');
f= @(x) (2*x+1).^3;
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
fprintf('\n iterasi      \ta            \tb             \txm           \tf(xm)         Galat\n');
while galat>galat1  
    iter=iter+1;
    xm=b-((yb*(b-a))/(yb-ya));
    yxm=f(xm);
    a1=a;b1=b;  %inisialisasi untuk tampilan
    while yxm==0, break,
    end
        if ya*yxm<0
            b=xm;
            yb=yxm;
        else 
            a=xm;
            ya=yxm;
        end
    galat=abs((xm-xm1)/xm);
    xm1=xm;  
    fprintf('%10.0f     %6.10f    %6.10f      %6.10f     %6.10f       %6.10f\n',[iter;a1;b1;xm;yxm;galat]);
end
fprintf('Akarnya Adalah = %6.10f\n',xm);
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
ylabel('f(x)')
legend('f(x)','akar persamaan','garis f(x)=0')
title(sprintf('Ahmad Kubagus Subkhi\nMetode Regulasi Falsi\nAkarnya adalah = %.8f', xm1))


clc
a=0;
b=1;
galat=0.001;
f=inline('(2*x+1).^3');
iterasi=1;
disp('  i       a          b         fa        fb         x       fx');
x= a-f(a)*((b-a)/(f(b)-f(a)));
while (b-a)>galat
    disp(sprintf('%3g %10.7f %10.7f %10.7f %10.7f %10.7f %10.7f',iterasi,a,b,f(a),f(b),x,f(x)))
    if f(a)*f(x)<0
        b=x;
%         f(b) = eval(subs(y,x,b));
    else
        a=x;
%         fa = eval(subs(y,x,a));
    end
    if f(a)*f(b)==0
       disp(sprintf('',x));
    end
    iterasi=iterasi+1;
    
    if iterasi == 31
        break
    end
end
disp(sprintf('Hasil Akar=%11.8f',x))
xg=linspace(-7,7);
yg=f(xg);
plot(xg,yg)
grid on
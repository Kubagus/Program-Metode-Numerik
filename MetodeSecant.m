function x = MetodeSecant(f,x0,x1,n,tol)
% int i; % menyelesaikan persoalan f(x) = 0 dengan Metode Secant
fa=f(x0); % f=fungsi yang akan dicari akarnya, x0=nilai awal,x1=nilai akhir
fb=f(x1); % n=jumlah iterasi, tol=nilai toleransi
i=0;
fprintf('\n iterasi      a            f(a)\n');
while abs(x0-x1) > tol % lakukan sampai toleransi tercapai
fa=f(x0);
fb=f(x1);
if fa == 0 or i=n
return % stops the program if f(x) = 0
end
x = x1 - fb.*(x1-x0)./(fb-fa); % rumus Newton
% disp([i x fa]); % menampilkan hasil hitungan
fprintf('%10.0f\t%f\t%f\n',i,x,fa);
x0=x1;
x1=x;
i=i+1;      
end
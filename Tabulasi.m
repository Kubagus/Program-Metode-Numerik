clc
fprintf(' x f(x) tanda\n');
fprintf('------------------\n');
i=1;beda=0.01;
for x=0:beda:1;
    f=6502 * x + (x-50)/x * (882000) - 625485;
    fprintf('%3.1f %6.3f',x,f);
    if sign(f)< 0
        tanda(i)='-';
        fprintf(' %s\n',tanda(i));
    else
        if sign(f)> 0
        tanda(i)='+';
        fprintf(' %s\n',tanda(i));
        else
        tanda(i)='0';
        fprintf(' %s\n',tanda(i));
        end; 
    end; 
    i=i+1;
end;
i=1;
for x=0:0.1:1;
    if tanda(i)=='0'
        fprintf('Akarnya adalah = %6.4f\n',x);
        else
        if i >1 
            if tanda(i)~= tanda(i-1)
                a=x-beda;
                b=x;
                fprintf('Akar ada di interval [%3.1f, %3.1f]\n', a,b);
            end;
        end;
    end;
    i=i+1;
end
function sigma=impvol(~,S,K,r,T)

%F=S*exp((r).*T);
%G=C.*exp(r.*T);

%alpha=log(F./K)./sqrt(T);
%beta=0.5*sqrt(T);

%a=beta.*(F+K);
%b=sqrt(2*pi)*(0.5*(F-K)-G);
%c=alpha.*(F-K);

%disc=max(0,b.^2-4*a.*c);
%sigma0=(-b+sqrt(disc))./(2*a);

i=-1000;
while i<=5000
    sigma0=i/1000;
    sigma=NewtonMethod(sigma0);
    if sigma<=10 && sigma>=-10
        fprintf('This is sigma %f',sigma)
    end
    i=i+1;
end
end

function s1=NewtonMethod(s0)

s1=s0;
count=0;
f=@(x) call(S,K,r,x,T)-C;
fprime=@(x) call_vega(S,K,r,x,T);

max_count=1e4;

while max(abs(f(s1)))>1e-7 && count<max_count
    count=count+1;
    s0=s1;
    s1=s0-f(s0)./fprime(s0);
    
end

end

function d=d1(S,K,r,sigma,T)
d=(log(S./K)+(r+sigma.^2*0.5).*(T))./(sigma.*sqrt(T));
end

function d=d2(S,K,r,sigma,T)
d=(log(S./K)+(r-sigma.^2*0.5).*(T))./(sigma.*sqrt(T));
end

function p=Phi(x)
p=0.5*(1.+erf(x/sqrt(2)));
end

function p=PhiPrime(x)
p=exp(-0.5*x.^2)/sqrt(2*pi);
end

function c=call(S,K,r,sigma,T)
c=S.*Phi(d1(S,K,r,sigma,T))-K.*exp(-r.*(T)).*Phi(d2(S,K,r,sigma,T));
end

function v=call_vega(S,K,r,sigma,T)
v=S.*PhiPrime(d1(S,K,r,sigma,T)).*sqrt(T);
end

function IV= secondIVcalc(HestonC,S,K,r,q,T)
lowCdif = 1;
a=0;
while lowCdif>0.0001
    a= a+0.00001
    lowCdif = HestonC - BSCprice(S,K,r,q,a,T);
end
IV= a;
end
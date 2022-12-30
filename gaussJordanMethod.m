clc 
clear 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 1: Menginput Matriks A dan Vektor b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=input('Masukkan Matriks A = ');
b=input('Masukkan Matriks b = ');
x=[A b]; 
np=size(A); 
n=np(1); 
for k=1:n; 
for m=k+1:n+1; 
 x(k,m)=x(k,m)/x(k,k); 
end
 x(k,k)=1; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 2: Proses Reduksi Baris
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for l=1:n; 
if l~=k; 
for m=k+1:n+1; 
 x(l,m)=x(l,m)-x(l,k)*x(k,m); 
end
 x(l,k)=0; 
end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 3: Output penyelesaian
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Solusi Sistem Persamaan Linear dari Matriks A * x = b ') 
x
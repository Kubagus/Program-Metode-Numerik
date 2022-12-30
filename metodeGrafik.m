clc

disp('===============')
disp('|Metode Grafik|') 
disp('===============')

disp('Nama : Ahmad Kubagus Subkhi') 
disp('NIM	: C2C021064')
disp('Kelas : Reguler B')

xa=input('Masukkan nilai bawah = ') 
xb=input('Masukkan nilai atas = ')

x = [xa:xb]

fx = input('Masukkan Fungsi (x) = ') 
fprintf('%3f \n',fx);

plot(x,fx)

title('Grafik (2*x+1).^3 (Metode Grafik)') 
xlabel('Sumbu x')
ylabel('Sumbu y') 
grid on

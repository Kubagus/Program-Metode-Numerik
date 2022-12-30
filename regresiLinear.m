X=input('masukan data untuk variabel X = ');
Y=input('masukan data untuk variabel Y = ');
plot(X,Y,'b*')
title('Diagram Pancar')
xlabel('Jumlah Penduduk')
ylabel('Jumlah Angkatan Kerja')
b=((length(X))*(sum(X.*Y))-(sum(X))*(sum(Y)))/((length(X))*(sum(X.^2))-((sum(X))^2));
disp(' ')
a=(mean(Y))-(b*mean(X));
disp(' ')
r=((length(X))*(sum(X.*Y))-(sum(X))*(sum(Y)))/(sqrt((length(X))*(sum(X.^2))-((sum(X))^2))*sqrt((length(Y))*(sum(Y.^2))-((sum(Y))^2)));
r2=r^2;
disp('-Uji Kelayakan Model-')
disp(' ')
disp('Uji Hipotesis :')
disp([' Ho : b = 0 (persamaan regresi tidak layak digunakan)'])
disp([' H1 : b tidak sama dengan 0 (persamaan regresi layak digunakan)'])
disp(' ')
disp(['Tingkat signifikansi = 0,05'])
disp(' ')
disp(['Statistik Uji :'])
disp(' ')
mse=(sum(Y.^2)-a*(sum(Y))-b*sum(X.*Y))/(length(Y)-2);
S_b=sqrt(mse/sum((X-(mean(X))).^2));
t_hitung_b=b/S_b;
disp([' t_hitung = ',num2str(t_hitung_b)])
t_tabel = tinv(0.975,length(X)-2);
disp(' ')
disp('Daerah kritik')
disp(['Ho ditolak jika |t_hitung| > t_tabel(',num2str(t_tabel),')'])
disp(' ')
disp('Kesimpulan')
if abs(t_hitung_b) > t_tabel
    state1='|t hitung| > t tabel';
    d=1;
    state2='Ho ditolak, sehingga persamaan regresi linear layak digunakan.';
else
    state1='|t hitung b| < t tabel';
    d=0;
    state2='Ho tidak ditolak, sehingga persamaan regresi linear tidak layak digunakan.';
end
disp(['karena ',state1,' maka ',state2])
disp(' ')
disp('-Uji Konstanta-')
disp(' ')
disp(['Uji Hipotesis :'])
disp(['Ho : a = 0 (konstanta tidak signifikan digunakan)'])
disp(['H1 : a tidak sama dengan 0 (konstanta signifikan digunakan)'])
disp(' ')
disp(['Tingkat signifikansi = 0,05'])
disp(' ')
disp(['Statistik Uji :'])
disp(' ')
S_bo=sqrt((sum(X.^2)*mse))/((length(X)+length(Y))*sum((X-(mean(X))).^2));
t_hitung_bo=a/S_bo;
disp([' t hitung = ',num2str(t_hitung_bo)])
disp(' ')
disp('Daerah kritik')
disp(['Ho ditolak jika |t_hitung| > t_tabel(',num2str(t_tabel),')'])
disp(' ')
disp('Kesimpulan')
if abs(t_hitung_bo) > t_tabel
    state3='|t hitung| > t tabel';
    e=1;
    state4='Ho ditolak, konstan layak digunakan ';
else
    state3='|t hitung b| < t tabel';
    e=0;
    state4='Ho tidak ditolak, sehingga konstan tidak layak digunakan.';
end
disp(['karena ',state3,' maka ',state4])
if 'd,e :1';
    disp(' ')
    disp('MODEL LAYAK DIGUNAKAN')
    disp(' ')
    disp('kemudian dilakukan perhitungan :')
    disp(' ')
    disp(['nilai b = ',num2str(b)])
    disp(' ')
    disp(['nilai a = ',num2str(a)])
    disp(' ')
    disp('model regresi : ')
    disp(['Y = ',num2str(a),' + ',num2str(b),'(X)'])
    disp(' ')
    disp(['koefisien determinasi= ',num2str(r2)])
    disp('Koefisien korelasi')
    r = sqrt(r2)
    disp(['(Kesimpulan yang dapat diambil adalah variabel X dapat menjelaskan variabel Y sebesar ',num2str(r2*100),'% )'])
else
    disp(' ')
    disp('-MODEL TIDAK LAYAK DIGUNAKAN-')
    disp(' ')
    disp('-SEHINGGA PERHITUNGAN TIDAK DAPAT DILANJUTKAN-')
end

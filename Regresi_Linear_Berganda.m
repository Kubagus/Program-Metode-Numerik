clc
% membuat matriks untuk X1, X2, dan Y
X1 = [848440; 1455950; 371560; 515400; 289800; 1101190; 328610; 1169600; 72760; 120410; 384300; 4224330; 4506890; 494940; 4703300; 658110; 178180; 804440; 1149920; 381350; 143490; 195700; 212920; 202820; 420520; 807030; 326860; 203190; 327720; 74680; 225800; 911330];
X2 = [88; 193; 125; 75; 69; 89; 96; 237; 85; 247; 15478; 1339; 1037; 1188; 817; 1263; 727; 264; 107; 33; 17; 105; 27; 176; 47; 184; 67; 102; 37; 37; 9; 10];
Y = [9646; 37102; 14921; 8520; 9424; 20368; 5904; 10485; 2094; 4885; 43842; 29351; 14353; 8348; 28902; 4570; 4764; 7779; 7813; 7311; 3712; 7211; 8896; 9923; 9602; 15071; 3756; 3763; 2559; 1096; 3123; 8103];

% membuat matriks X dengan menambahkan kolom X0 = 1
X = [ones(size(X1)) X1 X2];

% mencari koefisien regresi linear berganda dengan metode normal equation
B = (X' * X) \ (X' * Y);
disp('Ahmad Kubagus Subkhi C2C021064')
% menampilkan hasil koefisien regresi linear berganda
disp(['Nilai koefisien regresi linear berganda:']);
disp(['Intercept (a) = ' num2str(B(1))]);
disp(['Koefisien regresi untuk X1 (B1) = ' num2str(B(2))]);
disp(['Koefisien regresi untuk X2 (B2) = ' num2str(B(3))]);

% mencari nilai Y hat dengan menggunakan hasil koefisien regresi linear berganda
Y_hat = X * B;

% menampilkan hasil prediksi Y
disp(['Hasil prediksi Y:']);
disp(Y_hat);

% Membuat plot 3D
figure
scatter3(X1,X2,Y,'filled')
hold on
scatter3(X1,X2,Y_hat,'filled')
xlabel('X1')
ylabel('X2')
zlabel('Y')
title('Regresi Linear Berganda')
legend('Data Asli','Prediksi')
hold off





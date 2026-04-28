% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 7 — Forecasting Penjualan dengan Barisan dan Deret
% ---------------------------------------------------
% Nama : Nindira adiarty
% NIM  : 2510514006
% Parameter: N=6, a=0, b=6, K=7
% Tanggal: 28 April 2026
% =====================================================
clc; clear; close all;

% Parameter personalisasi
N = 6; a = 0; b = 6; K = 7;
n = 1:12;
S = 50 + (K .* n) + ((-1).^n) .* (a+1);

fprintf('=====================================================\n');
fprintf(' SOAL 7 — Forecasting Penjualan\n');
fprintf(' NIM: 2510514006 | N=%d, a=%d, b=%d, K=%d\n',N,a,b,K);
fprintf('=====================================================\n\n');

% ==================================================================
% SUB-SOAL 7.1 & 7.2 — Identifikasi Pola dan Sigma
% ==================================================================
fprintf('=== SUB-SOAL 7.1 & 7.2: Barisan dan Sigma ===\n');
fprintf('Bulan (n) | Penjualan (S_n)\n');
for i = 1:12
    fprintf('%9d | %d\n', i, S(i));
end

T1 = sum(S);
T2 = sum(S.^2);
fprintf('\nTotal Penjualan T1 = %d\n', T1);
fprintf('Sum of Squares T2 = %d\n\n', T2);

% ==================================================================
% SUB-SOAL 7.3 — Deret Geometri Pertumbuhan
% ==================================================================
fprintf('=== SUB-SOAL 7.3: Deret Geometri ===\n');
r = 1 + (a/100); % r = 1.00
G1 = K;
% S_10 = G1 * (r^10 - 1) / (r - 1)
% Jika r=1, deret menjadi G1 * 10
S10 = G1 * 10; 
fprintf('Total pelanggan (10 bulan) = %d\n\n', S10);

% ==================================================================
% SUB-SOAL 7.4 — Forecasting 6 Bulan ke Depan
% ==================================================================
fprintf('=== SUB-SOAL 7.4: Linear Forecasting ===\n');
p = polyfit(n, S, 1); % [slope, intercept]
t_pred = 13:18;
S_pred = polyval(p, t_pred);

fprintf('Persamaan Tren: S = %.2f*n + %.2f\n', p(1), p(2));
fprintf('Prediksi Bulan 13-18: %s\n', mat2str(round(S_pred)));

% Visualisasi
figure('Color','white');
plot(n, S, 'bo', 'LineWidth', 1.5); hold on;
plot(n, polyval(p, n), 'r--', 'LineWidth', 1);
plot(t_pred, S_pred, 'g^', 'LineWidth', 1.5);
legend('Data Historis', 'Garis Tren', 'Prediksi');
title('Forecasting Penjualan 6 Bulan ke Depan');
grid on; saveas(gcf, 'fig_s7_forecast.png');

% MAE
MAE = mean(abs(S - polyval(p, n)));
fprintf('MAE = %.4f\n', MAE);
fprintf('\n=====================================================\n');
fprintf(' Soal 7 Selesai\n');
fprintf('=====================================================\n');
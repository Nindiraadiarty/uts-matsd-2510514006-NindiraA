% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 6 — Optimasi Harga Produk Via Gradient Descent
% ---------------------------------------------------
% Nama : Nindira adiarty
% NIM  : 2510514006
% Parameter: N=6, a=0, b=6, K=7, alpha=0.007
% Tanggal: 28 April 2026
% =====================================================
clc; clear; close all;

% Parameter
N = 6; a = 0; b = 6; K = 7; alpha = 0.007;

% Fungsi Profit dan Turunan
pi_func = @(x) -(a+1).*x.^3 + (b+5).*K.*x.^2 + 100.*x - (K^2*10);
pi_d1 = @(x) -3*(a+1).*x.^2 + 2*(b+5).*K.*x + 100;

% 6.1 Turunan dan Titik Kritis
fprintf('=== SUB-SOAL 6.1: Turunan & Titik Kritis ===\n');
A_quad = -3*(a+1); B_quad = 2*(b+5)*K; C_quad = 100;
D = B_quad^2 - 4*A_quad*C_quad;
x1 = (-B_quad + sqrt(D)) / (2*A_quad);
x2 = (-B_quad - sqrt(D)) / (2*A_quad);
fprintf('Titik Kritis: x1 = %.4f, x2 = %.4f\n\n', x1, x2);

% 6.2 Gradient Descent Manual (5 Iterasi)
fprintf('=== SUB-SOAL 6.2: 5 Iterasi Manual ===\n');
fprintf('k | x_k      | pi(x_k)    | pi''(x_k)   | x_{k+1}\n');
x_k = 1;
for k = 0:4
    pi_val = pi_func(x_k);
    dpi_val = pi_d1(x_k);
    x_next = x_k + alpha * dpi_val;
    fprintf('%d | %.6f | %.6f | %.6f | %.6f\n', k, x_k, pi_val, dpi_val, x_next);
    x_k = x_next;
end

% 6.2.e Visualisasi 500 Iterasi
iter = 500;
x_gd = zeros(iter, 1); x_gd(1) = 1;
for i = 1:iter-1
    x_gd(i+1) = x_gd(i) + alpha * pi_d1(x_gd(i));
end

figure('Color','white', 'Position',[100 100 900 400]);
subplot(1,2,1);
plot(1:iter, pi_func(x_gd), 'LineWidth', 1.5);
title('Konvergensi Profit'); xlabel('Iterasi'); ylabel('\pi(x_k)'); grid on;

subplot(1,2,2);
fplot(pi_func, [0, 15], 'k--'); hold on;
plot(x_gd, pi_func(x_gd), 'r-');
plot(x_gd(1), pi_func(x_gd(1)), 'go', 'MarkerSize', 8); % x0
plot(x_gd(end), pi_func(x_gd(end)), 'bx', 'MarkerSize', 8); % x*
title('Jalur GD pada Kurva Profit'); legend('Kurva','GD Path','x0','x*'); grid on;

% 6.2.f Analisis Sensitivitas
alpha_large = 10 * alpha; alpha_small = 0.1 * alpha;
% (Tambahkan logika iterasi dengan alpha berbeda untuk plot perbandingan jika perlu)

% 6.3 Aplikasi Bisnis
fprintf('\n=== SUB-SOAL 6.3: Aplikasi Bisnis ===\n');
x_opt = max(x1, x2);
profit_max = pi_func(x_opt);
margin = (x_opt * 1000) - (K * 10 * 1000);
fprintf('Harga Optimal x*: %.2f (dalam ribuan Rp)\n', x_opt);
fprintf('Profit Maksimum: %.2f (dalam ribuan Rp)\n', profit_max);
fprintf('Margin per unit: Rp %.2f\n', margin);
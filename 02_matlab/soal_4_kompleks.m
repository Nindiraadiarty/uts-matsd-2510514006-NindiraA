% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 4 — Segmentasi Pelanggan dan Bilangan Kompleks
% ---------------------------------------------------
% Nama : Nindira adiarty
% NIM  : 2510514006
% Parameter: N=6, a=0, b=6, K=7, theta0=30
% Tanggal: 26 April 2026
% =====================================================
clc; clear; close all;

% Parameter personalisasi
N = 6; a = 0; b = 6; K = 7; theta0 = 30;
z1 = (a+2) + (b+1)*1i;
z2 = (b+1) - (a+2)*1i;

fprintf('=====================================================\n');
fprintf(' SOAL 4 — Bilangan Kompleks & Fasor Penjualan\n');
fprintf(' NIM: 2510514006 | N=%d, a=%d, b=%d, K=%d\n',N,a,b,K);
fprintf('=====================================================\n\n');

% ==================================================================
% SUB-SOAL 4a — Konversi ke Bentuk Kutub r·cis(θ)
% ==================================================================
fprintf('=== SUB-SOAL 4a: Konversi ke Bentuk Kutub ===\n');
[theta1, r1] = cart2pol(real(z1), imag(z1));
[theta2, r2] = cart2pol(real(z2), imag(z2));

fprintf('z1 = %.4f + %.4fi -> r=%.4f, theta=%.4f rad (%.4f deg)\n', ...
    real(z1), imag(z1), r1, theta1, rad2deg(theta1));
fprintf('z2 = %.4f + %.4fi -> r=%.4f, theta=%.4f rad (%.4f deg)\n\n', ...
    real(z2), imag(z2), r2, theta2, rad2deg(theta2));

% ==================================================================
% SUB-SOAL 4b — Operasi Aritmatika Kompleks
% ==================================================================
fprintf('=== SUB-SOAL 4b: Operasi Kompleks ===\n');
fprintf('z1 + z2 = %.4f + %.4fi\n', real(z1+z2), imag(z1+z2));
fprintf('z1 * z2 = %.4f + %.4fi\n', real(z1*z2), imag(z1*z2));
fprintf('z1 / z2 = %.4f + %.4fi\n', real(z1/z2), imag(z1/z2));
fprintf('|z1 - z2| = %.4f\n\n', abs(z1-z2));

% ==================================================================
% SUB-SOAL 4c — Penerapan De Moivre (z1)^4
% ==================================================================
fprintf('=== SUB-SOAL 4c: Penerapan De Moivre ===\n');
z1_pow4_dm = (r1^4) * (cos(4*theta1) + 1i*sin(4*theta1));
z1_pow4_dir = z1*z1*z1*z1;
fprintf('(z1)^4 (De Moivre) = %.4f + %.4fi\n', real(z1_pow4_dm), imag(z1_pow4_dm));
fprintf('(z1)^4 (Direct)    = %.4f + %.4fi\n', real(z1_pow4_dir), imag(z1_pow4_dir));
fprintf('Selisih = %.4e\n\n', abs(z1_pow4_dm - z1_pow4_dir));

% ==================================================================
% SUB-SOAL 4d — Akar Pangkat Tiga w = 8*cis(θ0)
% ==================================================================
fprintf('=== SUB-SOAL 4d: Akar Kubik ===\n');
w_deg = theta0;
w_rad = deg2rad(w_deg);
r_w = 8;
for k = 0:2
    theta_k = (w_rad + 2*pi*k) / 3;
    akar = nthroot(r_w, 3) * (cos(theta_k) + 1i*sin(theta_k));
    fprintf('Akar ke-%d: %.4f + %.4fi (cis %.4f)\n', k+1, real(akar), imag(akar), theta_k);
end

% ==================================================================
% SUB-SOAL 4e — Plot di Bidang Argand
% ==================================================================
fprintf('\n=== SUB-SOAL 4e: Visualisasi Bidang Argand ===\n');
figure('Color','white');
% Plot lingkaran jari-jari 2
t = linspace(0, 2*pi, 100);
plot(2*cos(t), 2*sin(t), 'k--'); hold on;
% Plot akar
for k = 0:2
    theta_k = (w_rad + 2*pi*k) / 3;
    akar = 2 * (cos(theta_k) + 1i*sin(theta_k));
    plot(real(akar), imag(akar), 'ro', 'MarkerSize', 8, 'LineWidth', 2);
end
grid on; axis square;
title('Soal 4e: Akar Kubik di Bidang Argand');
xlabel('Real'); ylabel('Imaginary');
saveas(gcf, 'fig_s4_argand.png');
fprintf('Grafik disimpan: fig_s4_argand.png\n');
fprintf('\n=====================================================\n');
fprintf(' Soal 4 Selesai\n');
fprintf('=====================================================\n');
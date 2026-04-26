% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 5 — Konvergensi CLV dan Kekontinuan Biaya
% ---------------------------------------------------
% Nama : Nindira adiartys
% NIM  : 2510514006
% Parameter: N=6, a=0, b=6, K=7
% Tanggal: 26 April 2026
% =====================================================
clc; clear; close all;

% Parameter personalisasi
N = 6; a = 0; b = 6; K = 7;
syms x n;

fprintf('=====================================================\n');
fprintf(' SOAL 5 — Limit & Kekontinuan Fungsi\n');
fprintf(' NIM: 2510514006 | N=%d, a=%d, b=%d, K=%d\n',N,a,b,K);
fprintf('=====================================================\n\n');

% ==================================================================
% SUB-SOAL 5.1 & 5.2 — Limit
% ==================================================================
fprintf('=== SUB-SOAL 5.1 & 5.2: Limit ===\n');
L1 = limit((x^2 - K^2)/(x - K), x, K);
L2 = limit((sqrt(x + (K+1)^2) - (K+1))/x, x, 0);
L3 = limit(((a+2)*x^3 + b*x + 7)/(x^3 - x + K), x, inf);
L4 = limit(sin((a+1)*x) * tan((b+2)*x) / x^2, x, 0);

fprintf('L1 = %s\n', char(L1));
fprintf('L2 = %s\n', char(L2));
fprintf('L3 = %s\n', char(L3));
fprintf('L4 = %s\n\n', char(L4));

% ==================================================================
% SUB-SOAL 5.3 — Limit Tak Hingga & CLV
% ==================================================================
fprintf('=== SUB-SOAL 5.3: Limit Tak Hingga CLV ===\n');
R_n = (100*n + K) / (n + (a+b+1));
lim_Rn = limit(R_n, n, inf);
fprintf('Limit R(n) n->inf = %.2f\n', double(lim_Rn));

lim_akar = limit(sqrt(n^2 + K*n) - sqrt(n^2 + b*n), n, inf);
fprintf('Limit selisih akar = %.4f\n\n', double(lim_akar));

% ==================================================================
% SUB-SOAL 5.4 — Kekontinuan Fungsi Piecewise
% ==================================================================
fprintf('=== SUB-SOAL 5.4: Fungsi Piecewise C(x) ===\n');
% C(x) kontinu jika lim x->K- = lim x->K+ = C(K)
% C_kiri = lim (x^2-K^2)/(x-K) = x+K = 2K
% C_kanan = a*K + q
% C(K) = p
C_kiri = 2*K;
q = C_kiri - (a*K); % Dari a*K + q = 2K
p = C_kiri;
fprintf('Syarat kontinu: p = %.2f, q = %.2f\n', double(p), double(q));

% Plotting
fplot(@(x) (x.^2 - K^2)./(x - K), [0, K-0.1], 'b'); hold on;
fplot(@(x) a.*x + q, [K+0.1, 2*K], 'r');
line([K K], [0 2*K], 'Color', 'k', 'LineStyle', '--');
title('Plot Fungsi Biaya C(x)');
grid on;
saveas(gcf, 'fig_s5_piecewise.png');
fprintf('Grafik disimpan: fig_s5_piecewise.png\n');
fprintf('\n=====================================================\n');
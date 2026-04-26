% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 3 — Segmentasi Pelanggan dan Komposisi Fungsi Harga
% ---------------------------------------------------
% Nama : [ISI NAMA LENGKAP ANDA]
% NIM  : 2510514006
% Parameter: N=6, a=0, b=6, K=7
% Tanggal: 2026-04-26
% =====================================================
clc; clear; close all;

% Parameter personalisasi
N = 6; a = 0; b = 6; K = 7;
fprintf('=====================================================\n');
fprintf(' SOAL 3 — Segmentasi Pelanggan & Komposisi Fungsi\n');
fprintf(' NIM: 2510514006 | N=%d, a=%d, b=%d, K=%d\n',N,a,b,K);
fprintf('=====================================================\n\n');

% ==================================================================
% SUB-SOAL 3a & 3b — Operasi Himpunan
% ==================================================================
fprintf('=== SUB-SOAL 3a & 3b: Operasi Himpunan ===\n');
A = [N, N+2, N+4, N+7, N+10, N+13, N+15];
B = [N+3, N+5, N+7, N+10, N+12, N+18];
C = [N+1, N+7, N+10, N+11, N+17, N+20];

fprintf('Himpunan A: %s\n', mat2str(A));
fprintf('Himpunan B: %s\n', mat2str(B));
fprintf('Himpunan C: %s\n', mat2str(C));

res_union = union(A, union(B, C));
res_inter = intersect(A, intersect(B, C));
res_sym   = setxor(A, B); % Simetris difference A XOR B

fprintf('|A U B U C|       = %d\n', numel(res_union));
fprintf('|A n B n C|       = %d\n', numel(res_inter));
fprintf('|A XOR B|         = %d\n\n', numel(res_sym));

% ==================================================================
% SUB-SOAL 3c — Komposisi Fungsi
% ==================================================================
fprintf('=== SUB-SOAL 3c: Komposisi Fungsi f(g(x)) dan g(f(x)) ===\n');
syms x;
f(x) = K*x + (a+b);
g(x) = (x^2)/(b+1) + a;

fog = simplify(f(g(x)));
gof = simplify(g(f(x)));

fprintf('f(x) = %s\n', char(f(x)));
fprintf('g(x) = %s\n', char(g(x)));
fprintf('(f o g)(x) = %s\n', char(fog));
fprintf('(g o f)(x) = %s\n', char(gof));

% Pembuktian komutatif
x_val = b + 2;
fprintf('Uji Komutatif (x = %d):\n', x_val);
fprintf('f(g(%d)) = %.4f\n', x_val, double(subs(fog, x, x_val)));
fprintf('g(f(%d)) = %.4f\n', x_val, double(subs(gof, x, x_val)));

% ==================================================================
% SUB-SOAL 3d — Invers Fungsi dan Solver
% ==================================================================
fprintf('\n=== SUB-SOAL 3d: Invers Fungsi f^-1(x) ===\n');
f_inv = (x - (a+b)) / K;
fprintf('f^{-1}(x) = %s\n', char(f_inv));

target_pendapatan = (K*100 + a + b);
x_solution = subs(f_inv, x, target_pendapatan);
fprintf('Pendapatan Rp %d ribu, volume x = %.2f\n', target_pendapatan, double(x_solution));

% Verifikasi MATLAB
eq = K*x + (a+b) == target_pendapatan;
sol = solve(eq, x);
fprintf('Verifikasi solve MATLAB: x = %.2f\n\n', double(sol));

% ==================================================================
% SUB-SOAL 3e — Klasifikasi Fungsi
% ==================================================================
fprintf('=== SUB-SOAL 3e: Klasifikasi Fungsi ===\n');
fprintf('Fungsi f(x) = %dx + %d adalah fungsi linear (bijektif).\n', K, a+b);
fprintf('Fungsi g(x) = x^2/%d + %d adalah fungsi kuadrat (bukan injektif).\n', b+1, a);
fprintf('Justifikasi: f(x) memiliki turunan f''(x)=%d != 0 (selalu monoton), \n', K);
fprintf('sedangkan g(x) memiliki titik balik sehingga nilai y yang sama dapat dicapai oleh dua nilai x.\n');
fprintf('\n=====================================================\n');
fprintf(' Soal 3 Selesai\n');
fprintf('=====================================================\n');
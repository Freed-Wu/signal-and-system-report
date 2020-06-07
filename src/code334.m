tic;
clc;
clear;
close;

%%in
syms s;
syms t;
L = 10/10^3;
C = 10/10^6;
R = 10*10^3;
H = 1./(s*C + 1 / R)/(1./(s*C + 1 / R) + s * L);
h = ilaplace(H, t);
g = int(h, t);
figure( 'NumberTitle', 'off', 'Name', '阶跃响应' );
ezplot(g);
set(gca,'Xticklabel',{' - 1', '0', '1', '2', '3', '4', '5', '6'}, 'Yticklabel',{'0','1','2','3','4','5','6'});
xlabel( {'$ t / \mathrm(ms) $'}, 'Interpreter', 'LaTex');
ylabel( {'$ g(t) $'}, 'Interpreter', 'LaTex');
title( '$ g(t) $', 'Interpreter', 'LaTex');

%%process

%%out
fprintf('Running time is %f second.\n', toc)

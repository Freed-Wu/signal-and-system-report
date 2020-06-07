tic;
clc;
clear;
close;

%%in
R=38;
C=3900/10^6;
w=0:.5:20;
H_HP=R/2./(R/2+1/j./w/C);
H_LP=1/2/j./w/C./(1/2/j./w/C+R);
H_BS=H_LP+H_HP;

%%process
figure( 'NumberTitle', 'off', 'Name', '低通滤波频响特性' );
freqPlot('w', w, 'h', H_LP);
figure( 'NumberTitle', 'off', 'Name', '高通滤波频响特性' );
freqPlot('w', w, 'h', H_HP);
figure( 'NumberTitle', 'off', 'Name', '带阻滤波频响特性' );
freqPlot('w', w, 'h', H_BS);

%%out
fprintf('f_c is %f kHz.\n', 1/2/pi/(R*C));
fprintf('Running time is %f second.\n', toc);

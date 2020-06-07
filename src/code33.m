tic;
clc;
clear;
close;

%%in
R=10;
C=1000/10^6;
w=0:.5:20;
H_D=(R+1/j./w/C);
H_S=1/j./w/C./(1/j./w/C+2*R);

%%process
figure( 'NumberTitle', 'off', 'Name', '微分电路频响特性' );
freqPlot('w', w, 'h', H_D);
figure( 'NumberTitle', 'off', 'Name', '积分电路频响特性' );
freqPlot('w', w, 'h', H_S);

%%out
fprintf('D: f_c is %f kHz.\n', 1/2/pi/(R*C));
fprintf('S: f_c is %f kHz.\n', 1/2/pi/(2*R*C));
fprintf('LC: f_c is %e kHz.\n', 1/2/pi/sqrt(10/10^-3*.1/10^-6)/1000);
fprintf('Running time is %f second.\n', toc);

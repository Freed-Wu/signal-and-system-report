tic;
clc;
clear;
close;

%%in
data(:,:,1) = csvread('2-5-1.csv', 1, 1, [1 1 4 10]);
data(:,:,2) = csvread('2-5-2.csv', 1, 1, [1 1 4 10]);
data3(:,:,3) = csvread('2-5-3.csv', 1, 1, [1 1 8 10]);

%%process
figure( 'NumberTitle', 'off', 'Name', '高通滤波幅频特性曲线' );
lgfPlot('f', data(2, :, 1), 'vopp', data(3, :, 1), 'vipp', data(1, :, 1), 'phi', data(4, :, 1));
figure( 'NumberTitle', 'off', 'Name', '低通滤波幅频特性曲线' );
lgfPlot('f', data(2, :, 2), 'vopp', data(3, :, 2), 'vipp', data(1, :, 2), 'phi', data(4, :, 2));
figure( 'NumberTitle', 'off', 'Name', '带阻滤波幅频特性曲线' );
lgfPlot('f', [data3(2, :, 3) , data3(6, :, 3)], 'vopp', [data3(3, :, 3), data3(7, :, 3)] , 'vipp', [data3(1, :, 3), data3(5, :, 3) ,], 'phi', [data3(4, :, 3), data3(8, :, 3)]);

%%out
fprintf('Running time is %f second.\n', toc)


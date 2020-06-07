tic;
clc;
clear;
close;

%%in
syms x
fx1=sign( x );
fx2=abs( int( sign( x ), x, 0, x ) )- .5;
fx3=heaviside( x - .2 )- heaviside( x  .2 );
fx4=heaviside( x - .5 )- heaviside( x  .5 );
fx5=sin( 10 * 2 * pi * x )+ sin( 12 * 2 * pi * x );

%%process
figure( 'NumberTitle', 'off', 'Name', '方波频谱图' );
fseriesPlot( 'x', x, 'fx', fx1 );
figure( 'NumberTitle', 'off', 'Name', '三角波频谱图' );
fseriesPlot( 'x', x, 'fx', fx2 );
figure( 'NumberTitle', 'off', 'Name', '对称矩形脉冲频谱图1' );
fseriesPlot( 'x', x, 'fx', fx3 );
figure( 'NumberTitle', 'off', 'Name', '对称矩形脉冲频谱图2' );
fseriesPlot( 'x', x, 'fx', fx4 );
figure( 'NumberTitle', 'off', 'Name', '两正弦波叠加频谱图' );
fseriesPlot( 'x', x, 'fx', fx5 );

%%out
fprintf( 'Running time is %f second.\n', toc )


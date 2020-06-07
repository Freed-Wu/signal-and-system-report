function fseriesPlot( varargin )
%%in
[x, fx, num_period, left, right, num, num1, num2, step ]= internal.stats.parseArgs({ 'x', 'fx', 'num_period', 'left', 'right', 'num', 'num1', 'num2', 'step' },{ [ ], [ ], 5, - 1, 1, 9, 3, 15, 0.001 }, varargin{ : });
width = right - left;
%%time
t=[left:step:right - step ];%原函数一个周期的时间
z=subs( fx, x, t );%subs x 用 t 代替 z 是 fx( 原函数 )一个周期的结果
array0=[ ];% 存储 5 个周期结果的数组
for i=1:num_period
	array0= [array0 z ];% 存储 5 个周期
end
t=[left -( floor( num_period / 2 ) )* width:step:right( floor( num_period / 2 ) )* width - step ];%5 个周期
subplot( 5, 1, 1 );
plot( t, array0 );%画 5 个周期的原函数波形
xlabel({ '$ t / ms $' }, 'Interpreter', 'LaTex' )
ylabel({ '$ u / V $' }, 'Interpreter', 'LaTex' )
title( '$ f( t )$', 'Interpreter', 'LaTex' )
t=[left:step:right - step ];%原函数一个周期的时间
%%freq
n= - num:num;
[an, bn, f ]=fseries( fx, x, num, left, right );% 得到 fx 前 3 项展开在区间上展开的傅里叶级数 f
bn=[0 bn ];
cn=sqrt( an.^2  bn.^2 );
ncn=fliplr( cn );
ncn( num  1 )=[ ];
cn=[ncn cn ];
phin= - atan( bn. / an );
nphin= - fliplr( phin );
nphin( num  1 )=[ ];
phin=[nphin phin ];
%cn=eval( cn );
%phin=eval( phin );
for i = 1:num
	subplot( 5, 1, 2 );
	stem( n, cn );
	xlabel({ '$ f / 500Hz $' }, 'Interpreter', 'LaTex' )
	ylabel({ '$ c_n $' }, 'Interpreter', 'LaTex' )
	title( '$ c_n $', 'Interpreter', 'LaTex' )
	subplot( 5, 1, 3 );
	stem( n, phin );
	xlabel({ '$ f / 500Hz $' }, 'Interpreter', 'LaTex' )
	ylabel({ '$ \varphi_n $' }, 'Interpreter', 'LaTex' )
	title( '$ \varphi_n $', 'Interpreter', 'LaTex' )
end
%%num1
[an, bn, f ]=fseries( fx, x, num1, left, right );% 得到 fx 前 3 项展开在区间上展开的傅里叶级数 f
z=subs( f, x, t );%subs x 用 t 代替 z是f( 傅里叶级数 )一个周期的结果
array1=[ ];
for i=1:num_period
	array1= [array1 z ];% 存储 5 个周期
end
t=[left -( floor( num_period / 2 ) )* width:step:right( floor( num_period / 2 ) )* width - step ];%5 个周期
subplot( 5, 1, 4 );
plot( t, array1 );%画 5 个周期的傅里叶级数波形
xlabel({ '$ t / ms $' }, 'Interpreter', 'LaTex' )
ylabel({ '$ u / V $' }, 'Interpreter', 'LaTex' )
title( '$ f( t )$', 'Interpreter', 'LaTex' )
t=[left:step:right - step ];%原函数一个周期的时间
%%num2
[an, bn, f ]=fseries( fx, x, num2, left, right );% 得到 fx 前 15 项展开在区间上展开的傅里叶级数 f
z=subs( f, x, t );%subs x 用 t 代替 z是f( 傅里叶级数 )一个周期的结果
array2=[ ];
for i=1:num_period
	array2=[array2 z ];% 存储 5 个周期
end
t=[left -( floor( num_period / 2 ) )* width:step:right( floor( num_period / 2 ) )* width - step ];%5 个周期
subplot( 5, 1, 5 );
plot( t, array2 );
xlabel({ '$ t / ms $' }, 'Interpreter', 'LaTex' )
ylabel({ '$ u / V $' }, 'Interpreter', 'LaTex' )
title( '$ f( t )$', 'Interpreter', 'LaTex' )
end

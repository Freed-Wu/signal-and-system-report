function [an, bn,f]=fseries(fx,x,n, a,b)
%傅里叶级数展开
%an为fourier余弦项系数
%bn为fourier正弦项系数
%f为展开表达式
%fx为给定函数
%x为自变量
%n为展开系数个数
%a,b为x的区间,默认为[-pi,pi]

if nargin==3% 当输入没有 a,b 时默认区间[-pi,pi]
	a=-pi;
	b=pi;
end
l=(b-a)/2;% 区间中心对称时为0
if a+b% 如果展开区间不对称那就移动输入函数让区间中点为 0
	fx=subs (fx, x, x+l+a);
end
an=int(fx, x, -l,l)/l;%通过区间定积分运算得到 $ 2a_0 $ 并且 an 是存放余弦系数的数组
bn=[];%存放正弦系数的数组
f=an/2;%  得到$ a_0 $
for ii=1:n%for 循坏依次计算傅里叶系数
	ann=int (fx*cos(ii*pi*x/l), x,-l,l)/l;% 通过积分计算余弦系数
	bnn=int (fx*sin(ii*pi*x/l), x, -l,l)/l;% 计算正弦系数
	an= [an ann];%余弦系数存入数组
	bn= [bn bnn];%正弦系数存入数组
	f=f+ann*cos(ii*pi*x/l)+bnn*sin(ii*pi*x/l);%傅里叶级数展开公式
end
if a+b
	fx= subs(fx,x,x-l-a);% 如果所求区间不以 0 对称那推导结果是以 0 对称计算的通过移动变回真实值
end


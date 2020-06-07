function freqPlot( varargin )

%%in
R=38;
C=3900/10^3;
w=0:.5:20;
H=R/2./(R/2+1/j./w/C);
[w,H] = internal.stats.parseArgs({'w', 'h'}, {w, H}, varargin{:});

%%procsee
subplot(2,1,1);
plot(w,abs(H));
xlabel( {'$ \Omega/kHz $'}, 'Interpreter', 'LaTex')
ylabel( {'$ |H(\jmath\Omega)| $'}, 'Interpreter', 'LaTex')
title( '$ |H(\jmath\Omega)| $', 'Interpreter', 'LaTex')
subplot(2,1,2);
plot(w,angle(H));
xlabel( {'$ \Omega/kHz $'}, 'Interpreter', 'LaTex')
ylabel( {'$ \varphi(\jmath\Omega) $'}, 'Interpreter', 'LaTex')
title( '$ \varphi(\jmath\Omega) $', 'Interpreter', 'LaTex')

%%out

end


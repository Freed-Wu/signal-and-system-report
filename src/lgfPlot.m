function lgfPlot( varargin )

%%in
[ f, vopp, vipp, phi ] = internal.stats.parseArgs({'f', 'vopp', 'vipp', 'phi'}, {[], [], [], []}, varargin{:});

%%procsee
subplot(2,1,1);
semilogx(f, vopp./vipp);
xlabel( {'$ \lg (f / \mathrm{Hz}) $'}, 'Interpreter', 'LaTex');
ylabel( {'$ \frac{V_\mathrm{opp}}{V_\mathrm{ipp}} $'}, 'Interpreter', 'LaTex');
title( '$ \frac{V_\mathrm{opp}}{V_\mathrm{ipp}} $', 'Interpreter', 'LaTex');
subplot(2,1,2);
semilogx(f, phi);
xlabel( {'$ \lg (f / \mathrm{Hz}) $'}, 'Interpreter', 'LaTex');
ylabel( {'$ \varphi(\Omega) $'}, 'Interpreter', 'LaTex');
title( '$ \varphi(\Omega) $', 'Interpreter', 'LaTex');

%%out

end


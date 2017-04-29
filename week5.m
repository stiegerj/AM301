[theta,r] = meshgrid(linspace(0,2*pi,41),linspace(0,20,41));
f = ((sqrt(2) / (81 * sqrt(pi))) * ((6*r - r^2) .* exp(-r/3) .* cos(theta))) ^2;
[x,y] = pol2cart(theta,r);
surf(x,y,f);
save('A1.dat','x','-ascii');
save('A2.dat','y','-ascii');
save('A3.dat','f','-ascii');

a4 = fminsearch(@(x)F(x),[0 1]);
% a5 = fminsearch(myfun,[0 10]);
% a6 = fminsearch(myfun,[pi 1]);
% a7 = fminsearch(myfun,[pi 10]);
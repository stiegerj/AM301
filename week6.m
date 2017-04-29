N = [ 7.24; 9.64; 12.87; 17.07; 23.19; 31.44; 38.56; 50.19; 62.98;
76.21; 92.23; 106.02; 123.20; 132.16; 151.33; 179.32; 203.30;
226.54; 248.71; 281.42; 307.75];

t = -90:10:110;

A1 = zeros(21,1);
for i = 2:20
    A1(i) = (N(i+1) - N(i - 1))/20;
end

A1(1) = (-3 * (N(1)) + 4 * (N(2)) - N(3)) / 20;
A1(21) = (3 * N(21) - 4 * N(20) + N(19))/20; 

save('A1.dat','A1','-ascii');

r = .308:.017:.478;
T = [640 794 885 943 1034 1064 1114 1152 1204 1222 1239];
thp = .7051;
num = 0;
den = 0;
for i = 2:10
    if(mod(i,2) == 0) 
        num = num + 4 * T(i) * r(i);
        den = den + 4 * r(i);
    else
        num = num * 2 * T(i) * r(i);
        den = den + 2 * r(i);
    end
end
num = num + T(1)*r(1) + T(11)*r(11);
den = den + r(1) + r(11);
num = (num * thp * .017) / 3;
den = (den * thp * .017) / 3;

save('A2.dat','num','-ascii');
save('A3.dat','den','-ascii');
quot = num/den;
save('A4.dat','quot','-ascii');

rTth = r .* T * thp;
rth = r * thp;

num = trapz(rTth);
den = trapz(rth);
num = num * .017;
den = den * .017;
quot = num/den;

save('A5.dat','num','-ascii');
save('A6.dat','den','-ascii');
save('A7.dat','quot','-ascii');
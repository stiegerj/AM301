k1 = 2; k2 = .25; k3 = 1.5;
dx_dt = @(t,x) -k1 * (x/(k2 + x)) * x + k3 * sin(pi*t);
t = 0:.1:1;
x = zeros(length(t),1);
x(1) = 1;
for i = 1:length(t) - 1
    x(i+1) = x(i) + .1 * dx_dt(t(i),x(i));
end

save('A1.dat','x','-ascii');
                               
x(1) = 1;                                   
for i=1:(length(x)-1)                             
    k_1 = dx_dt(t(i),x(i));
    k_2 = dx_dt(t(i)+0.5*.1,x(i)+0.5*.1*k_1);
    k_3 = dx_dt((t(i)+0.5*.1),(x(i)+0.5*.1*k_2));
    k_4 = dx_dt((t(i)+.1),(x(i)+k_3*.1));

    x(i+1) = x(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*.1;
end

save('A2.dat','x','-ascii');

t = 0:.01:1;
x2 = zeros(length(t),2);

x2(1,1) = 1;
for i = 1:length(t) - 1
    x2(i+1,1) = x2(i,1) + .01 * dx_dt(t(i),x2(i,1));
end

x2(1,2) = 1;                                   
for i=1:(length(t)-1)                             
    k_1 = dx_dt(t(i),x2(i,2));
    k_2 = dx_dt(t(i)+0.5*.01,x2(i,2)+0.5*.01*k_1);
    k_3 = dx_dt((t(i)+0.5*.01),(x2(i,2)+0.5*.01*k_2));
    k_4 = dx_dt((t(i)+.01),(x2(i,2)+k_3*.01));

    x2(i+1,2) = x2(i,2) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*.01;
end

save('A3.dat','x2','-ascii');
tspan = [0;1];
[tout,yout] = ode45(dx_dt,tspan,1);
A4 = [tout,yout];

save('A4.dat','A4','-ascii');

A11=0;A12=1;
A21=(-10/8); A22 = -3;

A = [A11 A12; A21 A22];
save('A5.dat','A','-ascii');

A6 = 4/5;
save('A6.dat','A6','-ascii');


dx_dt = @(t,x) A*x;
t = 0:.8*.8:50;
x0 = [1 0]';
x = zeros(length(x0),length(t));
x(:,1) = x0;
for i = 1:length(t) - 1
    x(:,i+1)= x(:,i) +.8*.8 * dx_dt(t(i),x(:,i));
end
A7 = x(1,:);
save('A7.dat','A7','-ascii');

t = 0:1.05*.8:50;
x0 = [1 0]';
x = zeros(length(x0),length(t));
x(:,1) = x0;
for i = 1:length(t) - 1
    x(:,i+1)= x(:,i) + 1.05 *.8 * dx_dt(t(i),x(:,i));
end
A8 = x(1,:);
save('A8.dat','A8','-ascii');
tspan = [0 50];
[tout,yout] = ode45(dx_dt,tspan,x0);
x = yout(:,1);
v = yout(:,2);
save('A9.dat','x','-ascii');
save('A10.dat','v','-ascii');





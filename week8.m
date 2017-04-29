dx = @(x,y,z) -a * yin(:,1,:) + f * yin(:,2,:) * yin(:,3,:);
dy = @(x,y,z) c * yin(:,2,:) - d * yin(:,1,:) * yin(:,3,:);
dz = @(y,z) -b * yin(:,3,:) + e * yin(:,2,:)*yin(:,2,:);


xvec = .1:.05:.5;
yvec = 1.8:.05:2.2;
zvec = 11.8:.05:12.2;
[x0,y0,z0] = meshgrid(xvec,yvec,zvec);
vx = x0(:);
vy = y0(:);
vz = z0(:);

A1 = zeros(3,length(vx));
A1(1,:) = vx;
A1(2,:) = vy;
A1(3,:) = vz;

save('A1.dat','A1','-ascii');


a = 16;
b = 5;
c = 10;
d = 6;
e = 18;
f = .05;
dt = .01;

yin = zeros(701,3,729);
yin(1,:,:) = A1;
t = 0:.01:7;

for step = 2:701
    time = (step-1)*dt;
    yout = rk4singlestep(dx,dt,time,(yin(step-1,:,:)));
    yin(step,:,:) = yout;
end

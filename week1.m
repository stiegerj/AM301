A = [-1 3; 2 1];
B = [5 -4; 1 -3];
C = [1 1 6; 1 -9 -4];
D = [1 -4; 1 -3; -2 3];
x = [2 0]';
y = [0 -1]';
z = [-2 4 1]';

A1 = A-B;
A2 = 4*x - 2*y;
A3 = A*y;
A4 = A*(y+x);
A5 = D * x;
A6 = D * y + z;
A7 = A*B;
A8 = B*A;
A9 = A*C;
A10 = C*D;

%They are different because matrix multiplication is not commutative

A11 = C(:,2);
A12 = D(2:3,:);
A13 = C(2,1:2);

n=0;
for i = 1:20000
    n = n + 0.1;
end
x1 = 2000 - n;

n=0;
for i = 1:16000
    n = n + .125;
end
x2 = 2000 - n;

n=0;
for i = 1:10000
    n = n + .2;
end
x3 = 2000 - n;

n=0;
for i = 1:8000
    n = n + .25;
end
x4 = 2000 - n;

A14 = [x1;x2;x3;x4];
%I assume the difference in values comes from the problems inherent in
%storing numbers in memory as floats, shorts, or doubles and it ends up
%repeatedly rounding the numbers in the sum until eventually it reaches a
%notable departure from the intended answer.

save('A1.dat','A1','-ascii');
save('A2.dat','A2','-ascii')
save('A3.dat','A3','-ascii')
save('A4.dat','A4','-ascii')
save('A5.dat','A5','-ascii')
save('A6.dat','A6','-ascii')
save('A7.dat','A7','-ascii')
save('A8.dat','A8','-ascii')
save('A9.dat','A9','-ascii')
save('A10.dat','A10','-ascii')
save('A11.dat','A11','-ascii')
save('A12.dat','A12','-ascii')
save('A13.dat','A13','-ascii')
save('A14.dat','A14','-ascii')


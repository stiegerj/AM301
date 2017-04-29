A = [55 -10 -20
   -10 30 -15
   -20 -15 65];

%x= [I1 I2 I3]';

% b = [V1 V2 V3]';

[L,U,P] = lu(A);

A1 = [A,P,L,U];

A2 = zeros(3,100);
% ans = U\(L\(P'*b))

for i = 1:100
    A2(:,i) = U\(L\(P'*[50 0 i]'));
end

A3 = zeros(3,100);
A_inv = inv(A);
for i = 1:100
    A3(:,i) = A_inv * [50 0 i]';
end

A3 = abs(A3-A2);

s = sqrt(2)/2;

A = [-s 1 0 0 0 0 0 0 0 s 0 0 0
    -s 0 0 0 0 0 0 0 -1 -s 0 0 0
    0 -1 1 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 -1 0 0
    0 0 -1 s 0 0 0 0 0 0 0 -s 0
    0 0 0 -s 0 0 0 0 0 0 0 -s -1
    0 0 0 -s -1 0 0 0 0 0 0 0 0
    0 0 0 0 1 -1 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 1
    0 0 0 0 0 1 -1 0 0 -s 0 s 0
    0 0 0 0 0 0 0 0 0 s 1 s 0
    0 0 0 0 0 0 1 -1 0 0 0 0 0
    0 0 0 0 0 0 0 0 1 0 0 0 0];

b = [0 0 0 0 0 0 0 0 5 0 5 0 5]';
[L,U] = lu(A);
A4 = L\b;
A5 = U\A4;
A6 = A\b;

bool = 1;

while(bool)
 b(11) = b(11) + .01;
 x = U\(L\b);
 max_force = norm(x,Inf);
 if(max_force > 30)
     bool = 0;
 end
end

A7 = b(11);

save('A1.dat','A1','-ascii')
save('A2.dat','A2','-ascii')
save('A3.dat','A3','-ascii')
save('A4.dat','A4','-ascii')
save('A5.dat','A5','-ascii')
save('A6.dat','A6','-ascii')
save('A7.dat','A7','-ascii')

     
     



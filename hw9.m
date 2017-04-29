delta_t = .004;
delta_x = .01;
alpha = .1;
L = 1;

A = (1 - 2 * ((alpha ^2 * delta_t)/(delta_x ^2)));
B = (alpha^2 * delta_t)/(delta_x ^2);

A3 = zeros(99,99);

for column = 1:99
    for row = 1:99
        if (row == column)
            A3(row,column) = A;
        end
        if (abs(row-column) == 1)
            A3(row,column) = B;
        end
    end
end

save('A1.dat','A','-ascii');
save('A2.dat','B','-ascii');
save('A3.dat','A3','-ascii');

eigs = eig(A3);
eiglargmag = max(abs(eig(A3)));
save('A4.dat','eiglargmag','-ascii');

omega = @(x) exp(-200 * (x-.5).^2);
x = delta_x : delta_x : (L-delta_x);
A5 = omega(x)';
save('A5.dat','A5','-ascii');

A6 = zeros(99,501);
A6(:,1) = A5;
for i = 2:501
    A6(:,i) = A3*A6(:,i-1);
end

zerorow = linspace(0,0,501);
answer = [zerorow; A6; zerorow];
save('A6.dat','answer','-ascii');

[V,fr] = audioread('noisy_message.wav');
%V = wavread('noisy_message.wav');
transformed = fft(V);
magtrans = abs(transformed(1:1000));
save('A7.dat','magtrans','-ascii');

transformed(abs(transformed) < 50) = 0;
ans8 = abs(transformed(1:1000));
save('A8.dat','ans8','-ascii');
A9 = ifft(transformed);
firstk = A9(1:1000);
save('A9.dat','firstk','-ascii');

vover8 = length(V)/8;
piece1 = V(1:vover8);
piece2 = V(vover8 : 2*vover8);
piece3 = V(2*vover8 : 3*vover8);
piece4 = V(3*vover8 : 4*vover8);
piece5 = V(4*vover8 : 5*vover8);
piece6 = V(5*vover8 : 6*vover8);
piece7 = V(6*vover8 : 7*vover8);
piece8 = V(7*vover8 :  length(V));

fp1 = fft(piece1);
m1 = mean(abs(fp1));
fp1(abs(fp1) < (3.2 * m1)) = 0;
piece1 = ifft(fp1);

fp2 = fft(piece2);
m2 = mean(abs(fp2));
fp2(abs(fp2) < (3.2 * m2)) = 0;
piece2 = ifft(fp2);

fp3 = fft(piece3);
m3 = mean(abs(fp3));
fp3(abs(fp3) < (3.2 * m3)) = 0;
piece3 = ifft(fp3);

fp4 = fft(piece4);
m4 = mean(abs(fp4));
fp4(abs(fp4) < (3.2 * m4)) = 0;
piece4 = ifft(fp4);

fp5 = fft(piece5);
m5 = mean(abs(fp5));
fp5(abs(fp5) < (3.2 * m5)) = 0;
piece5 = ifft(fp5);

fp6 = fft(piece6);
m6 = mean(abs(fp6));
fp6(abs(fp6) < (3.2 * m6)) = 0;
piece6 = ifft(fp6);

fp7 = fft(piece7);
m7 = mean(abs(fp7));
fp7(abs(fp7) < (3.2 * m1)) = 0;
piece7 = ifft(fp7);

fp8 = fft(piece8);
m8 = mean(abs(fp8));
fp8(abs(fp8) < (3.2 * m8)) = 0;
piece8 = ifft(fp8);

ans10 = [piece1; piece2; piece3; piece4; piece5; piece6; piece7; piece8];
A10 = ans10(1:1000);
save('A10.dat','A10','-ascii');

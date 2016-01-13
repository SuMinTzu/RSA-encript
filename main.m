clc;
disp('Implementation of RSA Algorithm');
clear all; close all;
A=0;
for i=0:1
    while(A==0)
        B=fix(rand(1)*50000);
        A=isprime(B);
    end
    if(i==0)
        p=B
        A=0;
    else
        q=B
    end
end
n=p*q
Phi=(p-1)*(q-1);
uint64 e;
e=Phi+1;
f=2;
while(f>1|e>Phi|f<1)
    e=fix(rand(1)*100000000);
    f=gcd(Phi,e);
end
e
d=1;
while(mod((e*d),Phi)>1|mod((e*d),Phi)<1|e==d)
    d=d+1;
end
d
M = input('\nEnter MTest: ','s');
x=length(M);
c=0;
for j= 1:x
    for i=0:122
        if strcmp(M(j),char(i))
            c(j)=i;
        end
    end
end
disp('ASCII:');
disp(c); 
% % %Encryption
for j= 1:x
   cipher(j)= crypt(c(j),n,e); 
end
disp('CText:');
disp(cipher);
% % %Decryption
for j= 1:x
   message(j)= crypt(cipher(j),n,d); 
end
disp('Decrypted ASCII:');
disp(message);
disp(['Decrypted M: ' message]);




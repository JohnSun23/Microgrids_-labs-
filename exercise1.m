clear;
clc;
load('Tram.mat');
pelect=zeros(size(T,2),1);
for i=1:size(T,2)
    pelect(i,1)=T(1,i).pelec;
end
figure;
plot(1:size(T,2),pelect);
pmax=max(pelect);
ptotal=0;
for i=1:size(pelect,1)
    ptotal=ptotal+pelect(i,1);
end
pavg=ptotal/size(pelect,1);
disp('Average power: ' );
disp(pavg);
if(pavg>=0 && pmax>0)
    pph=1-(pavg/pmax);
else
    pph=1;
end
disp('Potential for hybridization in power: ' );
disp(pph)
for i=1:size(pelect,1)
    energyInBatt(i,1)=-(pelect(i,1)-pavg);
end
eu=max(energyInBatt)-min(energyInBatt);
if(eu~=0 && pmax>=0)
    phe=pmax/eu;
else
    phe=Inf;
end
disp('Potential for hybridization in energy: ' );
disp(phe)
close all
clc
clear
load Tram.mat
Pelec2=zeros(size(T,2),1);
for i=1:size(T,2)
    Pelec2(i,1)=T(1,i).pelec;
end

Pmoy=mean(Pelec2);
figure

subplot(2,1,1) 
plot (Pelec2-Pmoy)
legend('Power provided by the storage device');
title('Power provided by the storage device');

ActualPelec2=zeros(size(Pelec2,1),1);
for i=1:size(Pelec2,1)
    if(Pelec2-Pmoy)>0
        ActualPelec2(i,1)=(Pelec2(i,1)-Pmoy)/0.95;
    else
        ActualPelec2(i,1)=(Pelec2(i,1)-Pmoy)*0.95;
    end
end

subplot(2,1,2) 
plot(ActualPelec2)
legend('Actual power provided by the storage device');
title('Actual power provided by the storage device');

energyStored=zeros(size(ActualPelec2,1),1);
energyStored(1,1)=1000;
for i=2:size(ActualPelec2,1)
    energyStored(i,1)=energyStored(i-1,1)+ActualPelec2(i-1,1)/(60*60);
end
figure;
plot(energyStored)
legend(strcat('Useful energy: ',num2str(max(energyStored)-min(energyStored))));
title('Energy stored in storage device');



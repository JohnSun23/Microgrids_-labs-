close all
clc
clear
load Tram.mat
Pelec2=zeros(size(T,2),1);
for i=1:size(T,2)
    Pelec2(i,1)=T(1,i).pelec;
end
% Calculating the mean of the energ demand
Pmoy=mean(Pelec2)
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

energyStoredInWh=zeros(size(ActualPelec2,1),1);
energyStoredInWh(1,1)=1000;
for i=2:size(ActualPelec2,1)
    energyStoredInWh(i,1)=energyStoredInWh(i-1,1)-(ActualPelec2(i-1,1)/(60*60));
end
figure;
plot(energyStoredInWh)
legend(strcat('Useful energy (in Wh): ',num2str(max(energyStoredInWh)-min(energyStoredInWh))));
title('Energy stored in storage device');
disp(strcat('Useful energy: ',num2str(max(energyStoredInWh)-min(energyStoredInWh))));
%Assuming 75 percent DoD, the capactiy energy capacity can be calculated
capEnergyCapacityInWh=(max(energyStoredInWh)-min(energyStoredInWh))*4/3
%The maximum power imposed upon the capacitor can aslo be calculated
maxPowerImposedInW=max(ActualPelec2)

voltageInV=2.5;
capacitorInF=5000;
esrInuOhms=350;
%The total capacitance of the package can be calculated using the capactir
%energy capacity
totalCapacityInF=2*capEnergyCapacityInWh*60*60/((voltageInV)^2);
disp(strcat('Total capacity required in farads assuming voltage of one capacitor: ', num2str(totalCapacityInF)));

% voltageInV=2.5;
% capacitorInF=5000;
% esrInuOhms=350;
%the energy capacity of one pack
energyInOnePackInWh=capacitorInF*(voltageInV^2)/(2*60*60)
maximalPowerInOneElementInW=0.12*(voltageInV^2)/(esrInuOhms/1000000)

%Number of capacitors reuiqred according to energy capacity and power
%capacity
NumOfCapEnergy=capEnergyCapacityInWh/energyInOnePackInWh
NumOfCapPower=maxPowerImposedInW/maximalPowerInOneElementInW
disp(strcat('Number of capacitors required: ', num2str(ceil(max(NumOfCapEnergy,NumOfCapPower)))))



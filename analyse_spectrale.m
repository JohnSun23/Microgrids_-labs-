close all
clc

load Tram.mat
Pelec2=zeros(size(T,2),1);
for i=1:size(T,2)
    Pelec2(i,1)=T(1,i).pelec;
end
plot(1:size(T,2),Pelec2);

fece=1
Pmoy=mean(Pelec2)

figure

subplot(2,1,1) 
plot (Pelec2)
legend('Pelec2 temporel')
title('Allure temporelle de Pelec2')

subplot(2,1,2) 
plot(Pelec2-Pmoy,'k')
legend('Pelec2 temporel')
title(strcat('Allure temporelle de Pelec2 - ',num2str(Pmoy)))


 [S,k,fssdim,freelle,S2,k2]=spectrece((Pelec2-Pmoy),fece); %tracé du spectre du signal original
 S2max=max(S2);
 
 figure (6);
 plot(freelle,S2);
 grid;
 xlabel('Hz');
 ylabel('amplitude (W)');
 title('analyse spectrale signal');
 
S2max

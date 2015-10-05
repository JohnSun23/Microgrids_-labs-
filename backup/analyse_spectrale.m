close all
clc

fece=1
Pmoy=mean(Pelec2)

figure(5)

subplot(2,1,1) 
plot (Pelec2)
legend('Pelec2 temporel')
title('Allure temporelle de Pelec2')

subplot(2,1,2) 
plot(Pelec2-113700,'k')
legend('Pelec2 temporel')
title('Allure temporelle de Pelec2-113700')


 [S,k,fssdim,freelle,S2,k2]=spectrece((Pelec2-113700),fece); %tracé du spectre du signal original
 S2max=max(S2);
 
 figure (6);
 plot(freelle,S2);
 grid;
 xlabel('Hz');
 ylabel('amplitude (W)');
 title('analyse spectrale signal');
 


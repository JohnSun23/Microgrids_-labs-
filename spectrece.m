
function [S,k,fssdim,freelle,S2,k2,fece]=spectrece(xx,fece)

% [S,k]=spectre(xx,fece);
%
% Fonction r�alisant l'estimation du spectre
% d'un signal � l'aide d'une TFD
% 
% Entr�e :
%  - ce  : �chantillons du signal [N x 1]
%  - fe : fr�quence d'�chantillonnage (en Hertz)
%
% Sorties :
%  - S : valeur du spectre du signal    [Nfft x 1]
%  - k : num�ro d'�chantillon du spectre [Nfft x 1]

%% Mise en forme du signal (fait)
% Signal en vecteur colonne
xx=xx(:);
% Nombre d'�chantillons temporels du signal
N=length(xx);

%% Fen�tre d'apodisation (fait)
%!Choisir sa fenetre!

g=hamming(N);%fenetre de hamming

%g=blackman(N);%fenetre de blackman

%g=hann(N);%fenetre de hanning

%g=boxcar(N);%fenetre sans apodisation

xx=xx.*g;%ponderation du signal avec la fenetre
%% Passage en fr�quence (fait) + Interpolation en fr�quence (� faire)
% TFD
Nfft=8*length(xx);  %nombre de points de la TFD %8 pour augmenter la precision en augm le nmbr de pts de calc

TFD=fft(xx,Nfft); %passage en fr�quence par TFD sur Nfft points
S=abs(TFD);      %estimateur de base du spectre d'amplitude

%% Calibrage des abscisses (fait)
S2=S(1:Nfft/2+1);
k=0:Nfft-1; %num�ro d'�chantillon du spectre
k2=k(1:Nfft/2+1);
fssdim=k2/Nfft; %frequence reduite sans dimension
freelle=k2*fece/Nfft; %frequence reelle en Hertz
%% Calibrage des ordonn�es (� faire)
S2=2*S2/abs(sum(g));

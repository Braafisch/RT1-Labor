% Regelunstechnik 1
% Labor 1
% Vorbereitungsaufgabe 3
% (C) 2020 W.Bradfisch
% Hochschule Esslingen
%
%Analyse des Frequenzgangs [AR,wR] = analyseFrequenzgang(betrag, kreisfrequenz)
function [AR,wR] = analyseFrequenzgang(betrag, kreisfrequenz)
[M,I] = max(betrag);            %Maximaler Wert und desen Index
AR = (M/betrag(1))-1;           %Berechnung der Resonanzüberhöhung
wR = kreisfrequenz(I);          %Ermittlung der Dazugehörigen Kreisfrequenz
end


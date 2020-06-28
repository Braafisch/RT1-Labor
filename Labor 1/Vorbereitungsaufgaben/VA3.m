% Regelunstechnik 1
% Labor 1
% Vorbereitungsaufgabe 3
% (C) 2020 W.Bradfisch
% Hochschule Esslingen
%
%a)
T = 1;
D = [0, 0.1, 0.5, 0.7, 1, 2, 5];    %Verschiedene Dämpfungen
kt = 0:0.1:(10-0.1);
y = zeros(length(kt),length(D));

for i = 1:length(D)
    G = tf([1],[T^2 2*D(i)*T 1]);   %PT2-Glied bei verschiedenen Däpfungen
    y(:,i) = step(G, kt);           %Sprungantwort der einzelnen PT2-Gliedern
end;

figure;                             %Ausgabe der Sprungantworten in einem Diagramm
plot(kt,y);
axis tight;
xlabel('Zeit in Sekunden');
ylabel('Signal');
legend('D=' + string(D),'Location','EastOutside');

%b)
D = 0.1:0.1:2;                      %Verschiedene Dämpfungen
a = zeros(length(D),1);             %Überschwingweite a
Tan = zeros(length(D),1);           %Anregelzeit Tan
Taus = zeros(length(D),1);          %Ausregelzeit Taus
for i = 1:length(D)
    G = tf([1],[T^2 2*D(i)*T 1]);   %PT2-Glied bei verschiedenen Däpfungen
    y = step(G, kt);                %Sprungantwort der einzelnen PT2-Gliedern
    [a(i),Tan(i),Taus(i)] = Analyse(y,kt,0.05);     %Analyse der Sprungantwort
end;

figure;                             %Ausgabe der Überschwingweite in Abhängigkeit der Dämpfung
plot(D,a);
axis tight;
xlabel('Dämpfung');
ylabel('Überschwingweite');
title('a(D)');

%c)
figure;                             %Ausgabe der Anregel- und Ausregelzeit in Abhängigkeit der Dämpfung
plot(D,Tan,D,Taus);
legend({'Tan','Taus'},'Location','EastOutside');
axis tight;
xlabel('Dämpfung');
ylabel('Überschwingweite');
title('Tan und Taus');

%d)
D = [0.1, 0.5, 0.7, 1, 2, 5];       %Verschiedene Dämpfungen
for i = 1:length(D)
    G = tf([1],[T^2 2*D(i)*T 1]);   %PT2-Glied bei verschiedenen Däpfungen
    bode(G,kt);                     %Bode-Diagramm der verschiedenen PT2-Glieder
    hold on;
end;
legend('D=' + string(D))

%e)
D = 0.1:0.1:2;                      %Verschiedene Dämpfungen
wR = zeros(length(D),1);            %Kreisfrequenz
AR = zeros(length(D),1);            %relative Resonanzüberhöhung
for i = 1:length(D)
    G = tf([1],[T^2 2*D(i)*T 1]);   %PT2-Glied bei verschiedenen Däpfungen
    [b,p,w] = bode(G, kt);          %Betrag, Phase und Kreisfrequenz
    [AR(i),wR(i)] = analyseFrequenzgang(b,w);   %berechnung der relativen Resonanüberhöhung und der dazugehörigen Kreisfrequenz
end;

figure;
plot(D,AR,D,wR);                    %Ausgabe der relative Resonanzüberhöhung und Kreisfrequenz in Abhängigkeit der Dämpfung
legend({'AR','wR'},'Location','EastOutside');
axis tight;
xlabel('Dämpfung');
title('AR und wR');



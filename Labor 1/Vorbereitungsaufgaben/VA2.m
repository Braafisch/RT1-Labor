% Regelunstechnik 1
% Labor 1
% Vorbereitungsaufgabe 2
% (C) 2020 W.Bradfisch
% Hochschule Esslingen
%
T = 0.1;
G = tf([0.1],[1 -0.8],T);       %zeitdiskrete Systeme G
step(G);                        %Berechnet und zeichnet die Sprungantwort von G
pause;
impulse(G);                     %Berechnet und zeichnet die Impulsantwort
pause;

figure
bode(G);                        %Berechnet und zeichnet den Frequenzgang

figure
f = input('f=');                %Tastatureingabe der Frequenz
while f ~= 0                    %Ausgabe so lange f > 0
    t = 0:0.1:4;
    u = 0.2*sin(2*pi*f*t);      %Sinusschwingung der Amplitude 0.2
    y = lsim(G, u, t);          %Antwort des Systems auf u
    plot(t, y);
    f = input('f=');            %Tastatureingabe weiterer Frequenzen
end;

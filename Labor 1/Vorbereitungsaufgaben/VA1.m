% Laborversuch: Simulation
% Regelungstechnik 1
% Hochschule Esslingen
%
% Analyse eines RLC-Glieds
%(C) 2019 W.Lindermeir, W.Zimmermann
slCharacterEncoding('UTF-8')

R = 0.8;                        % Parameter (Achtung: SI-Einheiten verwenden)
L = 1E-6;
C = 1E-6;
G = tf([1], [L*C  R*C  1]);     % Übertragungsfunktion
step(G);                        % Berechnet und zeichnet die Sprungantwort
disp('Drücken Sie eine Taste')
pause;                          % Hält Programm an, bis Taste betätigt wird
bode(G);                        % Berechnet und zeichnet den Frequenzgang
disp('Drücken Sie eine Taste')
pause;

%(C) 2020 W.Bradfisch
impulse(G);                     % Berechnet und zeichnet die Impulsantwort

f = 250000;                     
t = 0:1/(100*f):25e-6;
a = 2;
v = a * sign (sin (2* pi* f * t ));     %Rechtecksignal mit Amplitude 2
yv = lsim(G, v, t);             %Antwort des Schwingkreises auf Rechtecksignal
figure
plot(t, v, 'b--', t, yv, 'r');  %Ausgabe des Eingangssignals und des Ausgangssignals
axis tight;
xlabel('Zeit in Sekunden');
ylabel('Signal');
legend({'Eingangssignal','Ausgangssignals'},'Location','EastOutside');



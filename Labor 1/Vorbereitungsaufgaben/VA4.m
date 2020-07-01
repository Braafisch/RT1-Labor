% Regelunstechnik 1
% Labor 1
% Vorbereitungsaufgabe 4
% (C) 2020 W.Bradfisch
% Hochschule Esslingen
%
for og = [30 45]                     % Schleife zur Variation des Parameters kp
    sim('fahrg3');                      % Aufruf SIMULINK-Blockschaltbild fahrg1.mdl
    figure(2)                           % Umschalten auf ein neues Bild (sonst wird die 
                                        % Ausgabe des 4KanalOSZI überschrieben)
    plot(t, x2, t, x3);                 % Zeichnen der Kanäle x2 und x3
    grid on                             % Zeichnungsraster einschalten
    hold on                             % Überschreiben des Diagramms beim nächsten 
end                                     % Durchlauf verhindern
legend({'M Begrenzt','v Begrenzt','M Unbegrenzt','v Unbegrenzt'},'Location','EastOutside');

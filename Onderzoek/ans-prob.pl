/*
We beginnen met een van de eerste voorbeelden uit Smith en Mateas.
Hierin is volgende code gegeven
{rain, sprinkler}.
wet :- rain.
wet :- sprinkler.
dry :- not wet.

En levert de volgende answer sets op:
dry.
wet, rain.
wet, sprinkler.
wet, rain, sprinkler.

Vertalen we dit nu in ProbLog code.
We passen hierbij de kansen van {rain, sprinkler}. niet aan.
We geven zowel rain als sprinkler 1/2 kans.
*/

0.5 :: rain.
0.5 :: sprinkler.

wet :- rain.
wet :- sprinkler.
dry :- \+ wet.

/*
Voeren we hierop de volgende queries uit.
*/

query(dry).
query(wet).

/*
We krijgen nu
dry:	0.25
wet:	0.75
Dit komt uiteraard overeen met de answer sets die we
verkregen zoals in de paper van Smith en Mateas.
*/

/* Voegen we nu het volgende toe */
evidence(wet, true).

/* Dan verkrijgen we dat dry een 0 procent kans heeft.
Dit is één van de sterke punten aan ProbLog
*/

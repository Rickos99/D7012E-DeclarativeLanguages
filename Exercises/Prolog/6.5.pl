:- ["L11"].

% considering only the simplest nouns to pluralize.
plural(Word, Pluralized) :- 
  name(Word, P1),
  name(s, P2),
  conc(P1, P2, P3),
  name(Pluralized, P3).

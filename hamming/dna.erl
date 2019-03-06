-module(dna).
-export([hamming_distance/2]).

hamming_distance(Strand1, Strand2) when length(Strand1) =:= length(Strand2) ->
  Zipped = lists:zip(Strand1, Strand2),
  lists:foldl(fun reducer/2, 0, Zipped).

reducer({G, G}, Sum) -> Sum;
reducer({_, _}, Sum) -> Sum + 1.

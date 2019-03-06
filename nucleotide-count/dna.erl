-module(dna).
-export([count/2, nucleotide_counts/1]).

count(_, N) when N =/= "C", N =/= "G", N =/= "A", N =/= "T" ->
  error("Invalid nucleotide");
count(Str, N) -> count(Str, N, 0).

count([], _, Sum) -> Sum;
count([H | T], N, Sum) ->
  case [H] =:= N of
    true -> count(T, N, Sum + 1);
    false -> count(T, N, Sum)
  end.

nucleotide_counts(Str) -> [{[N], count(Str, [N])} || N <- "ATCG"].

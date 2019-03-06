-module(sum_of_multiples).
-export([sum_of_multiples/2]).

sum_of_multiples([], _) -> 0;
sum_of_multiples(L, N) ->
  Fun = fun(X) -> multiples(X, N) end,
  Multiples = lists:flatmap(Fun, L),
  Unique = lists:usort(Multiples),
  lists:sum(Unique).

multiples(Div, Max) ->
  Range = lists:seq(1, Max - 1),
  Filter = fun(N) -> N rem Div =:= 0 end,
  lists:filter(Filter, Range).

-module(anagram).
-export([find/2]).

find(Word, Candidates) ->
  LowerCased = string:to_lower(Word),
  UniqueList = lists:filter(fun(W) -> string:to_lower(W) =/= LowerCased end, Candidates),
  Normalized = lists:sort(LowerCased),
  lists:filter(fun(W) -> lists:sort(string:to_lower(W)) =:= Normalized end, UniqueList).

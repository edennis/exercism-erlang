-module(atbash_cipher).
-export([encode/1, decode/1]).

encode(String) ->
  Normalized = normalize(String),
  Translated = [translate(L) || L <- Normalized],
  Grouped    = groups_of_five(Translated),
  WithSpaces = lists:join(" ", Grouped),
  lists:flatten(WithSpaces).

decode(String) -> [translate(L) || L <- normalize(String)].

groups_of_five(List) -> groups_of_five(List, []).

groups_of_five([], Acc) -> lists:reverse(Acc);
groups_of_five([H1, H2, H3, H4, H5 | T], Acc) ->
  groups_of_five(T, [[H1, H2, H3, H4, H5] | Acc]);
groups_of_five(List, Acc) ->
  groups_of_five([], [List | Acc]).

normalize(String) ->
  LowerCase = string:to_lower(String),
  re:replace(LowerCase, "[^[:alnum:]]", "", [global, {return, list}]).

translate(C) when C >= $a, C =< $z -> $z - C + $a;
translate(C) -> C.

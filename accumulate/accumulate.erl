-module(accumulate).
-export([accumulate/2]).

accumulate(Fn, Ls) ->
  lists:reverse(do_accumulate(Fn, Ls, [])).

do_accumulate(_Fn, [], Acc) -> Acc;
do_accumulate(Fn, [H | T], Acc) ->
  do_accumulate(Fn, T, [Fn(H) | Acc]).

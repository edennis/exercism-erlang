-module(strain).
-export([keep/2, discard/2]).

keep(F, L) when is_function(F), is_list(L) ->
  {Keep, _} = partition(F, L),
  lists:reverse(Keep).

discard(F, L) when is_function(F), is_list(L) ->
  {_, Discard} = partition(F, L),
  lists:reverse(Discard).

partition(F, L) -> partition(F, L, {[], []}).

partition(_, [], Acc) -> Acc;
partition(F, [H|T], {Keep, Discard}) ->
  case F(H) of
    true  -> partition(F, T, {[H | Keep], Discard});
    false -> partition(F, T, {Keep, [H | Discard]})
  end.

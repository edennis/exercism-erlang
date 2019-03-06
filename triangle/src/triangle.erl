-module(triangle).
-export([test_version/0, kind/3]).

test_version() -> 1.

kind(A, B, C) ->
  [A1, B1, C1] = lists:sort([A, B, C]),
  do_kind(A1, B1, C1).

do_kind(A, _, _) when A =< 0 ->
  {error, "all side lengths must be positive"};

do_kind(A, B, C) when A + B =< C ->
  {error, "side lengths violate triangle inequality"};

do_kind(A, A, A) -> equilateral;
do_kind(A, B, B) -> isosceles;
do_kind(A, A, B) -> isosceles;
do_kind(_, _, _) -> scalene.

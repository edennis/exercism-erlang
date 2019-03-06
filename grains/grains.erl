-module(grains).
-export([square/1, total/0]).

-define(MAX_SQUARES, 64).

square(N) -> 1 bsl (N - 1).

total() -> square(?MAX_SQUARES + 1) - 1.

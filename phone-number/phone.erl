-module(phone).
-export([number/1, areacode/1, pretty_print/1]).

-define(NUMBER_LENGTH, 10).
-define(INVALID_NUMBER, "0000000000").

number(String) ->
  Cleaned = clean(String),
  format_number(Cleaned).

clean(String) -> lists:filter(fun is_valid_char/1, String).

is_valid_char(C) when ($0 - 1) < C, C < ($9 + 1) -> true;
is_valid_char(_) -> false.

format_number([$1 | T] = N) when length(N) > ?NUMBER_LENGTH -> T;
format_number(N) when length(N) =:= ?NUMBER_LENGTH -> N;
format_number(_) -> ?INVALID_NUMBER.

areacode(String) ->
  Number = number(String),
  Tokens = parse_number(Number),
  [AreaCode | _Rest] = Tokens,
  AreaCode.

parse_number(Number) ->
  AreaCode = lists:sublist(Number, 1, 3),
  First    = lists:sublist(Number, 4, 3),
  Last     = lists:sublist(Number, 7, 4),
  [AreaCode, First, Last].

pretty_print(String) ->
  Number = number(String),
  [AreaCode, First, Last] = parse_number(Number),
  lists:concat(["(", AreaCode, ") ", First, "-", Last]).

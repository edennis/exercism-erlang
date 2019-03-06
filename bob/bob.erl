-module(bob).
-export([response_for/1]).

response_for(Question) ->
  case {is_question(Question), is_nothing(Question), is_shouting(Question)} of
    {_, _, true} -> "Whoa, chill out!";
    {_, true, _} -> "Fine. Be that way!";
    {true, _, _} -> "Sure.";
    {_, _, _} -> "Whatever."
  end.

is_question(String) -> regex_match(String, "\\?$").

is_nothing(String) -> regex_match(String, "^\\s*$").

is_shouting(String) ->
  regex_match(String, "[[:upper:]]") andalso
  not regex_match(String, "[[:lower:]]").

regex_match(String, Regex) ->
  case re:run(String, Regex) of
    {match, _} -> true;
    nomatch -> false
  end.

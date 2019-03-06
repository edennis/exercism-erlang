-module(leap).
-export [leap_year/1].

leap_year(Year) ->
  do_leap_year(Year rem 400, Year rem 100, Year rem 4).

do_leap_year(0, 0, 0) -> true;
do_leap_year(_, 0, 0) -> false;
do_leap_year(_, _, 0) -> true;
do_leap_year(_, _, _) -> false.

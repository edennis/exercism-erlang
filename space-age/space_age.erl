-module(space_age).
-export([ageOn/2]).

ageOn(earth, Seconds) -> Seconds / 31557600;
ageOn(Planet, Seconds) -> ageOn(earth, Seconds) / orbitalPeriod(Planet).

orbitalPeriod(mercury) ->   0.2408467;
orbitalPeriod(venus)   ->   0.61519726;
orbitalPeriod(mars)    ->   1.8808158;
orbitalPeriod(jupiter) ->  11.862615;
orbitalPeriod(saturn)  ->  29.447498;
orbitalPeriod(uranus)  ->  84.016846;
orbitalPeriod(neptune) -> 164.79132.

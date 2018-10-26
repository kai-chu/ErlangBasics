-module(howtoprocess).
-export([start/0, say_something/2]).

start() -> 
	spawn(howtoprocess, say_something, [hello, 3]),
    spawn(howtoprocess, say_something, [goodbye, 3]).

say_something(What, 0) ->
    done;
say_something(What, Times) ->
	io:format("~p~n", [What]),
    say_something(What, Times - 1).
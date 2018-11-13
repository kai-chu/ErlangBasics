-module(helloworldapp).
-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) ->
	io:format("~p~n", [helloworldapp]),
    hellosupervisor:start_link().

stop(_State) ->
    ok.
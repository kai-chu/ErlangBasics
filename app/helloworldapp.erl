-module(helloworldapp).
-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) ->
	io:format("~p~n", [helloworldapp]),
    {ok, Pid}=hellosupervisor:start_link(),
    io:format("~p~n", [Pid]),
    {ok, Pid}.

stop(_State) ->
    ok.
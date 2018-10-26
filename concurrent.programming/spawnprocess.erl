-module(spawnprocess).
-export([start/0, say_something/2]).

%
% spawn two processes within this module and given paramenters
% return 0
%
start() -> 
	spawn(?MODULE, say_something, [hello, 3]),
    spawn(?MODULE, say_something, [goodbye, 3]), <  spawn returns a process identifier
    0.

say_something(What, 0) ->
    done;
say_something(What, Times) ->
	io:format("~p~n", [What]),
    say_something(What, Times - 1).


% To compile, erlc spawnprocess.erlc
% To Run, erl --no-shell -s spawnprocess start -s init stop
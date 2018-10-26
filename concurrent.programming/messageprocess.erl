-module(messageprocess).
-export([start/0, ping/2, pong/0]).


start() ->
	Pong_PID = spawn(?MODULE, pong, []),
    spawn(?MODULE, ping, [3, Pong_PID]),
   	0.

pong() ->
	receive
		finished ->
			io:format("Pong finished~n", []);
        {ping, Ping_PID} ->
            io:format("Pong received ping~n", []),
            Ping_PID ! pong,
            pong()
    end.

ping(0, Pong_Pid) ->
    Pong_Pid ! finished,
    io:format("ping finished~n", []);
ping(Times, Pong_Pid) ->
	Pong_Pid ! {ping, self()},
    receive
    	pong ->
    		io:format("Ping received pong~n", [])
    end,
    ping(Times - 1, Pong_Pid).

% erlc messageprocess.erl
% erl --no-shell -s messageprocess start -s init stop

%Send messages to other process
%Pid ! message

%Receive messages from other process
%receive
%   pattern1 ->
%       actions1;
%   pattern2 ->
%       actions2;
%   ....
%   patternN
%       actionsN
%end.
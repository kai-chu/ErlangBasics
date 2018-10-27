-module(distributionprocess).
-export([start_ping/2, start_pong/0, ping/2, pong/0]).

start_pong() -> 
	register(pong, spawn(?MODULE, pong, [])).

start_ping(Times, Pong_Node) ->
	spawn(?MODULE, ping, [Times, Pong_Node]).

pong() ->
	receive 
		finished ->
			io:format("Pong finished~n", []);
		{ping, Ping_Pid} ->
			io:format("Pong receive message~n"),
			Ping_Pid ! pong,
			pong()
	end.

ping(0, Pong_Node) ->
	io:format("Ping finished~n", []),
	{pong, Pong_Node} ! finished;
ping(Times, Pong_Node) ->
	{pong, Pong_Node} ! {ping, self()},
	io:format("Seding message finished~n", []),
	receive
		pong ->
			io:format("Ping receive message ~n", [])
	end,
	io:format("Seding message ready~n", []),
	ping(Times-1, Pong_Node).

% Ping -> Pong_Node, ping
% Pong -> Ping_Node, pong, end

% Ping again and Pong replies again until the Times is 0
% Ping finished -> Pong_Node, finished
% Pong finished
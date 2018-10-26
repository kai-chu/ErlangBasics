-module(registerprocess).
-export([start/0, consumer/0, producer/1]).

start() ->
	register(consumer, spawn(?MODULE, consumer, [])),
	spawn(?MODULE, producer, [2000]).

consumer() ->
	receive
		message -> 
			io:format("Consumer received message ~n", [])
	end,
	consumer().

producer(0) ->
	io:format("producer finished all message ~n", []);
producer(Times) ->
	consumer ! message,
	producer(Times - 1).

% erlc registerprocess.erl
% erl --no-shell -s registerprocess start -s init stop
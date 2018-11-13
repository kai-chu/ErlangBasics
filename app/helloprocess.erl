-module(helloprocess).
-behaviour(gen_server).

-export([start_link/0, hello/0]).
-export([init/1, terminate/2, code_change/3, handle_info/2, handle_cast/2, handle_call/3]).

init(_Args) ->
	{ok, initialisation}.

handle_cast(stop, State) ->
    {stop, normal, State}.

handle_info(Info, State) ->
    {noreply, state1}.

handle_call(alloc, _From, Chs) ->
    {reply, reply1, state1}.

code_change(OldVsn, State, Extra) ->
    {ok, state1}.

start_link() ->
	gen_server:start_link({local, helloprocess}, helloprocess, [], []).

terminate(shutdown, State) ->
    ok.

hello() ->
	io:format("~s~n", ["helloworld is done"]).

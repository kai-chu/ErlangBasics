-module(list).

-export([main/0]).


main() ->
	L = [], %create a list
	New_L = [a | L], % add element a to the list

	%Access element
	[First | Other] = New_L,
	io:format("~w~n",[First]),%a
	io:format("~w~n",[New_L]),%[a]

	%Pred
	R = lists:all(fun(E) -> E == a end, New_L),
	R = lists:all(fun pred/1, New_L),
	io:format("all ~w~n",[R]), %all true

	R = lists:any(fun pred/1, New_L),
	io:format("any ~w~n",[R]), % any true

	%add two lists
	New_La = lists:append([[1, 2, 3], New_L]),
	io:format("~w~n",[New_La]), %[1,2,3,a]

	New_lb = lists:append([5,6,7], New_La),
	io:format("~w~n",[New_lb]), %[5,6,7,1,2,3,a]

	%concat two lists
	S = lists:concat(New_lb),
	io:format("~s~n",[S]), %"567123a"

	%delele a element
	New_lc = lists:delete(3, New_lb),
	io:format("~w~n",[New_lc]), %[5,6,7,1,2,a]

	%delete last element
	New_ld = lists:droplast(New_lc),
	io:format("~w~n",[New_ld]). %[5,6,7,1,2]

pred(E) ->
	E == a.
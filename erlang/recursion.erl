-module(recursion).
-export([zip/2, quicksort/1]).

%%zip two lists of equal length into a list of paired tuples
zip(X,Y) -> reverse(zip(X,Y,[])).

zip([],[], Acc) -> Acc;
zip([X|Xs], [Y|Ys], Acc) -> zip(Xs, Ys, [{X,Y}|Acc]).

%%quicksort algorithm, use a pivot
quicksort([]) -> [];
quicksort([Pivot|X]) ->
	quicksort( [Xs || Xs <- X, Xs < Pivot]) ++ [Pivot] ++ quicksort( [Xl || Xl <- X, Xl >= Pivot]).

%% internals %
%%reverse reverses a list
reverse(X) -> reverse(X,[]).

reverse([], Acc) -> Acc;
reverse([X|Xs], Acc) -> reverse(Xs, [X|Acc]).

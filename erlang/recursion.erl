-module(recursion).
-export([zip/2, quicksort/1]).

zip(X, Y) -> reverse(zip(X, Y, [])).

zip([], _, Accum) -> Accum;
zip(_, [], Accum) -> Accum;
zip([X|Xs],[Y|Ys], Accum) -> zip(Xs, Ys, [{X, Y}|Accum]).

quicksort([]) -> [];
quicksort([Pivot|Rest]) -> 
	quicksort([As || As <- Rest, As < Pivot]) ++ [Pivot] ++ quicksort([Bs || Bs <- Rest, Bs > Pivot]).

%% internals %%
reverse(A) -> reverse(A, []).

reverse([], Accum) -> Accum;
reverse([A|As], Accum) -> reverse(As, [A|Accum]). 

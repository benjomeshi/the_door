-module(hhfuns).
-compile(export_all).

map([], _) -> [];
map([X|Xs], Fun) -> [Fun(X)|map(Xs, Fun)].

increment([]) -> [];
increment(Xs) -> map(Xs, add(1)).

add(A) -> fun(B) -> A + B end.
add(A, B) -> A + B.


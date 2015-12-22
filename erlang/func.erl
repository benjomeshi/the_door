-module(func).
-compile(export_all). %%replace with -export(). eventually.

head([ X | _]) -> X.

second([ _ , Y | _ ]) -> Y.

same(X,X) ->
  true;
same(_,_) ->
  false.

date_print({date, Y,M,D}) ->
  io:format("Current date is: ~p/~p/~p~n", [M,D,Y]).

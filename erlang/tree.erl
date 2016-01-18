-module(tree).
-export([empty/0, insert/3, lookup/2]).

empty() -> {node, 'nil'}.

insert({node,'nil'}, Key, Value) -> %%Initialize the tree
	{node, {Key, Value, {node, 'nil'}, {node, 'nil'}}};
insert({node, {CKey, CVal, Smaller,Larger}}, Key, Value) %% when you want to insert something smaller.
	when Key < CKey -> {node, {CKey, CVal, insert(Smaller, Key, Value), Larger}}; 
insert({node, {CKey, CVal, Smaller,Larger}}, Key, Value)
	when Key > CKey -> {node, {CKey, CVal, Smaller, insert(Larger, Key, Value)}};
insert({node, {CKey, CVal, Smaller,Larger}}, Key, Value)
	when Key =:= CKey -> {node, {CKey, Value, Smaller, Larger}}.

lookup({node, {Key, Value, Smaller, Larger}}, KeyToFind)
	when KeyToFind < Key -> lookup(Smaller, KeyToFind);
lookup({node, {Key, Value, Smaller, Larger}}, KeyToFind)
	when KeyToFind > Key -> lookup(Larger, KeyToFind);
lookup({node, {Key, Value, Smaller, Larger}}, KeyToFind)
	when KeyToFind =:= Key -> Value.


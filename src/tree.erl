%%%-------------------------------------------------------------------
%%% @author sarawgir
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Jul 2014 2:25 PM
%%%-------------------------------------------------------------------
-module(tree).
-author("sarawgir").

%% API
-export([empty/0, insert/3, lookup/2]).

empty() -> {node, 'nil'}.

insert(Key,Val,{node, 'nil'}) -> {node, {Key, Val, {node,'nil'}, {node, 'nil'}}};
insert(NewKey, NewVal, {node, {Key, Val, Smaller, Larger}})
  when NewKey < Key -> {node, {Key, Val, insert(NewKey,NewVal,Smaller), Larger}};
insert(NewKey, NewVal, {node, {Key, Val, Smaller, Larger}})
  when NewKey > Key -> {node, {Key, Val, Smaller, insert(NewKey, NewVal, Larger)}};
insert(Key, Val, {node, {Key, _, Smaller, Larger}}) -> {node, {Key, Val, Smaller, Larger}}.

lookup(_,{node,'nil'}) -> undefined;

lookup(Key, {node,{Key, Val,_,_}}) -> {ok, Val};
lookup(Key, {node,{NodeKey,_, Smaller, _}})
  when Key < NodeKey -> lookup(Key, Smaller);
lookup(Key, {node, {NodeKey, _, _, Larger}})
  when Key > NodeKey -> lookup(Key, Larger).
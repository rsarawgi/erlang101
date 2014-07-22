%%%-------------------------------------------------------------------
%%% @author sarawgir
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Jul 2014 2:44 PM
%%%-------------------------------------------------------------------
-module(records).
-author("sarawgir").

%% API
-compile(export_all).

-record(robot, {name,
                type=industrial,
                hobbies,
                details=[]}).

-record(user, {id, name, group, age}).

first_robot() ->
  #robot{name="Mechatron",
    type=handmade,
    details=["Moved by a small man inside"]}.

car_factory(CorpName) ->
  #robot{name=CorpName, hobbies="building cars"}.

%% use pattern matching to filter
admin_panel(#user{name=Name, group=admin}) ->
  Name ++ " is allowed!";
admin_panel(#user{name=Name}) ->
  Name ++ " is not allowed".

%% can extend user without problem
adult_section(U = #user{}) when U#user.age >= 18 ->
%% Show stuff that can't be written in such a text
  allowed;
adult_section(_) ->
%% redirect to sesame street site
  forbidden.
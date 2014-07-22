%%%-------------------------------------------------------------------
%%% @author sarawgir
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Jul 2014 11:11 AM
%%%-------------------------------------------------------------------
-module(exceptions).
-author("sarawgir").

%% API
-compile(export_all).

throws(F) ->
  try F() of
    _ -> ok
  catch
    Throw -> {throw, caught, Throw};
    error:Error -> {error, Error}
  end.

sword(1) -> throw(slice);
sword(2) -> erlang:error(cut_arm);
sword(3) -> exit(cut_leg);
sword(4) -> throw(punch);
sword(5) -> exit(cross_bridge).

black_knight(Attack) when is_function(Attack, 0) ->
  try Attack() of
    _ -> "None shall pass."
  catch
    throw:slice -> "It is but a scratch";
    error:cut_arm -> "I've had worse";
    exit:cut_leg -> "Come on you pansy!";
    _:_  -> "Just a flesh wound"
  end.

talk() -> "blah blah".

whoa() ->
  try
    talk(),
    _Knight = "None shall Pass!",
    _Doubles = [N*2 || N <- lists:seq(1,100)],
    throw(up),
    _WillReturnThis = tequila
  of
    tequila -> "hey this worked!"
  catch
    Exception:Reason -> {caught, Exception, Reason}
  end.

im_impressed() ->
  try
    talk(),
    _Knight = "None shall Pass!",
    _Doubles = [N*2 || N <- lists:seq(1,100)],
    throw(up),
    _WillReturnThis = tequila
  catch
    Exception:Reason -> {caught, Exception, Reason}
  end.
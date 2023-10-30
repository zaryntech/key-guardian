%%%-------------------------------------------------------------------
%% @doc key_guardian public API
%% @end
%%%-------------------------------------------------------------------

-module(key_guardian_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    key_guardian_sup:start_link().

stop(_State) ->
    ok.

%% internal functions

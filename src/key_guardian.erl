-module(key_guardian).
-author("Zaryn Technologies").
-export([gen_address/1]).

gen_address(N) ->
    keys:generate(N).
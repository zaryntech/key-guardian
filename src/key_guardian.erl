-module(key_guardian).
-author("Zaryn Technologies").
-export([gen_address/1]).

%% Generate Secure Key using Length of address 
gen_address(N) ->
    keys:generate(N).
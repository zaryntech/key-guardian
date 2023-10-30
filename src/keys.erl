-module(keys).
-author("Zaryn Technologies").
-export([generate/1, ecdh_named_curve/0, ecdh_edwards_curve_dh/0, eddsa_edwards_curve_ed/0,
srp_comp/0, list_ec_curves/0]).

generate(N) ->
    Data = srp_comp(),
    StringData = binary_to_list(Data),
    String = lists:flatten([integer_to_list(Byte) || Byte <- StringData]),
    FixedLengthString = pad_or_truncate(String, N),
    FixedLengthString.

% 
pad_or_truncate(String, Length) when length(String) < Length ->
    % Pad the string with zeros on the right side
    lists:concat([String, lists:seq($0, Length - length(String) - 1)]);

pad_or_truncate(String, Length) when length(String) > Length ->
    % Truncate the string to the specified length
    lists:sublist(String, 1, Length);

pad_or_truncate(String, Length) ->
    % The string is already of the desired length
    String.

ecdh_named_curve() ->
    {PublicKey, PrivKeyOut} = crypto:generate_key(ecdh, brainpoolP512t1).

ecdh_edwards_curve_dh() ->
    {PublicKey, PrivKeyOut} = crypto:generate_key(ecdh, x25519).

eddsa_edwards_curve_ed() ->
    {PublicKey, PrivKeyOut} = crypto:generate_key(eddsa, ed25519).

srp_comp() ->
    RandAtom = rand_atom:generate(),
    Data = ecdh_edwards_curve_dh(),
    Data2 = ecdh_named_curve(),
    BinaryData = term_to_binary(Data),
    BinaryData2 = term_to_binary(Data2),
    DerivedKey = crypto:hash(blake2b, BinaryData),
    Prime = crypto:hash(blake2b, BinaryData2),
    {PublicKey, PrivKeyOut} = 
    crypto:generate_key(srp, {user, [DerivedKey, Prime, RandAtom]}),
    X = crypto:hash(sha3_512, PrivKeyOut),
    Y = crypto:hash(sha3_512, X),
    Y.

list_ec_curves() ->
    crypto:ec_curves().



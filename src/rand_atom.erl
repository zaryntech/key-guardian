-module(rand_atom).
-author("Zaryn Technologies").
-export([generate/0]).

generate() ->
    Atoms = [sky, coffee, blue, apple, fish, green, android, tomato, beer, tiger,
    linux, dark, cold, rap, sunday, bitcoin, ground, food, chair, funny, skin, shampoo, dog,
    swiss, teacher, smart, sun],
    RandomIndex = rand:uniform(length(Atoms)),
    lists:nth(RandomIndex, Atoms).

    


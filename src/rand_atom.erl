-module(rand_atom).
-author("Zaryn Technologies").
-export([generate/0]).

%% Generate Random atoms 
generate() ->
    Atoms = [sky, coffee, blue, apple, fish, green, android, tomato, beer, tiger,
    linux, dark, cold, rap, sunday, bitcoin, ground, food, chair, funny, skin, shampoo, dog,
    swiss, teacher, smart, sun, rain, husky, crying, horse, koala, melbourne, helsinki, london,
    tehran, vanvouver, dubai, istanbul, red, black, green, yellow, blue, white, big, small],
    RandomIndex = rand:uniform(length(Atoms)),
    lists:nth(RandomIndex, Atoms).

    


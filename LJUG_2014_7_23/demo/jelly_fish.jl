using JellyFish
@show jaro_winkler("jellyfish", "smellyfish")
#> jaro_winkler("jellyfish","smellyfish") => 0.8962962962962964

looking_for = "Frank Spencer"

names = ["Betty", "Frenk Spancer", "Jessica", "Mrs. Fisher", "Nigel Spencer"]
jw = map(x -> jaro_winkler(looking_for, x), names)
found = names[indmax(jw)]
println("found: $found")
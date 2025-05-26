--gc member pool
SMODS.ObjectType({
    key = "gcmember",
    default = "j_reserved_parking",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end,
})



--load files
assert(SMODS.load_file("items/jokers.lua"))()
assert(SMODS.load_file("items/decks.lua"))()
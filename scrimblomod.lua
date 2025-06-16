--enable optional contexts
SMODS.current_mod.optional_features = {
  retrigger_joker = true,
  cardareas = true
}

--gc member pool
SMODS.ObjectType({
    key = "gcmember",
    default = "j_scring_scrimblojoker",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end,
})

--scrimblo addition pool
SMODS.ObjectType({
  key = "scrimbloaddition",
  default = "j_scring_zazu",
  cards = {},
  inject = function(self)
    SMODS.ObjectType.inject(self)
  end
})

--load files
assert(SMODS.load_file("items/jokers.lua"))()
assert(SMODS.load_file("items/consumables.lua"))()
assert(SMODS.load_file("items/blinds.lua"))()
assert(SMODS.load_file("items/decks.lua"))()
assert(SMODS.load_file("items/sleeves.lua"))()
assert(SMODS.load_file("items/packs.lua"))()
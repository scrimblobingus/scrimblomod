SMODS.Joker {
    key = "mask",
    name = "mask",
    atlas = "maskatlas",
    pos = {x = 0, y = 0},
    config = {extra = {joker_slots = 3, odds = 15}},
    unlocked = true,
    rarity = "cry_epic",
    cost = 11,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    pools = {["scrimbloaddition"] = true, ["normalscring"] = true},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.joker_slots, G.GAME.probabilities.normal, center.ability.extra.odds}}
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if pseudorandom("maskdestroy") < G.GAME.probabilities.normal / card.ability.extra.odds then
                somebodystopme()
            end
        end


    end
}
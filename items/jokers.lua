SMODS.Atlas {
    key = "jumboatlas",
    path = "jumbojosh.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "jumbojosh",
    name = "jumbojosh",
    atlas = "jumboatlas", 
    pos = {x = 0, y = 0},
    unlocked = true,
    discovered = true,
    no_collection = false,
    rarity = 3,
    cost = 4,
    config = { extra = {Xmult = 87}},
    loc_txt = {
        name = "Jumbo Josh",
        text = {
            "Gives {X:mult,C:white}X#1#{} Mult",
            "if hand contains a Jack."
        }
    },

    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.Xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            local hasjack = false
            for i = 1, #context.scoring_hand do
                if context.full_hand[i]:get_id() == 11 then
                    hasjack = true
                end
            end

            if hasjack == true then
                return {
                    message = localize({
                        type = "variable",
                        key = "j_xmult",
                        vars = {number_format(card.ability.extra.Xmult)},
                    }),
                    Xmult_mod = card.ability.extra.Xmult
                }
            end
        end
    end,
}
SMODS.Atlas {
    key = "raceatlas",
    path = "racejoker.png",
    px = 71,
    py = 95
}



SMODS.Joker {
    key = "racejoker",
    name = "racejoker",
    atlas = "raceatlas",
    pos = {x = 0, y = 0},
    config = {extra = {dollars = 5}},
    loc_txt = {
        name = "Robloxian",
        text = {
            "Gives {C:money}$#1#{}",
            "when {C:dark_edition}Foil{} card or",
            "joker is triggered.",
        }
    },
    rarity = 4,
    cost = 12,
    pools = {["gcmember"] = true},
    unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.dollars}}
    end,

    calculate = function(self, card, context)
        if context.other_joker and context.other_joker.edition and context.other_joker.edition.foil == true then
            return {
                message = "past of tooth!",
                dollars = card.ability.extra.dollars
            }
        end
        if context.cardarea == G.play and context.individual then
            if context.other_card.edition and context.other_card.edition.foil == true then
                return {
                    message = "past of tooth?",
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}

SMODS.Atlas {
    key = "mattatlas",
    path = "mattjoker.png",
    px = 71,
    py = 95
}


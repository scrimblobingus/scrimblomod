SMODS.Atlas {
    key = "gcatlas",
    path = "gcatlas.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "racejoker",
    name = "racejoker",
    atlas = "gcatlas",
    pos = {x = 0, y = 0},
    config = {extra = {dollars = 10}},
    loc_txt = {
        name = "Robloxian",
        text = {
            "Earn {C:money}$#1#{}",
            "when {C:dark_edition}Foil{}",
            "card or joker is triggered.",
        }
    },
    rarity = 4,
    cost = 20,
    pools = {["gcmember"] = true, ["scrimbloaddition"] = true},
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
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

        if context.individual and context.cardarea == G.play then
            if context.other_card.edition and context.other_card.edition.foil == true then
                return {
                    message = "past of tooth!",
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}

SMODS.Joker {
    key = "mattjoker",
    name = "mattjoker",
    atlas = "gcatlas",
    pos = {x = 1, y = 0},
    config = {extra = {Xmultamt = 0.25, Xmult = 1}},
    loc_txt = {
        name = "some guy",
        text = {
            "Gains {X:mult,C:white}X#1#{} Mult",
            "whenever a {C:dark_edition}Holographic{}",
            "card or joker is triggered.",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult){}",
        }
    },
    rarity = 4,
    cost = 20,
    pools = {["gcmember"] = true, ["scrimbloaddition"] = true},
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xmultamt, center.ability.extra.Xmult}}
    end,

    calculate = function(self, card, context)
        if context.other_joker and context.other_joker.edition and context.other_joker.edition.holo == true then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmultamt
            return {
                message = "ENHANCE!"
            }
        end

        if context.individual and context.cardarea == G.play then
            if context.other_card.edition and context.other_card.edition.holo == true then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmultamt
                return {
                    message = "ENHANCE!"
                }
            end
        end

        if context.joker_main and card.ability.extra.Xmult > 0 then
            return {
                message = "NO SCORING MESSAGE!",
                Xmult_mod = card.ability.extra.Xmult
            }
        end


    end
}

SMODS.Joker {
    key = "oakjoker",
    name = "oakjoker",
    atlas = "gcatlas",
    pos = {x = 2, y = 0},
    config = {extra = {chips = 200, Xchips = 3, odds = 2, Xodds = 6}},
    loc_txt = {
        name = "zombieman6475",
        text = {
            "When a {C:dark_edition}Polychrome{}",
            "card or joker triggers,",
            "{C:green}#3# in #4#{} chance for {C:chips}+#1#{} Chips",
            "{C:green}#3# in #5#{} chance for {X:chips,C:white}X#2#{} Chips"
        }
    },
    rarity = 4,
    cost = 20,
    pools = {["gcmember"] = true, ["scrimbloaddition"] = true},
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    display_size = { w = 71, h = 95 },
    pixel_size = { w = 71, h = 95 },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.chips, center.ability.extra.Xchips, G.GAME.probabilities.normal or 1, center.ability.extra.odds, center.ability.extra.Xodds}}
    end,

    calculate = function(self, card, context)
        if context.other_joker and context.other_joker.edition and context.other_joker.edition.polychrome == true then
            if pseudorandom("oakchips") < G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    message = "jolly!",
                    chips = card.ability.extra.chips,
                    extra = pseudorandom("oakxchips") < G.GAME.probabilities.normal / card.ability.extra.Xodds and {
                        message = "jollier!",
                        Xchip_mod = card.ability.extra.Xchips
                    } or nil
                }
                elseif pseudorandom("oakxchips") < G.GAME.probabilities.normal / card.ability.extra.Xodds then
                    return {
                        message = "jollier!",
                        Xchip_mod = card.ability.extra.Xchips
                    }
            end
        end

        if context.individual and context.cardarea == G.play then
            if context.other_card.edition and context.other_card.edition.polychrome == true then
                if pseudorandom("oakchips") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    return {
                        message = "jolly!",
                        chips = card.ability.extra.chips,
                        extra = pseudorandom("oakxchips") < G.GAME.probabilities.normal / card.ability.extra.Xodds and {
                            message = "jollier!",
                            Xchip_mod = card.ability.extra.Xchips
                        } or nil
                    }
                    elseif pseudorandom("oakxchips") < G.GAME.probabilities.normal / card.ability.extra.Xodds then
                        return {
                            message = "jollier!",
                            Xchip_mod = card.ability.extra.Xchips
                        }
                end
            end
        end
    end
}

SMODS.Joker {
    key = "scrimblojoker",
    name = "scrimblojoker",
    atlas = "gcatlas",
    pos = {x = 3, y = 0},
    config = {},
    rarity = 4,
    cost = 20,
    pools = {["gcmember"] = true, ["scrimbloaddition"] = true},
    loc_txt = {
        name = "{C:dark_edition,E:2}scrimblo bingus{}",
        text  ={
            "{C:attention}Retrigger{} all {C:dark_edition}Negative{}",
            "cards and jokers.",
            "{C:inactive,s:0.8}the one and only{}"
        }
    },
    calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= card then
            if context.other_card.edition and context.other_card.edition.negative == true then
                return {
                    message = "again!",
                    repetitions = 1,
                    card = card
                }
            end
        end

        if context.repetition and context.cardarea == G.play then
            if context.other_card.edition and context.other_card.edition.negative == true then
                return {
                    message = "again!",
                    repetitions = 1,
                    card = card
                }
            end
        end
    end
}

SMODS.Atlas {
    key = "foneatlas",
    path = "tmobile.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "selfone",
    name = "selfone",
    atlas = "foneatlas",
    pos = {x = 0, y = 0},
    config = {extra = {dollars = 5}},
    unlocked = true,
    no_collection = false,
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = {["scrimbloaddition"] = true},
    loc_txt = {
        name = "sel fone",
        text = {
            "Earn {C:money}$#1#{} whenever a {C:cry_code}Code{} card is used."
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.dollars}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Code" then
            return {
                message = "lods of emone",
                dollars = card.ability.extra.dollars
            }
        end
    end
}

SMODS.Atlas {
    key = "onyxatlas",
    path = "onyx.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "onyxjoker",
    name = "onyxjoker",
    atlas = "onyxatlas",
    pos = {x = 0, y = 0},
    unlocked = true,
    rarity = "cry_epic",
    cost = 12,
    config = {extra = {Xmult = 0.75}},
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pools = {["scrimbloaddition"] = true},
    loc_txt = {
        name = "Onyx",
        text = {
            "Create a {C:dark_edition}Negative Tag{}",
            "when {C:attention}Blind{} is selected.",
            "{X:mult,C:white}X#1#{} Mult"
        }
    },

    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xmult}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    add_tag(Tag('tag_negative'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    return true
                end
            }))
            return {
                message = "A gift."
            }
        end

        if context.joker_main then
            return {
                message = "An ailment.",
                Xmult_mod = card.ability.extra.Xmult
            }
        end
    end
}

SMODS.Atlas {
    key = "zazuatlas",
    path = "zazu.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "zazu",
    name = "zazu",
    atlas = "zazuatlas",
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    config = {extra = {Echips = 87, Emult = 87, dollars = 87}},
    unlocked = true,
    discovered = false,
    rarity = "cry_exotic",
    cost = 87,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pools = {["scrimbloaddition"] = true},
    loc_txt = {
        name = "{C:edition,e:1}zazu{}",
        text = {
            "{X:dark_edition,C:white}^#1#{} Chips",
            "{X:dark_edition,C:white}^#2#{} Mult",
            "Earn {C:money}$#3#{} at end of round"
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Echips, center.ability.extra.Emult, center.ability.extra.dollars}}
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = "melon",
                Echips_mod = card.ability.extra.Echips,
                Emult_mod = card.ability.extra.Emult
            }
        end
    end,

    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}

SMODS.Atlas {
    key = "speakeratlas",
    path = "drivethru.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "speaker",
    name = "speaker",
    atlas = "speakeratlas",
    pos = {x = 0, y = 0},
    config = {extra = {Xmult = 3}},
    unlocked = true,
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = {["scrimbloaddition"] = true},
    loc_txt = {
        name = "Drive Thru Speaker",
        text = {
            "{X:mult,C:white}X#1#{} Mult if hand contains a",
            "6 and a 7",
            '{C:inactive,s:0.8}isnt it your bedtime, {}{C:attention,s:0.8}Unc?{}'
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xmult}}
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local has6 = false
            local has7 = false
            for i = 1, #context.scoring_hand do
                if context.full_hand[i]:get_id() == 6 then
                    has6 = true
                end

                if context.full_hand[i]:get_id() == 7 then
                    has7 = true
                end
            end
            if has6 == true and has7 == true then
                return {
                    message = "$67.67",
                    Xmult_mod = card.ability.extra.Xmult
                }
            end
        end
    end
}

SMODS.Atlas {
    key = "houseatlas",
    path = "house.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "house",
    name = "house",
    atlas = "houseatlas",
    pos = {x = 0, y = 0},
    config = {extra = {type = "Full House"}},
    unlocked = true,
    rarity = 3,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = {["scrimbloaddition"] = true},
    loc_txt = {
        name = "Dr. House",
        text = {
            "Create a random {C:attention}Consumable{}",
            "if played poker hand is a {C:attention}Full House{}"
        }
    },

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card{set="Consumeables", area=G.consumeables, no_edition=true}
                    return true
                end
            }))

            return {
                message = "did you try the medicine drug"
            }
        end
    end
}

SMODS.Atlas {
    key = "maskatlas",
    path = "mask.png",
    px = 71,
    py = 95
}

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
    pools = {["scrimbloaddition"] = true},
    loc_txt = {
        name = "The Mask",
        text = {
            "{C:attention}+#1#{} Joker slots",
            "{C:green}#2# in #3#{} chance of {C:attention}crashing{}",
            "the game when blind is selected."
        }
    },
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

SMODS.Atlas {
    key = "antonatlas",
    path = "anton.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "anton",
    name = "anton",
    atlas = "antonatlas",
    pos = {x = 0, y = 0},
    config = {extra = {repetitions = 1}},
    unlocked = true,
    rarity = "cry_epic",
    cost = 14,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = {["scrimbloaddition"] = true},
    loc_txt = {
        name = "Anton Ego",
        text = {
            "{C:attention}Retigger{} all played cards",
            "{C:attention}#1#{} time(s)"
        }
    },

    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.repetitions}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            return {
                message = "flashback",
                repetitions = card.ability.extra.repetitions,
                card = card
            }
        end
    end
}
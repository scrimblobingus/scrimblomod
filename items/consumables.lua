SMODS.Atlas {
    key = "wheel",
    path = "wheel.png",
    px = 71,
    py = 95
}

SMODS.Consumable {
    key = 'wheel',
    set = 'Tarot',
    atlas = "wheel",
    pos = {x = 0, y = 0},
    config = { extra = { odds = 99999999999999 } },
    loc_txt = {
        name = "wheel :)",
        text = {
            "{C:green}1 in 2{} chance to add",
            "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
            "{C:dark_edition}Polychrome{} edition",
            "to a random {C:attention}Joker"
        }
    },
    use = function(self, card, area, copier)
        if pseudorandom('scring_wheel') < G.GAME.probabilities.normal / card.ability.extra.odds then
            local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

            local eligible_card = pseudorandom_element(editionless_jokers, pseudoseed("scring_wheel"))
            local edition = poll_edition('scring_wheel', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil' })
            eligible_card:set_edition(edition, true)
            check_for_unlock({ type = 'have_edition' })
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end
}

SMODS.Atlas {
    key = "hatlas",
    path = "htarot.png",
    px = 71,
    py = 95
}

SMODS.Consumable {
    key = "h",
    set = "Tarot",
    atlas = "hatlas",
    pos = {x = 0, y = 0},
    config = {extra = {dollars = 5}},
    loc_txt = {
        name = "H",
        text = {
            "{C:edition,e:1}yeah{}"
        }
    },

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("timpani")
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.dollars, true)
                return true
            end
        }))
        delay(0.6)
    end,

    can_use = function(self, card)
        return true
    end
}

SMODS.Atlas {
    key = "drinkatlas",
    path = "drink.png",
    px = 71,
    py = 95
}

SMODS.Consumable {
    key = "drink",
    set = "Spectral",
    atlas = "drinkatlas",
    pos = {x = 0, y = 0},
    config = {},
    loc_txt = {
        name = "you will drink and drive",
        text = {
            "Converts every card in deck to {C:spades}Spades{}"
        }
    },
    use = function (self, card, area, copier)
        for k, v in pairs(G.playing_cards) do
            if v.base.suit ~= 'Spades' then
                v:change_suit('Spades')
            end
        end
        
    end,

    can_use = function (self, card)
        return true
    end
}
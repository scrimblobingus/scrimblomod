SMODS.Atlas {
    key = "debugatlas",
    path = "debugdeck.png",
    px = 142,
    py = 190
}

SMODS.Atlas {
    key = "discordatlas",
    path = "discord.png",
    px = 69,
    py = 93
}

SMODS.Back {
    key = "discordeck",
    atlas = "discordatlas",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = "Discord Deck",
        text = {
            "Start with a random {C:legendary}GC Member{}",
            "All cards appear with an {C:dark_edition,E:1}Edition{}",
        }
    },
    
    unlocked = true,
    discovered = true,
    no_collection = false,
    config = {},
    order = 87,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    SMODS.add_card{set="gcmember", area=G.jokers}
                    return true
                end
            end,
        }))


        local card_update_ref = Card.update
        function Card:update(dt)
            if G.shop_jokers and G.shop_jokers.cards then
                for k, v in pairs(G.shop_jokers.cards) do
                    if not v.edition then
                        v:set_edition(poll_edition(nil, nil, false, true, {
                            {name = 'e_foil', weight = 1,},
                            {name = 'e_holo', weight = 1,},
                            {name = 'e_polychrome', weight = 1,},
                            {name = 'e_negative', weight = 1,}
                        }))
                    end
                end
            end
            card_update_ref(self, dt)
            -- or here
        end

    end
}
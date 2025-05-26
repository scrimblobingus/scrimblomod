SMODS.Atlas {
    key = "debugatlas",
    path = "debugdeck.png",
    px = 142,
    py = 190
}

SMODS.Back {
    key = "discordeck",
    atlas = "debugatlas",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = "Discord Deck",
        text = {
            "Start with a random {C:legendary}GC Member{}",
            "All cards appear with an {C:edition}Edition{}",
        }
    },
    
    unlocked = true,
    discovered = true,
    no_collection = false,
    config = {vouchers = {"v_hone", "v_glow_up"}},
    order = 87,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    --local gcgoer = add_card("gcmember", G.jokers, true, 4, false, false)
                    SMODS.add_card("gcmember", G.jokers, true, 4, false, false)
                    --gcgoer:add_to_deck()
                    --gcgoer:start_materialize()
                    --G.jokers:emplace(gcgoer)
                    return true
                end
            end,
        }))
    end
}
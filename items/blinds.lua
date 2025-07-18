SMODS.Atlas {
    key = "dishblind",
    path = "dishwasher.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    key = "final_dish",
    dollars = 0,
    mult = 999,
    atlas = "dishblind",
    pos = {y = 0},
    loc_txt = {
        name = "dishwasher",
        text = {
            "slightly larger than average blind",
            "crash game if Robloxian is owned"
        }
    },
    boss = {showdown = true},
    boss_colour = HEX("e2e2e2"),

    set_blind = function(self)
        if #SMODS.find_card("j_scring_racejoker") > 0 then
            --this function doesn't exist and thus causes a crash
            fuckYou()
        end
    end
}

SMODS.Atlas {
    key = "scaryblind",
    path = "scary.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = "ANIMATION_ATLAS"
}

SMODS.Blind {
    key = "final_scary",
    dollars = 1,
    mult = 2,
    atlas = "scaryblind",
    pos = {y = 0},
    loc_txt = {
        name = "Dark Despair",
        text = {
            "Writhe in despair."
        }
    },
    boss = {showdown = true},
    boss_colour = HEX("000000"),

    set_blind = function (self)
        local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_scring_job")
        card.ability.cry_absolute = true
        card:add_to_deck()
        G.jokers:emplace(card)
    end
}
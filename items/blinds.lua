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
            forceGameover()
        end
    end
}
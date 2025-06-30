SMODS.Atlas {
    key = "wowatlas",
    path = "wow.png",
    px = 34,
    py = 34
}

SMODS.Tag {
    key = "wow",
    atlas = "wowatlas",
    pos = {x = 0, y = 0},
    config = {},
    loc_txt = {
        name = "wow",
        text = {
            "spawns {C:dark_edition}the most powerful joker ever{}"
        }
    },

    apply = function (self, tag, context)
        if context.type == "immediate" then
            tag:yep("+", G.C.MULT, function ()
                return true
            end)
            G.FUNCS.overlay_menu{
                definition = create_UIBox_custom_video1("dumbass","dumbass"),
                config = {no_esc = true}
            }
            local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_scring_job")
            card.ability.cry_absolute = true
            card:add_to_deck()
            G.jokers:emplace(card)
            tag.triggered = true
            return true
        end
    end
}
SMODS.Shader {
    key = "superultrafuckinghd",
    path = "superhd.fs"
}

SMODS.Edition {
    key = "superultrafuckinghd",
    shader = "superultrafuckinghd",
    atlas = "foneatlas",
    pos = {x = 0, y = 0},
    config = {e_chips = 87, e_mult = 87, p_dollars = 87},
    in_shop = false,
    weight = 3,
    extra_cost = 87,
    apply_to_float = false,
    badge_colour = G.C.EDITION,
    loc_txt = {
        name = "Super Ultra Fucking HD",
        text = {
            "{C:edition,E:1}gaze upon it's glory{}"
        },
        label = "Super Ultra Fucking HD"
    },

    get_weight = function(self)
	    return G.GAME.edition_rate * self.weight
    end,

    calculate = function (self, card, context)
        if (context.edition and context.cardarea == G.jokers and card.config.trigger) or (context.main_scoring and context.cardarea == G.play) then
            return {
                e_chips = self.config.e_chips,
                e_mult = self.config.e_mult,
                p_dollars = self.config.p_dollars
            }
        end
    end
}

local miscitems = {
    superultrafuckinghd_shader,
    superultrafuckinghd,
        }

return {
    name = "Misc.",
    items = miscitems,
}
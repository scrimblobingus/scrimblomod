SMODS.Shader {
    key = "superultrafuckinghd",
    path = "superhd.fs"
}

SMODS.Sound {
    key = "choir",
    path = "choir.ogg"
}

SMODS.Shader {
    key = "subspaced",
    path = "subspace.fs"
}

SMODS.Sound {
    key = "explode",
    path = "explode.ogg"
}

SMODS.Edition {
    key = "superultrafuckinghd",
    shader = "superultrafuckinghd",
    config = {e_chips = 87, e_mult = 87, p_dollars = 87},
    in_shop = true,
    weight = 0.000087,
    sound = {sound = "scring_choir", per = 1.2, vol = 0.9},
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

SMODS.Edition {
    key = "subspaced",
    shader = "subspaced",
    config = {x_chips = 0.75, x_mult = 0.75},
    in_shop = false,
    weight = 0,
    sound = {sound = "scring_explode", per = 1.2, vol = 0.6},
    extra_cost = 0,
    apply_to_float = false,
    badge_colour = G.C.SUITS.Hearts,
    loc_txt = {
        name = "Subspaced",
        text = {
            "{X:chips,C:white}X#1#{} Chips, {X:mult,C:white}X#2#{} Mult"
        },
        label = "Subspaced"
    },

    loc_vars = function (self, info_queue)
        return {vars = {self.config.x_chips, self.config.x_mult}}
    end,

    calculate = function (self, card, context)
        if (context.edition and context.cardarea == G.jokers and card.config.trigger) or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_chips = self.config.x_chips,
                x_mult = self.config.x_mult
            }
        end
        if context.joker_main then
            card.config.trigger = true
        end
    end
}


-- i have no clue what this is :sob:
local miscitems = {
    superultrafuckinghd_shader,
    superultrafuckinghd,
    subspaced,
    subspaced_shader
        }

return {
    name = "Misc.",
    items = miscitems,
}
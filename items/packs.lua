SMODS.Atlas {
    key = "discordpackatlas",
    path = "discordpack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "discordpack",
    atlas = "discordpackatlas",
    pos = {x = 0, y = 0},
    config = {extra = 4, choose = 1},
    cost = 15,
    weight = 0.18,
    draw_hand = false,
    select_card = "jokers",
    loc_txt = {
        name = "Discord Pack",
        text = {
            "Choose {C:attention}#1#{} from of the {C:dark_edition,E:1}GC Members{}"
        },
        group_name = "Discord Pack"
    },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        ease_background_colour(HEX("a742f5"))
        return SMODS.create_card{
            set = "gcmember",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
        }
    end,

    in_pool = function()
        return true
    end
}

SMODS.Atlas {
    key = "scrimblopackatlas",
    path = "scrimblopack.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "scrimblopack",
    atlas = "scrimblopackatlas",
    pos = {x = 0, y = 0},
    config = {extra = 2, choose = 1},
    cost = 4,
    weight = 1,
    select_card = "jokers",
    draw_hand = false,
    loc_txt = {
        name = "scrimblo pack",
        text = {
            "Choose {C:attention}#1#{} of up to {C:attention}#2#{} scrimblo mod Jokers"
        },
        group_name = "scrimblo pack"
    },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        ease_background_colour(HEX("a742f5"))
        return SMODS.create_card{
            set = "scrimbloaddition",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
        }
    end,

    in_pool = function()
        return true
    end
}

SMODS.Atlas {
    key = "jumboscrimblopackatlas",
    path = "jumboscrimblo.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "jumboscrimblopack",
    atlas = "jumboscrimblopackatlas",
    pos = {x = 0, y = 0},
    config = {extra = 4, choose = 1},
    cost = 6,
    weight = 0.66,
    select_card = "jokers",
    draw_hand = false,
    loc_txt = {
        name = "jumbo scrimblo pack",
        text = {
            "Choose {C:attention}#1#{} of up to {C:attention}#2#{} scrimblo mod Jokers"
        },
        group_name = "scrimblo pack"
    },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        ease_background_colour(HEX("a742f5"))
        return SMODS.create_card{
            set = "scrimbloaddition",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
        }
    end,

    in_pool = function()
        return true
    end
}

SMODS.Atlas {
    key = "megascrimblopackatlas",
    path = "megascrimblo.png",
    px = 71,
    py = 95
}

SMODS.Booster {
    key = "megascrimblopack",
    atlas = "megascrimblopackatlas",
    pos = {x = 0, y = 0},
    cost = 6,
    weight = 0.33,
    select_card = "jokers",
    draw_hand = false,
    loc_txt = {
        name = "mega scrimblo pack",
        text = {
            "Choose {C:attention}#1#{} of up to {C:attention}#2#{} scrimblo mod Jokers"
        },
        group_name = "scrimblo pack"
    },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        ease_background_colour(HEX("a742f5"))
        return SMODS.create_card{
            set = "scrimbloaddition",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
        }
    end,

    in_pool = function()
        return true
    end
}
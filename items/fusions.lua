if FusionJokers then
    SMODS.Joker {
        key = "steamocking",
        name = "steamocking",
        atlas = "steamatlas",
        pos = {x = 2, y = 0},
        config = {extra = {Xchips = 2.5, Xmult = 1.5}},
        unlocked = true,
        rarity = "fuse_fusion",
        cost = 10,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        loc_vars = function(self, info_queue, center)
            return {vars = {center.ability.extra.Xmult, center.ability.extra.Xchips}}
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and not context.other_card:is_face() and not SMODS.has_no_rank(context.other_card) then
                return {
                    message = ":steammocking:",
                    Xchips_mod = card.ability.extra.Xchips,
                    Xmult_mod = card.ability.extra.Xmult
                }
            end
        end
    }

    FusionJokers.fusions:add_fusion(
        "j_scring_steamhappy",
        nil,
        false,
        "j_scring_steamsad",
        nil,
        false,
        "j_scring_steamocking",
        10
    )
end
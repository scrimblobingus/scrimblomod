SMODS.Atlas {
    key = "sleeveatlas",
    path = "sleeves.png",
    px = 73,
    py = 95
}
if CardSleeves then
    CardSleeves.Sleeve {
        key = "discordsleeve",
        atlas = "sleeveatlas",
        pos = {x = 0, y = 0},
        config = {},
        loc_vars = function(self)
            local key, vars
            if self.get_current_deck_key() == "b_scring_discordeck" then
                key = self.key .. "_alt"
            else
                key = self.key
            end
            return{key = key}
        end,

        apply = function(self, sleeve)
            if self.get_current_deck_key() == "b_scring_discordeck" then
                G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 3
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.jokers then
                            SMODS.add_card{set="gcmember", area=G.jokers}
                            return true
                        end
                    end
                }))
                
                
                if G.GAME.selected_sleeve == "sleeve_scring_discordsleeve" then
                    local card_update_ref = Card.update
                    function Card:update(dt)
                        if G.shop_jokers and G.shop_jokers.cards then
                            for k, v in pairs(G.shop_jokers.cards) do
                                if not v.edition and G.GAME.selected_sleeve == "sleeve_scring_discordsleeve" then
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
                    end
                end

            end
        end,


    }
end
local jd_def = JokerDisplay.Definitions

jd_def["j_scring_mattjoker"] = {
    text = {
        {border_nodes = {
            {text = "X"},
            {ref_table = "card.joker_display_values", ref_value = "Xmult", retrigger_type = "exp"}
        }}
    }
}
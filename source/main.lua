SMODS.load_file("source/hands.lua")()

SMODS.current_mod.calculate = function(self, context)
    if context.using_consumeable then
        local key = context.consumeable.config.center_key
        local hand_map = {
            c_mercury = 'mcjk_Pair_Flush',
            c_venus = 'mcjk_Flush_Three',
            c_uranus = 'mcjk_Two_Pair_Flush',
            c_mars = 'mcjk_Flush_Four',
            c_jupiter = "mcjk_Wild_Flush"
        }
        if hand_map[key] then
            local hand_key = hand_map[key]
            if G.GAME.hands[hand_key] then
                SMODS.upgrade_poker_hands({hands = {hand_key}, per_level = {chips = G.GAME.hands[hand_key].l_chips, mult = G.GAME.hands[hand_key].l_mult}, instant = false, from = nil})
            end
        end
    end
    if context.final_scoring_step then
        if context.scoring_name == "mcjk_777" then
            if pseudorandom("mcjk_nxc8ff0") <= 0.1 then
                level_up_hand(context.after, "mcjk_777", false, 1)
            end
        end
    end
end

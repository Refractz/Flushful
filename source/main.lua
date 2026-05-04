SMODS.load_file("source/hands.lua")()

SMODS.current_mod.calculate = function(self, context)
    if context.using_consumeable then
        local key = context.consumeable.config.center_key
        local hand_map = {
            c_mercury = 'mcjk_Pair Flush',
            c_venus = 'mcjk_Flush Three',
            c_uranus = 'mcjk_Two Pair Flush',
            c_mars = 'mcjk_Flush Four',
        }
        if hand_map[key] then
            level_up_hand(context.consumeable, hand_map[key], false, 1)
        end
    end
    if context.final_scoring_step then
        print("test")
        if context.scoring_name == "mcjk_777" then
            if pseudorandom("mcjk_nxc8ff0") <= 0.1 then
                level_up_hand(context.after, "mcjk_777", false, 1)
            end
        end
    end
end

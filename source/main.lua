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
end
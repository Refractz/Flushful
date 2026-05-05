SMODS.Joker {
    key = "Klein",
    atlas = "jokeratlas",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            repetitions = 1
        }
    },
    rarity = 3,
    cost = 7,
    loc_vars = function(self, infoqueue, card) 
        return { 
        vars = 
        { 
            card.ability.extra.repetitions,
            colours = { HEX('3F2287') }
         } 
        
    }
        
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then 
            for i, cards in ipairs(context.full_hand) do
                local brep = card.ability.extra.repetitions
                if pseudorandom("mcjk_nxc8ff0") >= 0.5 then
                    brep = brep + 1
                    if pseudorandom("mcjk_nxc8ff0") >= 0.5 then
                        brep = brep + 1
                    end
                end
                return {
                    repetitions = brep
                }
            end
        end
    end
}
SMODS.Joker {
    key = "Klein",
    atlas = "jokeratlas",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            numerator = 1,
            denominator = 4,
            repetitions = 1
        }
    },
    rarity = 3,
    cost = 7,
    loc_vars = function(self, infoqueue, card) 
        
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, "mcjk_nxc8ff0")
        return { 
        
        vars = 
        { 
            num,
            card.ability.extra.repetitions,
            denom
         } 
        
    }
        
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then 
            local rep = card.ability.extra.repetitions
            local failed = false
            while not failed do
                if rep >= card.ability.extra.denominator then
                    failed = true
                end
                if SMODS.pseudorandom_probability(card, 'mcjk_nxc8ff0', card.ability.extra.numerator, card.ability.extra.denominator) then
                    rep = rep + 1
                else
                    failed = true
                end
            end
            return {
                repetitions = rep
            }
        end
    end
}
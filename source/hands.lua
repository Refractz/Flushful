
SMODS.PokerHand {
    key = 'Pair Flush',
    chips = 20,
    mult = 4,
    l_chips = 15,
    visible = true,
    l_mult = 2,
    example = {
        { 'D_9',    true },
        { 'S_K',    false },
        { 'D_9',    true },
        { 'H_7',    false },
        { 'C_T',    false },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Pair Flush',
            description = {
                'Scores if Two cards are played with the same Rank and Suit',
                "Can be played with up to 3 unscored cards"
            }
        }
    },
    evaluate = function(parts, hand)
        if not next(parts._2) then return {} end
        local pair = parts._2[1]
        local suits = SMODS.Suit.obj_buffer
        for x = 1, #suits do
            local suit = suits[x]
            if pair[1]:is_suit(suit, nil, true) and pair[2]:is_suit(suit, nil, true) then
                return { pair }
            end
        end
        return {}
    end,
}

SMODS.PokerHand {
    key = 'Flush Three',
    chips = 30,
    mult = 5,
    l_chips = 20,
    visible = true,
    l_mult = 2,
    example = {
        { 'D_9',    true },
        { 'S_K',    false },
        { 'D_9',    true },
        { 'H_7',    false },
        { 'D_9',    true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Flush Three',
            description = {
                'Scores if Three cards are played with the same Rank and Suit',
                "Can be played with up to 2 unscored cards"
            }
        }
    },
    evaluate = function(parts, hand)
        if not next(parts._3) then return {} end
        local pair = parts._3[1]
        local suits = SMODS.Suit.obj_buffer
        for x = 1, #suits do
            local suit = suits[x]
            if pair[1]:is_suit(suit, nil, true) and pair[2]:is_suit(suit, nil, true) and pair[3]:is_suit(suit, nil, true) then
                return { pair }
            end
        end
        return {}
    end,
}

SMODS.PokerHand {
    key = 'Two Pair Flush',
    chips = 40,
    mult = 4,
    l_chips = 20,
    visible = true,
    l_mult = 2,
    example = {
        { 'D_9',    true },
        { 'S_K',    false },
        { 'D_9',    true },
        { 'H_7',    true },
        { 'H_7',    true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Two Pair Flush',
            description = {
                'Scores if Two pairs are played with the same Rank and Suit',
                "Can be played with up to 1 unscored card"
            }
        }
    },
    evaluate = function(parts, hand)
        if #parts._2 < 2 then return {} end
        local pair1 = parts._2[1]
        local pair2 = parts._2[2]
        local suits = SMODS.Suit.obj_buffer
        local pair1_valid = false
        local pair2_valid = false
        for x = 1, #suits do
            local suit = suits[x]
            if pair1[1]:is_suit(suit, nil, true) and pair1[2]:is_suit(suit, nil, true) then
                pair1_valid = true
            end
            if pair2[1]:is_suit(suit, nil, true) and pair2[2]:is_suit(suit, nil, true) then
                pair2_valid = true
            end
        end
        if pair1_valid and pair2_valid then
            return parts._all_pairs
        end
        return {}
    end,

}
SMODS.PokerHand {
    key = 'Flush Four',
    chips = 90,
    mult = 8,
    l_chips = 40,
    visible = true,
    l_mult = 3,
    example = {
        { 'D_9',    true },
        { 'S_K',    false },
        { 'D_9',    true },
        { 'D_9',    true },
        { 'D_9',    true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Flush Four',
            description = {
                'Scores if Four cards are played with the same Rank and Suit',
                "Can be played with up to 1 unscored card"
            }
        }
    },
    evaluate = function(parts, hand)
        if not next(parts._4) then return {} end
        local pair = parts._4[1]
        local suits = SMODS.Suit.obj_buffer
        for x = 1, #suits do
            local suit = suits[x]
            if pair[1]:is_suit(suit, nil, true) and pair[2]:is_suit(suit, nil, true) and pair[3]:is_suit(suit, nil, true) and pair[4]:is_suit(suit, nil, true) then
                return { pair }
            end
        end
        return {}
    end,
}
SMODS.PokerHand {
    key = "Flush High",
    chips = 100,
    mult = 4,
    l_chips = 50,
    l_mult = 2,
    visible = false,
    example = {
        { 'D_9',    false },
        { 'S_K',    false },
        { 'C_2',    false },
        { 'S_9',    true, enhancement = "m_wild" },
        { 'H_3',    false },
    },
    loc_txt = {
        ['en-us'] = {
            name = "Flush High",
            description = {
                "Scores if you play a high card with the Wildcard enhancement",
                "Can be played with up to 4 unscored cards",
                "(Can not be upgraded)"
            }
        }
    },
    evaluate = function(parts, hand)
        if not next(parts._highest) then return {} end
        local card = parts._highest[1]
        if SMODS.has_any_suit(card[1]) then
            return { card }
        end
        return {}
    end,
}
SMODS.PokerHand {
    key = "777",
    chips = 777,
    mult = 7,
    l_chips = 77,   
    l_mult = 7,
    visible = true,
    example = {
        { 'D_7',    true, enhancement = "m_lucky" },
        { 'S_K',    false },
        { 'D_7',    true, enhancement = "m_lucky" },
        { 'D_7',    true, enhancement = "m_lucky" },
        { 'H_3',    false },
    },
    loc_txt = {
        ['en-us'] = {
            name = "777",
            description = {
                "Scores if you play a 3 7 cards with the Lucky enhancement",
                "Can be played with up to 2 unscored cards",
                "(Can not be upgraded)"
            }
        }
    },
    evaluate = function(parts, hand)
        if not next(parts._3) then return {} end
        local cards = parts._3[1]
        local b = {}
        local count = 0
        for i, card in ipairs(cards) do
            if SMODS.has_enhancement(cards[card], m_lucky) and cards[card]:get_id() == 7 and count <= 3 then
                count = count + 1
                b[#b + 1] = card
            end
        end
        if count == 3 then
            return { b }
        end
        return {}
    end,
}

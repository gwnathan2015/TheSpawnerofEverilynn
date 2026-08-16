local characters = require('characters')
local utils = require('utils')

local character_control = {}

function character_control.swordsman_choose_destination()
    return characters.main_character:pos()
end

function character_control.move_swordsman()
    local swordsman_destination_pos = character_control.swordsman_choose_destination()
    local swordsman_current_pos = characters.swordsman:pos()

    -- destination is x = 5, y = 3
    -- current is     x = 2, y = 9

    local difference_in_x = swordsman_destination_pos.x - swordsman_current_pos.x
    local step_in_x = utils.sign(difference_in_x)

    local difference_in_y = swordsman_destination_pos.y - swordsman_current_pos.y
    local step_in_y = utils.sign(difference_in_y)
    if game_state == 'ingame' then
         -- Only allows -1, 0, 1
        characters.swordsman:move(step_in_x, step_in_y)
    end
end

function character_control.move_main_character(key)
    if key == "w" then
        characters.main_character:move(0, -1)
    elseif key == "a" then
        characters.main_character:move(-1, 0)
    elseif key == "s" then
        characters.main_character:move(0, 1)
    elseif key == "d" then
        characters.main_character:move(1, 0)
    elseif key == "r" then 
        characters.main_character:respawn()
    elseif key == "c" then
        characters.main_character:add_coins(math.random(1, 10))
    end
end



return character_control
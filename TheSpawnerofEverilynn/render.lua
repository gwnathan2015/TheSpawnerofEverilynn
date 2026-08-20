local render = {}

local characters = require('characters')

function render.draw_stats(stats, x, y)
    local health = stats.current_health
    local max_health = stats.max_health
    local health_str = string.format( "PlayerHealth: %d/%d", health, max_health )

    love.graphics.setColor({0.4,0.1,0.2,1})
    love.graphics.print(health_str, x, y)

    love.graphics.setColor({1,1,1,1})
end

if characters.main_characterstats.death_status ~= nil then
	love.graphics.setColor({0.6, 0.15, 0.25, 1})
	love.graphics.print("Press R to Respawn")

	love.graphics.setcolor({1,1,1,1})
end

function render.draw_inventory(inventory, x, y)
    local coins = inventory.coins
    local coins_str = string.format( "Coins: %d", coins)

    love.graphics.setColor({0.4,0.1,0.2,1})
    love.graphics.print(coins_str, x, y)

    love.graphics.setColor({1,1,1,1})
end


function render.draw_ingame()
    local col_number, row_number, row, x_c, y_c
    draw_map(game_map1, sprites)
    characters.draw_characters(sprites)
    draw_map_overlay(game_map1, sprites)
    local max_x = love.graphics.getWidth()

    local max_x = love.graphics.getWidth()

    
    render.draw_stats(characters.main_character.stats, max_x - 250, 30 )
    render.draw_inventory(characters.main_character.inventory, max_x - 250, 100)
end

function render.draw_title()
    local window_width = love.graphics.getWidth()
    local window_height = love.graphics.getHeight()
    local icon_width = iconimg:getPixelWidth()
    local icon_height = iconimg:getPixelHeight()
    --  |------------------------- window_width ---------------|
    --  |                  |..icon_width*0.5.. |               |
    --  |                  <-------                            |
    --  |                         ^ window_width / 2           |
    local icon_x_offest_from_middle = icon_width / 2 / 2
    local icon_y_offest_from_middle = icon_height / 2 / 2

    local text = "The Spawner of Everilynn"
    local font       = love.graphics.getFont()
	local textWidth  = font:getWidth(text)
	local textHeight  = font:getHeight()
    local text_x_offset_from_middle = textWidth / 2
    local text_y_offset_from_middle = icon_y_offest_from_middle + 50

    love.graphics.draw(
        iconimg, 
        window_width/2 - icon_x_offest_from_middle, 
        window_height/2 - icon_y_offest_from_middle, 
        0, 
        0.5, 
        0.5)
    love.graphics.print(
        text, 
        window_width/2 - text_x_offset_from_middle, 
        window_height/2 + text_y_offset_from_middle + 1.5*textHeight
    )
end

return render

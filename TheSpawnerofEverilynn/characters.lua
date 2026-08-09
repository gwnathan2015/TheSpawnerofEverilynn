
local characters = {}

characters.Coordinates = {}

characters.Coordinates.__index = characters.Coordinates

function characters.Coordinates:new(x, y)
    new_object = {
        x = x,
        y = y
    }
    setmetatable(new_object, self)
    new_object.__index = characters.Coordinates
    return new_object
end

function characters.Coordinates:__eq(other)
    return self.x == other.x and self.y == other.y
end

characters.Inventory = {}

characters.Inventory.__index = characters.Inventory

function characters.Inventory:new(with_coins)
    local new_object = {}

    if with_coins then
        new_object['coins'] = 0
    end

    setmetatable(new_object, self)
    new_object.__index = characters.Inventory
    return new_object
end


characters.CharacterStats = {
}

characters.CharacterStats.__index = characters.CharacterStats

function characters.CharacterStats:new(max_health, current_health)
    if current_health == nil then
        current_health = max_health
    end

    local new_object = {
        max_health = max_health,
        current_health = current_health,
        morale_level = 0,
        death_status = nil,
    }
    setmetatable(new_object, self)
    new_object.__index = characters.CharacterStats
    return new_object
end

function characters.CharacterStats:deal_damage(amount)
    self.current_health = self.current_health - amount

    if self.current_health < 0 then
        self.current_health = 0
        self.death_status = "death by spike"
    end
end

-- Any kind of character in the story game, e.g. the main player
characters.Character = {
        x = 0,
        y = 0,
        all_characters = {}
    }

characters.Character.__index = characters.Character

-- Create a new Character.
--
-- put name and sprite into the new character.
-- Add the new character to the table list of all_characters.
function characters.Character:new(name, sprite, game_map, stats, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    local new_object = {
        sprite = sprite, 
        name = name, 
        game_map = game_map,
        stats = stats,
        x = x, start_x = x,
        y = y, start_y = y,
        inventory = characters.Inventory:new()
    }
    setmetatable(new_object, self)
    new_object.__index = characters.Character
    table.insert(characters.Character.all_characters, new_object)
    return new_object
end

function characters.Character:respawn()
    self.x = self.start_x
    self.y = self.start_y
    self.stats.death_status = nil
    self.stats.current_health = self.stats.max_health
end


-- Moves the character around if possible, returns False if not. 
--if yes then it moves when the player presses to move, if not, then it doesnt move there when the player presses to move
-- Edits character self.x and self.y.
--
-- @param step_in_x -- Movement in x direction, relative to current position,
-- @param step_in_y -- Movement in y direction, relative to current position,
-- @return True if the move was allowed and completed.
function characters.Character:move(step_in_x, step_in_y)

    local future_x = self.x + step_in_x
    local future_y = self.y + step_in_y

    if future_x <= 0 then return false end
    if future_y <= 0 then return false end
    if future_y > #(self.game_map) then return false end
    if future_x > #(self.game_map[1]) then return false end

    for num, character in pairs(characters.Character.all_characters) do
        if future_x == character.x and future_y == character.y then
            return false 
        end
    end
    
    if self.stats.death_status ~= nil then
        return false
    end

    local future_cell = self.game_map[future_y][future_x]
    for index, sprite_num in pairs(future_cell.u) do
        if sprite_num == TREE_L then return false end
    end
    self.x = future_x
    self.y = future_y
    return true
end

function characters.Character:pos()
    return characters.Coordinates:new(self.x, self.y)
end

-- Prints the character's information in the console.
function characters.Character:print()
    print("---- ", self.name)
    print("x=", self.x)
    print("y=", self.y)
    print("s=", self.sprite)
end

-- Makes the character appear on a Love2d canvas.
function characters.Character:draw(sprites)
        local x_c = (self.x - 1) * 16
        local y_c = (self.y - 1) * 16
        local c_sprite = self.sprite
        -- Draw character sprites
        love.graphics.draw(sprites[c_sprite], x_c, y_c)
end

characters.PlayerCharacter = {}

characters.PlayerCharacter.__index = characters.PlayerCharacter
setmetatable(characters.PlayerCharacter, {__index = characters.Character})

function characters.PlayerCharacter:add_item(item_name, amount)
    self.inventory[item_name] = self.inventory[item_name] + amount
end

function characters.PlayerCharacter:remove_item(item_name, amount)
    if amount == 0 then
        return true
    end

    local current_amount = self.inventory[item_name]
    if current_amount == nil then
        return false
    end
    if current_amount < amount then
        return false
    else
        self.inventory[item_name] = current_amount - amount
        return true
    end    
end

function characters.PlayerCharacter:add_coins(value)
    self.inventory.coins = self.inventory.coins + value
end

function characters.PlayerCharacter:remove_coins(value)
    if self.inventory.coins < value then
        return false
    else
        self.inventory.coins = self.inventory.coins - value
        return true
    end
end

function characters.PlayerCharacter:new(name, sprite, game_map, stats, x, y)
    local new_object = characters.Character:new(
    name, 
    sprite, 
    game_map, 
    stats, 
    x, 
    y)
    new_object.inventory = characters.Inventory:new(true)

    setmetatable(new_object, {__index = characters.PlayerCharacter})
    new_object.__index = characters.PlayerCharacter
    return new_object
end


function characters.draw_characters(sprites)
    for num, character in pairs(characters.Character.all_characters) do
        character:draw(sprites)
    end
end


return characters

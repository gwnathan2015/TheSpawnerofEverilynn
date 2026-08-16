local character_control = require("character_control")

sprites = {}

require ("map.map")
local characters = require ("characters")
require("map.mapreader")

local utils = require('utils')
local render = require('render')

game_state = "title"

game_map1 = read_map("ASSETS/maps/map1.json")

characters.main_character = characters.PlayerCharacter:new(
    "player", 
    1098, 
    game_map1, 
    characters.CharacterStats:new(100),
    2,
    1
)

characters.farmer = characters.Character:new(
    "farmer", 
    1085, 
    game_map1,
    characters.CharacterStats:new(100),
    9,
    6
)

characters.wizard = characters.Character:new(
    "wizard", 
    1084, 
    game_map1,
    characters.CharacterStats:new(100),
    10,
    2
)

characters.swordsman = characters.Character:new(
    "Swordsman", 
    1097, 
    game_map1,
    characters.CharacterStats:new(120, 70),
    7,
    4
)

function love.load()
    utils.setup_random()
    love.keyboard.setKeyRepeat( true )
    for i = 0, 131 do
        local filename = string.format("ASSETS/tinytown/Tiles/tile_%04d.png", i)
        sprites[i] = love.graphics.newImage(filename)
    end
    for i = 0, 131 do
        local filename = string.format("ASSETS/tinydungeon/Tiles/tile_%04d.png", i)
        sprites[i + 1000] = love.graphics.newImage(filename)
    end

    love.window.setTitle("Spawner of Everilynn Pre-Alpha-1.8.5 V-2")
    love.window.setMode(800, 600, {resizable=true, vsync=0, minwidth=400, minheight=300})

    local iconimg_data = love.image.newImageData("icon.png")
    iconimg = love.graphics.newImage("icon.png")
    love.window.setIcon(iconimg_data)
    love.graphics.setBackgroundColor(0.8, 0.71, 0.55)
end

local function deal_environmental_damage()
    for i, the_character in pairs(characters.Character.all_characters) do
        local pos = the_character:pos()
        local tile = game_map1[pos.y][pos.x]
        if game_state == 'ingame' then
            if tile.u[1] == SPIKE then
            the_character.stats:deal_damage(math.random(1, 4))
            end
        end
    end
end

local function handle_status_updates()
    local the_character = characters.main_character

    
end

local TimedUpdate = {}

TimedUpdate.__index = TimedUpdate

function TimedUpdate:new(interval, func)
    local new_object = {
        interval = interval,
        time_total = 0,
        func = func
    }

    setmetatable(new_object, {__index = TimedUpdate})
    new_object.__index = TimedUpdate
    return new_object
end

function TimedUpdate:update(step_in_time)
    self.time_total = self.time_total + step_in_time
    if self.time_total >= self.interval then
      self.time_total = self.time_total - self.interval
      self.func()
   end
end

function recover_health()
    local new_health = characters.main_character.stats.current_health + 1
    if new_health <= characters.main_character.stats.max_health then
        characters.main_character.stats.current_health = new_health
    end
end

death_sound = love.audio.newSource("ASSETS/audio/music/game_over1.mp3", "static")
menu_music = {
    love.audio.newSource("ASSETS/audio/music/menu_music.ogg", "stream"),
    love.audio.newSource("ASSETS/audio/music/menu_music2.mp3", "stream")
}
game_music = { 
    love.audio.newSource("ASSETS/Audio/music/overworld_track_1.ogg", "stream"),
    love.audio.newSource("ASSETS/Audio/music/overworld_track_2.ogg", "stream")
}

local current_music
local last_state
function update_music()
    local next_music
    next_music = nil

    -- TODO: death_status not checke, enrich game_status so we see change.
    if game_state == last_state then
        if current_music == nil then
            return
        end

        if current_music:isPlaying() then
            return
        end
    end
    last_state = game_state

    if current_music ~= nil then
        love.audio.stop(current_music)
        current_music = nil
    end

    if game_state == 'title' then
        local music_choice = math.random( #menu_music )
        next_music = menu_music[music_choice]
    elseif game_state ~= 'title' then
        if characters.main_character.stats.death_status == nil then
            local music_choice = math.random( #game_music )
            next_music = game_music[music_choice]
        else
            next_music = death_sound
        end
    end


    if next_music == nil then
        return
    end
    next_music:play()
    next_music:setLooping(true)
    current_music = next_music
end

local updaters = {
    TimedUpdate:new(1, character_control.move_swordsman),
    TimedUpdate:new(1, deal_environmental_damage),
    TimedUpdate:new(60, recover_health)
}


local time_total = 0
function love.update(step_in_time)
    for index, updater in ipairs(updaters) do
        updater:update(step_in_time)
    end
    handle_status_updates()
    update_music()
end


function love.draw()
    if game_state == 'ingame' then
        render.draw_ingame()
    elseif game_state == 'title' then
        render.draw_title()
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end

    if game_state == 'ingame' then
        character_control.move_main_character(key)
    elseif game_state == 'title' then
        if key == "escape" then
            love.event.quit()
        elseif key == "return" then
            game_state = 'ingame'
        end
    end
end


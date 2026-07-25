-- Map of tiles, corresponding to the tinydungen tile number.
json = require("lib.json") 


TILE_LOADER_MAP = {
    ["B"] = 5, -- Bush
    ["G"] = 1, -- Green
    ["f"] = 2, -- Flower
    ["T"] = 15, -- Tree lower part
    ["U"] = 3,  -- Tree upper part
    ["P"] = 25, -- Path
    ["S"] = 1041 -- spike

}

function read_map(filename)
    local content = love.filesystem.read(filename)
    local config = json.decode(content)
    game_map = {}
    for row_index, row_str in pairs(config.game_map) do 
        -- row_str: "G   |G   |F   |G   |P   |P   |P   |G   |G   |F   "
        row = {}
        game_map[row_index] = row
        local i = 1
        for cell_str,v in string.gmatch(row_str, "([^|]+)") do
            u1 = TILE_LOADER_MAP[string.sub(cell_str,1,1)]
            u2 = TILE_LOADER_MAP[string.sub(cell_str,2,2)]

            u = {}
            if u1 ~= nil then u[1] = u1 end
            if u2 ~= nil then u[2] = u2 end

            o = {}
            o1 = TILE_LOADER_MAP[string.sub(cell_str,4,4)]
            if o1 ~= nil then o[1] = o1 end
            row[i] = { u=u, o=o }
            i = i+1
        end
    end
    return game_map
end

print('game map loading finished')
print(json.encode(game_map))
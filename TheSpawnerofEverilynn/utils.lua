local utils = {}

function utils.sign(value)
    if value > 0 then return 1 end
    if value < 0 then return -1 end
    return 0
end

function utils.setup_random()
    seed = os.time()
    for i = 1, 1 + seed % 27 do
        math.random()
    end
end


return utils
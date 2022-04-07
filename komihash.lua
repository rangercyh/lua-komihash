local komihash = require("lkomihash")

local M = {}

function M.hash64(str, seed)
    return komihash.hash64(str, seed or 0)
end

-- return a uniformly-random generator
function M.new(seed1, seed2)
    seed1 = seed1 or seed2 or 0
    seed2 = seed2 or seed1
    return komihash.new(seed1, seed2)
end

return M

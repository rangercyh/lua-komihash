local komihash = require("lkomihash")

local sbyte = string.byte
local sgsub = string.gsub
local sformat = string.format

local function convert_to_hex(bytes)
    return (sgsub(bytes, ".", function(c)
        return sformat("%02x", sbyte(c))
    end))
end

local M = {}

function M.hash64(str, seed, raw)
    local bytes = komihash.hash64(str, seed)
    return raw and bytes or convert_to_hex(bytes)
end

local mt = {}
mt.__index = mt
function mt:rand(raw)
    local bytes = self.__prng:rand()
    return raw and bytes or convert_to_hex(bytes)
end
-- return a uniformly-random PRNG generator
function M.new(seed1, seed2)
    seed1 = seed1 or seed2 or 0
    seed2 = seed2 or seed1
    -- Self-starts in 4 iterations, which is a suggested "warming up"
    -- initialization before using its output.
    local r = komihash.new(seed1, seed2)
    for i = 1, 4 do
        r:rand()
    end
    return setmetatable({
        __prng = r,
    }, mt)
end

return M

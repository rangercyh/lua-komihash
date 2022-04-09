local komihash = require("komihash")

assert(komihash.hash64("test1") == "ef1feecf4ea42349")
assert(komihash.hash64("test2") == "7402fba69524ff9e")

local bytes_endian = {
    { 1193757035, 1074553548 },
    { 1049596507, 900294935 },
    { 3919726509, 3678926522 },
    { 3462861310, 2564880078 },
}
local r = komihash.new()
for _, v in ipairs(bytes_endian) do
    local a, b = string.unpack("<I4<I4", r:rand(true))
    assert(a == v[1] and b == v[2])
end

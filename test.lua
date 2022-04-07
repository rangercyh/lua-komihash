local komihash = require("komihash")

assert("5270236647356506095" == komihash.hash64("test1"))
assert("11456916202224026228" == komihash.hash64("test2"))

local r = komihash.new()
assert("12297829382473034410" == r:rand())
assert("18446744073709551614" == r:rand())
assert("5270498306774157584" == r:rand())
assert("13469051228422846976" == r:rand())

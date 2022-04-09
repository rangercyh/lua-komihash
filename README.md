# lua-komihash

lua wrapper for [komihash](https://github.com/avaneev/komihash)

according to [smhasher](https://github.com/rurban/smhasher), komihash is one of the fastest hash functions on x86_64 without quality problems.

# use

```lua
local komihash = require("komihash")

-- komihash.hash64(str, [seed], [raw])
-- hash a str to a 64 bit binary, return the hexadecimal bytes string.
-- seed is optional, default value is 0.
-- raw is optional, if pass true value, return the original bytes string.
komihash.hash64("test1") -- "ef1feecf4ea42349"

-- komihash.new([seed1], [seed2])
-- create a uniformly-random PRNG generator
local r = komihash.new()
-- r:rand([raw])
-- generate a 64 bit random binary, return the hexadecimal bytes string.
-- raw is optional, if pass true value, return the original bytes string.
r:rand()    -- "6b492747cc620c40"
```

# tip

Because lua until 5.4 haven't support 64bit integer. lua_Integer is about 2^63-1 range. And lua_Number is saved as float type.

I have considered to use like [LuaTinker](https://github.com/zupet/LuaTinker/blob/master/lua_tinker.cpp#L125) or [cloudwu lua-int64](https://github.com/cloudwu/lua-int64/blob/master/int64.c#L9) solution to deal with it. But all add more complexity to the lib, I finally give up.

I cast uint64_t to char bytes to pass from c to lua and convert the bytes to hexadecimal bytes string in lua code.

The original bytes string can be convert to integer in either endian you choose, I put an example in the [test case](test.lua#L6).

If you want to do some compatible work with the other implementation, you can get the raw bytes string and change the representation yourself refer to my test example.

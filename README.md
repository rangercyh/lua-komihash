# lua-komihash

lua warpper for [komihash](https://github.com/avaneev/komihash)

# use

```lua
local komihash = require("komihash")
komihash.hash64("test1") -- "5270236647356506095"
local r = komihash.new()
r:rand()    -- a uniformly-random generator
```

# tip

Because lua until 5.4 haven't support 64bit integer. lua_Integer is abort 2^63-1 range. And lua_Number is saved as float type.

So I have to convert result uint64_t type to string type, to pass it from c to lua level.

I have consider to use like [LuaTinker](https://github.com/zupet/LuaTinker/blob/master/lua_tinker.cpp#L125) or [cloudwu lua-int64](https://github.com/cloudwu/lua-int64/blob/master/int64.c#L9) solution to deal with it. But all add more complexity to the lib, I finally give up.

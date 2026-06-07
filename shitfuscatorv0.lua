local xor=function(data, key)
	local out = {}
	for i = 1, #data do
		local a = data:byte(i)
		local b = key:byte(((i - 1) % #key) + 1)
		out[i] = string.format("%02X", bit32.bxor(a, b))
	end
	return table.concat(out)
end
local rs=function()
	local ts=math.random(40)
	local result={}
	for i=1,ts do
		local en
		repeat
			en=utf8.char(math.random(32,100))
		until en~="\n" and en~="\r" and en~="]" and en~="[" and en~="-"
		result[i]=en
	end
	return table.concat(result)
end
local anno=function()
	local a=":("
	local b=math.random(10,100)
	for i=1,b do
		a=a.."{[=[{"..rs().."}]=]})"
		if i~=b then
			a=a.."->("
		end
	end
	return a
end
local turntoshittyascii=function(str)
	local a=""
	for i=1,#str do
		local l=str:sub(i,i)
		a=a..[[\]]..string.byte(l)
	end
	return a
end
local annotest=Instance.new("StringValue",workspace)
annotest.Value="local a"..anno().."=1"
local enc=[=[local p=Instance.new("Part",workspace)]=]
local key="87vfjdywkw8362jguyfjdjklds8s674r93jm2hds78dfjjdsfahd7s6kldkjsgskshfgfh"
local v=Instance.new("StringValue",workspace)
v.Value="--[[encrypted by shitfuscator v0.0.0.1]]--[=["..rs()..rs()..rs().."]=] local v0"..anno().."=getfenv()local v2"..anno().."=v0[string.reverse('"..turntoshittyascii("daol").."')..'"..turntoshittyascii("string").."'];function v1(d,k)local t"..anno().."={} for i=1,#d,2 do local a"..anno().."=tonumber(d:sub(i,i+1),16) local b"..anno().."=k:byte((((i+1)/2)-1)%#k+1) t[#t+1]=string.char(bit32.bxor(a,b)) end return table.concat(t)end local v4"..anno().."='"..turntoshittyascii(key).."';local v3"..anno().."='"..turntoshittyascii(xor(enc,key)).."';v2(v1(v3,v4))() ".."--[=["..rs()..rs()..rs().."]=]--wtf"

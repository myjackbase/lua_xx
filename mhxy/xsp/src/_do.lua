--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08
-- 按数字从小到大，顺序执行，非数字函数不会执行，适合写功能实现的主逻辑

local f = {}
local isBreak = false;


f.init = function (...)
	return f
end

f[1] = function (...)
	traceLog("第一步判断打开游戏")
	
  local appid = frontAppName()
	if(string.find(appid, _gconfig.appid) ~= 1) then
		dialogRet("请先打开游戏", "XXXXX", "", "", 0)
		isBreak = true
	end

	return isBreak;
end

f[5] = function (...)
	traceLog("登录游戏")
	
	local x, y = findMultiColorInRegionFuzzy(0xebc55c,"-54|-12|0xcdb09c,-40|11|0xfdfcfc,-15|12|0x95592e,49|-16|0xecc35b,84|14|0xe4841b,-89|-21|0xf9c716", 95, 383, 368, 577, 425);
	if x > -1 then	
		tapScreen(x,y);
	end

	return isBreak;
end

f[13] = function (...)
	-- ...
	return isBreak;
end

f[15] = function (...)
-- ...
	return isBreak;
end

return f
traceLog = function (...)
	if not _isDebug then
		do return end
	end
	local params = {...}
	local str = nil
	for k,v in pairs(params) do
		if not str then
			str = tostring(v)
		else
			str = str .. ", " .. tostring(v)
		end
	end
    sysLog("[Trace]>>>>"..str)
end

tapScreen = function(x, y, m, n)
		if m == nil then m = 0 end
		if n == nil then n = 0 end
    touchDown(0, x + m * _wbl, y + n * _hbl);
    mSleep(200);
    touchUp(0, x + m * _wbl, y + n * _hbl);
end

findMultiColorInRegionFuzzyExt = function (...)		
		local sw = arg[4] * _wbl
		local sh = arg[5] * _hbl
		local fsw = arg[6] * _wbl
		local fsh = arg[7] * _hbl
		local colorTable = {}
		
		colorArr = string.split(arg[2],",")
		for k, v in pairs(colorArr) do			
			colorItem = string.split(v,"|")
			local color = {}
			for m, n in pairs(colorItem) do	
				if m == 1 then n = tostring(tonumber(n) * _wbl) end
				if m == 2 then n = tostring(tonumber(n) * _hbl) end
				table.insert(color, n)
			end
			table.insert(colorTable, table.concat(color,"|"))
		end
		--sysLog(table.concat(colorTable,","))
		return findMultiColorInRegionFuzzy(arg[1],table.concat(colorTable,","),arg[3],sw,sh,fsw,fsh)
end

function getIntPart(x)
	if x <= 0 then
		 return math.ceil(x);
	end

	if math.ceil(x) == x then
		 x = math.ceil(x);
	else
		 x = math.ceil(x) - 1;
	end
	return x;
end

--字符串分割函数
--传入字符串和分隔符，返回分割后的table
function string.split(str, delimiter)
	if str==nil or str=='' or delimiter==nil then
		return nil
	end
	
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

s = function (time)
    mSleep(time or 100)
end

ss = function (time)
    s(time or 500)
end

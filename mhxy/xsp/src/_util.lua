--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

s = function (time)
    mSleep(time or 100)
end

ss = function (time)
    s(time or 500)
end

tapScreen = function(x, y)
    touchDown(0, x, y);
    mSleep(200);
    touchUp(0, x, y);
end

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

-- 格式化输出table（力荐）
printr = function (root, notPrint, params)
	if not _isDebug then
		do return end
	end
	local rootType = type(root)
	if rootType == "table" then
		local tag = params and params.tag or "Table detail:>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
		local cache = {  [root] = "." }
		local isHead = false
		local function _dump(t, space, name)
			local temp = {}
			if not isHead then
				temp = {tag}
				isHead = true
			end
			for k,v in pairs(t) do
				local key = tostring(k)
				if cache[v] then
					tinsert(temp, "+" .. key .. " {" .. cache[v] .. "}")
				elseif type(v) == "table" then
					local new_key = name .. "." .. key
					cache[v] = new_key
					tinsert(temp, "+" .. key .. _dump(v, space .. (next(t, k) and "|" or " " ) .. srep(" ", #key), new_key))
				else
					tinsert(temp, "+" .. key .. " [" .. tostring(v) .. "]")
				end
			end
			return tconcat(temp, "\n" .. space)
		end
		if not notPrint then
			print(_dump(root, "", ""))
			print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
		else
			return _dump(root, "", "")
		end
	else
		print("[printr error]: not support type")
	end
end
--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

local function sort(f)
	local ret = {}
	for k,v in pairs(f) do
		if tonumber(k) then
			if #ret == 0 then
				table.insert(ret, {func = v, id = k})
			else
				local flag, index, count = false, 0, 1
				for k2, v2 in pairs(ret) do
					print(k, v2.id)
					if k < v2.id then
						flag = true
						index = count
						break
					end
					count = count + 1
				end
				if flag then
					table.insert(ret, index, {func = v, id = k})
				else
					table.insert(ret, {func = v, id = k})
				end
			end
		end
	end
	return ret
end

-- 跑一次
function runOnce(stepConfig)
	local ret = sort(stepConfig)
    for k, v in pairs(ret) do
			traceLog("running:", v.id)
			ss()
			if(v.func()) then break end
    end
end
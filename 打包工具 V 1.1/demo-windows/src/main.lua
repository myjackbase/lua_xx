require "_util"
require "_global"

function main()
	init("0", _orientation)
	
	--UI
	local ret, results = showUI(lo_json.encode(_uiTable))    --table转json
	
	--点击确认返回1, 取消返回0
	if ret == 1 then
		--results 返回以id为key的Map类型数据,返回值为字符串
		--dialog("CheckBoxGroup1返回值:" .. results.CheckBoxGroup1, 0)
		_doMainTask = string.find(results.CheckBoxGroup1,"0",1,true) ~= nil
		_doShiMenTask = string.find(results.CheckBoxGroup1,"1",1,true)  ~= nil
		_doHongchengTask = string.find(results.CheckBoxGroup1,"2",1,true)  ~= nil
		
		if _doMainTask then
			while true do
				closeActiveWindow()
				mainTask()
				doWar()
				
				if not _doMainTask then break end
			end
		end
			
		if _doShiMenTask or _doHongchengTask then
			while true do
				closeActiveWindow()
				subTask()
				doWar()
			end
		end
	else
		lua_exit()
	end
end

main()
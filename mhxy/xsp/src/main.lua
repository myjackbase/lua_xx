--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

function main()
	require "_util"
	require "_global"
	init("0", _orientation)
	require "_action"

	local actionConfig = require("_do").init()
	runOnce(actionConfig)
end

-- lua异常捕捉
function error(msg)
	local errorMsg = "[LUA ERROR]"..msg
	traceLog(errorMsg)    
end

xpcall(main, error)
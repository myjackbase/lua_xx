--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

-- 入口函数
--function main()
	require "_util"
	require "_global"
	
	init("0", _orientation)

	-- 逻辑代码
	while true do
		-- 第一步登录游戏
		loginGame()
		fuli()
		skillStudy()
		skillUp()
		--actionClick()
		actionExam()
		selectDo()
		doWar()
		skipStory()
		jiasuStory()
		useThings()
		mainTask()
		subTask()
	end
--end

---- lua异常捕捉
--function error(msg)
--	local errorMsg = "[LUA ERROR]"..msg
--	traceLog(errorMsg)    
--end

--xpcall(main, error)
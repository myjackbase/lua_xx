-- 设置屏幕缩放
setScreenScale(540, 960)
_doMainTask = true
_doShiMenTask = true
_doHongchengTask = true


-- 跳过剧情
function skipStory()
	repeat
		x, y = findMultiColorInRegionFuzzyExt(0x362720,"-70|-5|0x614436,99|1|0x644637,108|-3|0x644637,81|-2|0x1c1511", 90, 740, 12, 955, 48);
		if x > -1 then
			tap(x,y);
			showMsg("正在跳过剧情...");
			mSleep(200)
		end
	until(x == -1);
end

-- 加速剧情
function jiasuStory()
	repeat
		x, y = findMultiColorInRegionFuzzyExt(0x615951,"41|-30|0x1b1511,60|7|0x191310,-77|-6|0x625a52,13|-5|0xe9dcca,-102|-13|0x17120f", 90, 638, 7, 910, 87)
		if x > -1 then			
			tap(x,y);
			showMsg("正在加速剧情...");
			mSleep(200)
		end
	until(x == -1);
end

-- 使用物品
function useThings()
	repeat
		x, y = findMultiColorInRegionFuzzyExt(0xe9bf5c,"-20|-3|0xa77533,25|1|0xe8bd59,17|-4|0x70350d", 90, 770, 406, 872, 457);
		if x > -1 then
			tap(x,y);
			showMsg("正在使用物品...");
			mSleep(2000);
		end
	until(x == -1);
end

-- 请选择要做的事
function selectDo()
	local x, y = findMultiColorInRegionFuzzy(0xfbf5ed,"43|0|0xfbf5ed,-4|32|0xddc5a2,42|32|0xddc5a2,8|-66|0xc0a788", 90, 648, 3, 954, 529)
	--sysLog(x)
	if x > -1 then
		showMsg("正在选择要做的事...");
		tap(x, y);
		mSleep(1000)
	end
	traceLog("请选择要做的事:x--->"..x)
	x, y = findMultiColorInRegionFuzzy(0xd8c095,"1|-62|0xe8dcca,21|-65|0xe6dac8,4|-20|0x8e6346", 90, 677, 71, 827, 459)
	if x > -1 then
		showMsg("正在选择要做的事...");
		tap(x, y);
		mSleep(1000)
	end
	traceLog("请选择要做的事:x--->"..x)
	x, y = findMultiColorInRegionFuzzy(0xf5e9d9,"-2|-6|0xd8ad85,1|-21|0x806b54,4|-51|0xc9bfae", 90, 662, 36, 954, 408)
	if x > -1 then
		showMsg("正在选择要做的事...");
		tap(x, y);
		mSleep(1000)
	end
	traceLog("请选择要做的事:x--->"..x)
	x, y = findMultiColorInRegionFuzzy(0xf5e9d9,"4|-5|0xffebca,9|-7|0x875f3e,4|-38|0xe7dbc9,19|-37|0xede0ce", 90, 681, 44, 956, 418)
	if x > -1 then
		showMsg("正在选择要做的事...");
		tap(x, y);
		mSleep(1000)
	end
end

-- 正在战斗
function doWar()
	repeat
		local x, y = findMultiColorInRegionFuzzy(0xc66c3c,"-10|-10|0x720f00,-10|-13|0xfffffe,-8|-20|0xfec88f,-12|22|0xfcf5cb,12|24|0xf3e9bb", 90, 890, 449, 956, 533)
		if x > -1 then
			showMsg("正在手动战斗...");
			tap(x,y);
			showMsg("已开启自动战斗...");
		end
	until(x == -1);
	
	repeat
		local x, y = findMultiColorInRegionFuzzy(0xc66c3c,"-10|-10|0x720f00,-10|-13|0xfffffe,-8|-20|0xfec88f,-5|31|0xf0d88f,2|22|0xf5eec7", 90, 890, 449, 956, 533)
		if x > -1 then
			showMsg("正在自动战斗...");
			mSleep(10000);
		end
	until(x == -1);
end

-- 关闭活动窗口
function closeActiveWindow()
	repeat
		local  x, y = findMultiColorInRegionFuzzy(0xbc1400,"-6|-6|0xaf0700,8|-5|0xb70800,-5|7|0xc30a00,8|7|0xc60b00,-15|-14|0xd9b388,16|-13|0xd1ab7c,-14|18|0xe3c29f,16|17|0xdfc19e", 90, 1, 1, _sw, _sh)
		if x > -1 then
			showMsg("关闭活动窗口...");
			tap(x,y);
		end
	until(x == -1);
end

-- 主线任务
function mainTask()
	if not _doMainTask then do return end end
  local	x, y = findMultiColorInRegionFuzzy(0xc2dff3,"101|15|0xaacae3,136|-6|0xd08b35,171|-5|0x305f91,-99|-3|0x444445,-161|134|0xde841a,239|126|0x1d3baf", 90, 213, 98, 753, 470)
	if x > -1 then
		_doMainTask = false
		showMsg("主线任务自动过不了...");
		tap(x, y)
	else
		x, y = findColorInRegionFuzzy(0xd75ef1, 90, 724, 80, 958, 385)
		if x > -1 then
			tap(x, y)
			showMsg("正在执行主线任务...");
			
			repeat
				mSleep(3000);
				x, y = findMultiColorInRegionFuzzy(0xefe5ca,"17|5|0xe5dbc0,37|5|0xf8edd2,84|8|0xf4e9cf,117|5|0xf3e8ce,136|6|0xf9eed4,152|5|0xf2e7cc", 90, 330, 214, 649, 280)
				if x > -1 then
					_doMainTask = false
					showMsg("需要升级才能执行任务...");
				end
				mSleep(200);
				
				selectDo()
				skipStory()
				jiasuStory()
				useThings()
			until(x == -1)
		end
	end
end

--支线任务
function subTask()
	local	x, y = findMultiColorInRegionFuzzy(0xe9c05e,"-92|-2|0xeac363,-22|-91|0x996e41,-18|-91|0xa47c53,-7|-89|0xae8963,-1|-89|0xb18e69,3|-89|0xaf8b66,123|-74|0x986d3f", 90, 294, 175, 663, 366)
	if x > -1 then
		_doShiMenTask = false
		tap(x, y)
	end
	if _doShiMenTask then
		--- 师门任务
		x, y = findMultiColorInRegionFuzzy(0xcacd23,"2|1|0xddda21,6|1|0xe7de1b,14|1|0xe2d71e,26|0|0xded01c,15|-6|0xe1d621,16|-5|0xe6db22", 90, 730, 127, 959, 436)
		if x > -1 then
			tap(x, y)
			showMsg("正在执行师门任务...");
		end
	else
		-- 红尘试炼
		x, y = findMultiColorInRegionFuzzy(0xdad41e,"1|3|0xebe41d,8|4|0xede51c,17|1|0xd6d01d,27|1|0xd2cb1a", 90, 723, 84, 959, 400)
		if x > -1 then
			tap(x, y)
			showMsg("正在执行红尘试炼任务...");
		end
	end
	repeat
		mSleep(3000);
		-- 购买
		x, y = findMultiColorInRegionFuzzy(0xe3b445,"-37|-1|0xe4b344,-24|8|0xfbf9f8,14|8|0xf9f6f4,29|1|0xe7dad1,29|-8|0xeee4dd", 90, 550, 261, 947, 526)
		if x > -1 then
			tap(x, y)
		end
		
		-- 购买
		x,y = findMultiColorInRegionFuzzy(0xe7bd58,"-25|0|0x9c663e,-24|2|0xf9f5f3,-12|-3|0x94592d,17|-1|0x93572c,19|4|0xf1eae4", 90, 499, 136, 940, 525)
		if x > -1 then
			tap(x, y)
		end
		
		-- 上交
		x, y = findMultiColorInRegionFuzzy(0xe9c261,"85|1|0xe9c05e,33|-2|0x6e340c,49|-1|0x6c310a,60|-1|0x6e330b", 90, 408, 2, 936, 527)
		if x > -1 then
			tap(x, y)
		end
		
		selectDo()
		skipStory()
		jiasuStory()
		useThings()
	until(x == -1)
end
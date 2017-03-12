--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

-- 设置屏幕缩放
setScreenScale(540, 960)
_doMainTask = true
_doShiMenTask = true
_doHongchengTask = true

function loginGame()
	local x, y = findMultiColorInRegionFuzzyExt(0xebc55c,"-54|-12|0xcdb09c,-40|11|0xfdfcfc,-15|12|0x95592e,49|-16|0xecc35b,84|14|0xe4841b,-89|-21|0xf9c716", 95, 383, 368, 577, 425)
	if x > -1 then	
		tap(x, y);
		
		repeat
			mSleep(300)
			x, y = findMultiColorInRegionFuzzyExt(0xebc55c,"-54|-12|0xcdb09c,-40|11|0xfdfcfc,-15|12|0x95592e,49|-16|0xecc35b,84|14|0xe4841b,-89|-21|0xf9c716", 95, 383, 368, 577, 425)
			if x > -1 then	
				tap(x, y);
			end
		until(x == -1)
		
		repeat
			showMsg("正在载入游戏...")
			x, y = findMultiColorInRegionFuzzyExt(0xf84c20,"-3|7|0x1c81f0,36|40|0x8d5d2c,33|56|0xddb482,-29|4|0xebdcc9", 95, 824, 5, 956, 77)
		until(x > -1)
	end
	
	mSleep(300)
end

-- 技能升级
function skillUp()
	local x, y = findMultiColorInRegionFuzzy(0xd85d03,"12|-9|0x443c3b,4|-19|0xf69f1b,17|-24|0xda2b26", 95, 181, 4, 700, 59)--x, y = findMultiColorInRegionFuzzyExt(0xe87c0b,"1|-15|0xfdae26,-16|7|0x312012,20|-18|0xec2823", 95, 467, 1, 541, 62)
	if x > -1 then
		tap(x, y);
		tap(x - 70, y + 85)
		x, y = findMultiColorInRegionFuzzy(0xe0af68,"0|22|0xd87f2e,-5|11|0xf6f1ee,52|11|0xf9f6f4,84|9|0xfdfcfb", 95, 517, 315, 891, 520)
		if x > -1 then
			showMsg("正在技能升级...");
			tap(x, y);
		end
	end
end

-- 技能学习
function skillStudy()
	--keepScreen(true)
	local x, y = findMultiColorInRegionFuzzyExt(0xebc768,"56|1|0xebc666,75|-14|0xe22922", 95, 314, 53, 640, 182)
	if x > -1 then
		showMsg("正在学习技能...");
		tap(x, y);
	end
	--keepScreen(false)
end

-- 活动点击
function actionClick()
	local	x, y = findMultiColorInRegionFuzzyExt(0xcd8538,"-16|-1|0x610401,15|13|0x3b2317,13|-15|0xe92823", 95, 260, 3, 329, 63)
	if x > -1 then
		tap(x, y);
		x, y = findMultiColorInRegionFuzzyExt(0xf2dd98,"53|-1|0xe52922,4|38|0xe5b146", 95, 106, 59, 231, 249)
		if x > -1 then
			tap(x, y);
			x, y = findMultiColorInRegionFuzzyExt(0xf0d678,"-198|-8|0xe22922,25|14|0xeac463", 95, 235, 67, 848, 245)
			if x > -1 then
				tap(x, y);
			end
		end
		
		repeat
		x, y = findMultiColorInRegionFuzzyExt(0x339805,"1|-11|0xbd8f59,2|-11|0xbd8e59,2|-20|0xe3d0bf", 95, 230, 452, 855, 488)
		if x > -1 then
			tap(x, y - 50);
		end
		until(x == -1)
	end
end

-- 科举考试
function actionExam()
	-- 科举考试
	repeat
		local x, y = findMultiColorInRegionFuzzyExt(0xebc767,"-61|-14|0xffffff,56|-15|0xf8db85,-54|15|0xe6b042", 95, 719, 359, 858, 413)
		--traceLog("科举考试:x--->"..x)
		if x > -1 then
			showMsg("正在科举考试...");
			tap(x - 270, y - 80);
			mSleep(100)
		end
	until(x == -1)
	
	local	x, y = findMultiColorInRegionFuzzyExt(0xcf0000,"-32|-5|0xda7b39,14|0|0xe5c9ad,-1|-16|0xa30000", 95, 804, 8, 896, 68)
	if x > -1 then
		tap(x, y);
	end
end

-- 请选择要做的事
function selectDo()
	local x, y = findMultiColorInRegionFuzzy(0xfbf5ed,"43|0|0xfbf5ed,-4|32|0xddc5a2,42|32|0xddc5a2,8|-66|0xc0a788", 95, 648, 3, 954, 529)
	--sysLog(x)
	if x > -1 then
		showMsg("正在选择要做的事...");
		tap(x, y);
		mSleep(50)
	end
	traceLog("请选择要做的事:x--->"..x)
	x, y = findMultiColorInRegionFuzzy(0xd8c095,"1|-62|0xe8dcca,21|-65|0xe6dac8,4|-20|0x8e6346", 95, 677, 71, 827, 459)
	if x > -1 then
		showMsg("正在选择要做的事...");
		tap(x, y);
		mSleep(50)
	end
	traceLog("请选择要做的事:x--->"..x)
	x, y = findMultiColorInRegionFuzzy(0xf5e9d9,"-2|-6|0xd8ad85,1|-21|0x806b54,4|-51|0xc9bfae", 95, 662, 36, 954, 408)
	if x > -1 then
		showMsg("正在选择要做的事...");
		tap(x, y);
		mSleep(50)
	end
end

-- 正在战斗
function doWar()
	repeat
		x, y = findMultiColorInRegionFuzzyExt(0xe08b57,"-59|2|0xcf690d,-128|1|0x2a2a2a,-156|-3|0xededed,-214|2|0x1b9572,-284|-6|0xe8a127,-289|13|0x863b0a,-362|-5|0xd42744", 95, 517, 462, 954, 521);
		if x > -1 then
			showMsg("正在手动战斗...");
			--coroutine.resume(co,"正在手动战斗...");
			tap(x,y);
			showMsg("已开启自动战斗...");
			--coroutine.resume(co,"已开启自动战斗...");
		end
	until(x == -1);
	
	repeat
		x, y = findMultiColorInRegionFuzzyExt(0xde8854,"-71|-10|0x2797a4,-140|27|0x860e00,-104|27|0x251b0e,-48|-16|0xe0a75c", 95, 730, 443, 957, 533);
		if x > -1 then
			showMsg("正在自动战斗...");
			--coroutine.resume(co,"正在自动战斗...");
			mSleep(3000);
		end
	until(x == -1);
end

-- 跳过剧情
function skipStory()
	repeat
		x, y = findMultiColorInRegionFuzzyExt(0x362720,"-70|-5|0x614436,99|1|0x644637,108|-3|0x644637,81|-2|0x1c1511", 95, 740, 12, 955, 48);
		if x > -1 then
			tap(x,y);
			showMsg("正在跳过剧情...");
			--mSleep(500)
			--coroutine.resume(co,"正在跳过剧情...");
		end
	until(x == -1);
end

-- 加速剧情
function jiasuStory()
	repeat
		x, y = findMultiColorInRegionFuzzyExt(0x615951,"41|-30|0x1b1511,60|7|0x191310,-77|-6|0x625a52,13|-5|0xe9dcca,-102|-13|0x17120f", 95, 638, 7, 910, 87)
		if x > -1 then			
			tap(x,y);
			showMsg("正在加速剧情...");
			--mSleep(500)
			--coroutine.resume(co,"正在加速剧情...");
		end
	until(x == -1);
end
	
-- 使用物品
function useThings()
	repeat
		x, y = findMultiColorInRegionFuzzyExt(0xe9bf5c,"-20|-3|0xa77533,25|1|0xe8bd59,17|-4|0x70350d", 95, 770, 406, 872, 457);
		if x > -1 then
			tap(x,y);
			showMsg("正在使用物品...");
			--coroutine.resume(co,"正在使用物品...");
			mSleep(50);
		end
	until(x == -1);
end

-- 主线任务
function mainTask()
	if not _doMainTask then do return end end
  local	x, y = findMultiColorInRegionFuzzyExt(0xa5c4d1,"-48|-1|0xc1def3,56|13|0xaacae3,-40|32|0x94a2ad", 95, 216, 85, 749, 396)
	if x > -1 then
		_doMainTask = false
		showMsg("主线任务自动过不了...");
		tap(x, y)
	else
		x, y = findColorInRegionFuzzy(0xd75ef1, 95, 724, 80, 958, 385)
		if x > -1 then
			tap(x, y)
			showMsg("正在执行主线任务...");
			mSleep(100);
			--keepScreen(true)
			x, y = findMultiColorInRegionFuzzy(0xefe5ca,"17|5|0xe5dbc0,37|5|0xf8edd2,84|8|0xf4e9cf,117|5|0xf3e8ce,136|6|0xf9eed4,152|5|0xf2e7cc", 95, 330, 214, 649, 280)
			if x > -1 then
				_doMainTask = false
				showMsg("需要升级才能执行任务...");
			end
			--keepScreen(false)
			mSleep(200);
		end
	end
end

-- 师父已经尽力了
function shifu()
	x, y = findMultiColorInRegionFuzzyExt(0xf5e5ce,"3|-8|0xdec19b,1|-80|0xddac6f,175|-66|0xbe1400", 95, 292, 143, 667, 393)
	if x > -1 then
		tap(x, y)
	end
end

function fuli()
	repeat
		local x, y = findMultiColorInRegionFuzzy(0xf5e9d8,"102|0|0xea2823", 95, 152, 66, 278, 507)
		if x > -1 then
			tap(x, y)
			mSleep(100)
			btnClick()
		end
		mSleep(200)
	until(x == -1)	
	
	x, y = findMultiColorInRegionFuzzy(0xb90c00,"10|0|0xb80c00,5|5|0xc01500,-2|11|0xc10800,6|15|0xf1e3c6", 95, 597, 2, 914, 169)
	if x > -1 then
		tap(x, y)
	end
end

function subTask()
	local	x, y = findMultiColorInRegionFuzzy(0xe9c05e,"-92|-2|0xeac363,-22|-91|0x996e41,-18|-91|0xa47c53,-7|-89|0xae8963,-1|-89|0xb18e69,3|-89|0xaf8b66,123|-74|0x986d3f", 95, 294, 175, 663, 366)
	if x > -1 then
		_doShiMenTask = false
		tap(x, y)
	end
	if _doShiMenTask then
		--- 师门任务
		x, y = findMultiColorInRegionFuzzy(0xcacd23,"2|1|0xddda21,6|1|0xe7de1b,14|1|0xe2d71e,26|0|0xded01c,15|-6|0xe1d621,16|-5|0xe6db22", 95, 730, 127, 959, 436)
		if x > -1 then
			tap(x, y)
			showMsg("正在执行师门任务...");
			mSleep(200)
			-- 购买
			x, y = findMultiColorInRegionFuzzy(0xe3b445,"-37|-1|0xe4b344,-24|8|0xfbf9f8,14|8|0xf9f6f4,29|1|0xe7dad1,29|-8|0xeee4dd", 95, 550, 261, 947, 526)
			if x > -1 then
				tap(x, y)
			end
			mSleep(100)
			-- 上交
			x, y = findMultiColorInRegionFuzzy(0xe9c261,"85|1|0xe9c05e,33|-2|0x6e340c,49|-1|0x6c310a,60|-1|0x6e330b", 95, 408, 2, 936, 527)
			if x > -1 then
				tap(x, y)
			end
			mSleep(100)
		end
	end
	
	-- 红尘试炼
	x, y = findMultiColorInRegionFuzzy(0xdad41e,"1|3|0xebe41d,8|4|0xede51c,17|1|0xd6d01d,27|1|0xd2cb1a", 95, 723, 84, 959, 400)
	if x > -1 then
		tap(x, y)
		showMsg("正在执行红尘试炼任务...");
		mSleep(300)
	end
end

function btnClick()
	local x, y = findMultiColorInRegionFuzzy(0x743a10,"7|-1|0x783f13,9|4|0x70350c,16|5|0x773d11,34|0|0x753b10,37|4|0x763d11,44|7|0x6c310a,47|-2|0x6f340c", 95, 47, 5, 910, 529)
	if x > -1 then
		tap(x,y)
	end
	
	x, y = findMultiColorInRegionFuzzy(0x6f350c,"9|3|0x88521d,16|9|0x7b4213,30|6|0x6e340b,33|-4|0x71380e", 95, 47, 5, 910, 529)
	if x > -1 then
		tap(x,y)
	end
	
	x, y = findMultiColorInRegionFuzzy(0x743a0f,"17|8|0x6e330b,29|6|0x6c310a,44|5|0x6d320b,61|-2|0x743b10", 95, 47, 5, 910, 529)
	if x > -1 then
		tap(x,y)
	end
end


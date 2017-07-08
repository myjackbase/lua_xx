-- 设置屏幕缩放
setScreenScale(540, 960)

function MX()
	selectMX()
	selectTZ()
	selectNext()
	selectDo()
	selectAuto()
	inAuto()
	jumpStory()
	tapContinue()
end

-- 选择冒险模式
function selectMX()
	local x, y = findMultiColorInRegionFuzzyExt(0xf0f0df,"47|22|0x3d1b0a,63|5|0xecdbca,-528|-383|0xffffff,-330|-379|0xdb3b12", 95, 156, 1, 893, 461)
	if x > -1 then
		tapponit(x,y,"选择冒险模式...");
	end
end

-- 选择挑战
function selectTZ()
 local x, y = findMultiColorInRegionFuzzyExt(0xfeffff,"29|-1|0xffffff,-405|-406|0x10d0e5,-292|-387|0xffffff,-269|-385|0xf6f8f9", 95, 17, 4, 649, 467)
	if x > -1 then
		tapponit(x,y,"选择挑战..");
	end
end

-- 选择下一步
function selectNext()
	local x, y = findMultiColorInRegionFuzzyExt(0xffffff,"47|6|0xe0eff8,-727|-463|0x0ed0e4,-612|-453|0xfdfefe,-582|-460|0xffffff", 95, 21, 3, 888, 523)
	if x > -1 then
		tapponit(x,y,"选择下一步..");
	end
end

-- 选择闯关
function selectDo()
	local x, y = findMultiColorInRegionFuzzyExt(0xe0dfdd,"31|-12|0xf5ead7,-211|1|0x357bbd,-662|-448|0x0ed0e4,-54|21|0xf7ea37", 95, 14, 2, 868, 506)
	if x > -1 then
		tapponit(x,y,"选择闯关..");
	end
end

-- 选择自动模式
function selectAuto()
  local	x, y = findMultiColorInRegionFuzzyExt(0xf2ffff,"15|-3|0xddf8f9,11|8|0x1184ad,-4|15|0x13404c,62|0|0x4ca4d3", 95, 847, 1, 959, 43)
	if x > -1 then
		tapponit(x,y,"选择自动模式..");
		--mSleep(60000);
	end
end

-- 正在自动打怪
function inAuto()
	repeat
		local x, y = findMultiColorInRegionFuzzyExt(0xfefefe,"12|13|0x0988b7,-3|20|0x1a5c9e,61|0|0x4ca7d8", 95, 847, 1, 959, 43)
		if x > -1 then
			showMsg("正在自动打怪...");
		end
	until(x == -1);
end

-- 跳过剧情
function jumpStory()
	local x, y = findMultiColorInRegionFuzzyExt(0xf7f7f5,"-40|5|0xd47b15,48|-5|0xe08d14,22|-2|0xd6d3d0,16|0|0xfdfaf4", 95, 680, 4, 952, 66)
	if x > -1 then
		tapponit(x,y,"跳过剧情..");
	end
end

-- 点击继续
function tapContinue()
	local x, y = findMultiColorInRegionFuzzyExt(0xffffff,"-23|-7|0xffffff,-82|-366|0xfefe9a,-230|-307|0x232b6d,175|-239|0x161c2f", 95, 136, 6, 877, 529)
	if x > -1 then
		tapponit(x,y,"点击屏幕继续..");
	end
end
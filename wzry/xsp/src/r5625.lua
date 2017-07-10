-- 设置屏幕缩放
setScreenScale(1242, 2208) -- 1242*2208

function MX()
	selectMX()
	selectTZ()
	selectNext()
	selectDo()
	selectAgainDo()
	selectAuto()
	inAuto()
	jumpStory()
	tapContinue()
end

-- 选择冒险模式
function selectMX()
	local x, y = findMultiColorInRegionFuzzy(0xe4e4e3,"-7|62|0x482016,-95|223|0xcfe8ff,58|13|0xd4c4b7,-66|20|0xd9cab0", 95, 1645, 689, 2010, 1187)
	if x > -1 then
		tapponit(x,y,"选择冒险模式...");
	end
end

-- 选择挑战
function selectTZ()
 local x, y = findMultiColorInRegionFuzzy(0xfefeff,"75|18|0xfefeff,-156|4|0x143858,-905|-895|0x28b6dd,-640|-917|0xffffff", 95, 9, 8, 1506, 1064)
	if x > -1 then
		tapponit(x,y,"选择挑战..");
	end
end

-- 选择下一步
function selectNext()
	local x, y = findMultiColorInRegionFuzzy(0xfbfdfe,"-61|-5|0xffffff,48|-4|0xf9fcfe,-1692|-1055|0x28afd3,-1424|-1066|0xfeffff", 95, 28, 3, 2039, 1202)
	if x > -1 then
		tapponit(x,y,"选择下一步..");
	end
end

-- 选择闯关
function selectDo()
	local x, y = findMultiColorInRegionFuzzy(0xffffff,"52|-2|0xffffff,-96|0|0xdd9125,-1509|-995|0x23a7c4,-1116|-997|0xfdfdfd", 95, 28, 3, 2039, 1202)
	if x > -1 then
		tapponit(x,y,"选择闯关..");
	end
end

-- 选择再次闯关
function selectAgainDo()
	local x, y = findMultiColorInRegionFuzzy(0xffffff,"62|12|0xffffff,102|62|0xecac1f,-171|46|0x3077c3,-223|28|0xffffff", 95, 1096, 90, 1859, 1225)
	if x > -1 then
		tapponit(x,y,"选择再次闯关..");
	end
end

-- 选择自动模式
function selectAuto()
  local	x, y = findMultiColorInRegionFuzzy(0x39748a,"-7|0|0xfafcfd,1|24|0x188bac,-40|36|0x174351,113|14|0x3ea1ca", 95, 1948, 2, 2207, 96)
	if x > -1 then
		tapponit(x,y,"选择自动模式..");
		--mSleep(60000);
	end
end

-- 正在自动打怪
function inAuto()
	repeat
		local x, y = findMultiColorInRegionFuzzy(0xdfedf3,"26|-4|0xb7d1e1,7|24|0x1a87ae,-27|43|0x185d9c,121|4|0x47a4d1", 95, 1906, 7, 2202, 97)
		if x > -1 then
			showMsg("正在自动打怪...");
			mSleep(5000);
		end
	until(x == -1);
end

-- 跳过剧情
function jumpStory()
	local x, y = findMultiColorInRegionFuzzy(0xfaf8f4,"-63|-7|0xcccac6,-23|12|0xfffefd,-123|17|0xd67a16,-26|39|0xf3d638", 95, 1896, 14, 2203, 150)
	if x > -1 then
		tapponit(x,y,"跳过剧情..");
	end
end

-- 点击继续
function tapContinue()
	local x, y = findMultiColorInRegionFuzzy(0xffffff,"54|-2|0xffffff,176|33|0xffffff,-110|-804|0xe6bf25,-57|-937|0xf2faa5", 95, 347, 7, 1710, 1217)
	if x > -1 then
		tapponit(x,y,"点击屏幕继续..");
	end
end
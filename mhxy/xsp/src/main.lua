require('common')
appid = "com.netease.my.guopan";

init(appid,1); --初始化脚本
runGame(appid);  --启动游戏
--loginGame(); --登录游戏

--co = coroutine.create(showMsg);

while true do
	--判断游戏正在那个页面
	repeat
		x, y = findMultiColorInRegionFuzzy(0xebc55c,"-54|-12|0xcdb09c,-40|11|0xfdfcfc,-15|12|0x95592e,49|-16|0xecc35b,84|14|0xe4841b,-89|-21|0xf9c716", 95, 383, 368, 577, 425);
		if x > -1 then	
				repeat
					mSleep(3000);
					x, y = findMultiColorInRegionFuzzy(0xebc55c,"-54|-12|0xcdb09c,-40|11|0xfdfcfc,-15|12|0x95592e,49|-16|0xecc35b,84|14|0xe4841b,-89|-21|0xf9c716", 95, 383, 368, 577, 425);
					if x > -1 then	
						tapScreen(x,y);
					end
				until(x == -1)
				repeat
					showMsg("正在载入游戏...");
					x, y = findMultiColorInRegionFuzzy(0xf84c20,"-3|7|0x1c81f0,36|40|0x8d5d2c,33|56|0xddb482,-29|4|0xebdcc9", 95, 824, 5, 956, 77);
				until(x > -1)
		end
	until(x == -1)
	
	repeat
		x, y = findMultiColorInRegionFuzzy(0x362720,"-70|-5|0x614436,99|1|0x644637,108|-3|0x644637,81|-2|0x1c1511", 95, 740, 12, 955, 48);
		if x > -1 then
			tapScreen(x,y);
			showMsg("正在跳过剧情...");
			--coroutine.resume(co,"正在跳过剧情...");
		end
	until(x == -1);
	
	repeat
		x, y = findMultiColorInRegionFuzzy(0x615951,"41|-30|0x1b1511,60|7|0x191310,-77|-6|0x625a52,13|-5|0xe9dcca,-102|-13|0x17120f", 95, 638, 7, 910, 87)
		if x > -1 then			
			tapScreen(x,y);
			showMsg("正在加速剧情...");
			--coroutine.resume(co,"正在加速剧情...");
		end
	until(x == -1);
	
	repeat
		x, y = findMultiColorInRegionFuzzy(0xe9bf5c,"-20|-3|0xa77533,25|1|0xe8bd59,17|-4|0x70350d", 95, 770, 406, 872, 457);
		if x > -1 then
			tapScreen(x,y);
			showMsg("正在使用物品...");
			--coroutine.resume(co,"正在使用物品...");
			mSleep(500);
		end
	until(x == -1);
	
	repeat
		x, y = findMultiColorInRegionFuzzy(0xe08b57,"-59|2|0xcf690d,-128|1|0x2a2a2a,-156|-3|0xededed,-214|2|0x1b9572,-284|-6|0xe8a127,-289|13|0x863b0a,-362|-5|0xd42744", 95, 517, 462, 954, 521);
		if x > -1 then
			--showMsg("正在手动战斗...");
			coroutine.resume(co,"正在手动战斗...");
			tapScreen(x,y);
			showMsg("已开启自动战斗...");
			--coroutine.resume(co,"已开启自动战斗...");
		end
	until(x == -1);
	
	repeat
		x, y = findMultiColorInRegionFuzzy(0xde8854,"-71|-10|0x2797a4,-140|27|0x860e00,-104|27|0x251b0e,-48|-16|0xe0a75c", 95, 730, 443, 957, 533);
		if x > -1 then
			showMsg("正在自动战斗...");
			--coroutine.resume(co,"正在自动战斗...");
			mSleep(5000);
		end
	until(x == -1);
	
--[[	
	x, y = findMultiColorInRegionFuzzy(0xe8d5b9,"-193|-2|0xead8bd,-106|-15|0xf5ead9", 95, 691, 68, 937, 172);
	if x > -1 then
		tapScreen(x,y);
		showMsg("正在准备战斗...");
		mSleep(1000);
		--coroutine.resume(co,"正在准备战斗...");
	else
		x, y = findMultiColorInRegionFuzzy(0xe5cfb2,"-201|-6|0xe9d8bd,-209|-71|0xe8dccc", 95, 691, 271, 935, 386);
		if x > -1 then
			tapScreen(x,y);
			showMsg("正在准备战斗...");
			mSleep(1000);
		end
	end
]]--
	
--[[	x, y = findMultiColorInRegionFuzzy(0xe3b057,"36|-8|0xb5dd9e,77|-1|0xe4d49e,173|-1|0x938a66", 95, 728, 88, 956, 207);
	if x > -1 then
		tapScreen(x+80,y+80);
		showMsg("正在执行任务...");
		--coroutine.resume(co,"正在执行任务...");
		mSleep(3000);
	end
--]]

	local dict = createOcrDict("zk.txt");
	results = ocrText(dict,675,82,953,450, {"0xd7ccbc-0x404040"}, 90, 1, 1)
	if results[1] ~= nil and results[1].text== "请" then
		tapScreen(results[1].x+70,results[1].y+70);
		showMsg("正在准备战斗...");
		mSleep(1000);	
	end
	
	result = ocrText(dict,772,82,955,200, {"0xcb5edb-0x404040"}, 90, 0, 1)
	if result == "角色升级" then
		--sysLog("角色升级后才能继续执行主线任务");
		results = ocrText(dict,773,201,955,274, {"0xc8bd2a-0x404040"}, 90, 1, 1);
		if results[1].text..results[2].text == "师门" then
			tapScreen(results[1].x, results[1].y);
			showMsg("正在执行师门任务...");
			--coroutine.resume(co,"正在执行任务...");
			mSleep(3000);
		end
	else
		x, y = findMultiColorInRegionFuzzy(0xe3b057,"36|-8|0xb5dd9e,77|-1|0xe4d49e,173|-1|0x938a66", 95, 728, 88, 956, 207);
		if x > -1 then
			tapScreen(x+80,y+80);
			showMsg("正在主线执行任务...");
			--coroutine.resume(co,"正在执行任务...");
			mSleep(3000);
		end
	end
	
	sysLog("执行");
	--做出相应的操作
end
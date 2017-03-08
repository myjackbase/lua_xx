function tapScreen(x, y)
    touchDown(0, x, y);
    mSleep(200);
    touchUp(0, x, y);
end

function showMsg(msg)
  --local id = createHUD();
	--showHUD(id,msg,16,"0xffffffff","0x99282828",0,312,432,335,46);     --显示HUD内容
	--mSleep(3000); 
	--hideHUD(id);     
	--mSleep(3000);
	toast(msg);
end

function runGame(appid)
	local flag = appIsRunning(appid); --检测梦幻西游是否在运行
	if flag == 0 then --如果没有运行
		runApp(appid); --运行梦幻西游
		repeat
			showMsg("正在打开游戏...");
			x, y = findMultiColorInRegionFuzzy(0xebc55c,"-54|-12|0xcdb09c,-40|11|0xfdfcfc,-15|12|0x95592e,49|-16|0xecc35b,84|14|0xe4841b,-89|-21|0xf9c716", 95, 383, 368, 577, 425);
		until(x > -1)
	else
		local isfront = isFrontApp(appid); --更新前台状态
			if isfront == 0 then
				runApp(appid); --运行梦幻西游
				--mSleep(10000);
			end
		mSleep(3000);
	end
end

function loginGame()
	--local x, y = findMultiColorInRegionFuzzy(0xebbc44,"34|13|0xe2d1c5,-2|33|0xef9519,102|13|0xd6bfaf,164|30|0xe4811a,101|5|0xffffff,118|9|0xa26935", 95, 389, 373, 568, 420);
	local x, y = findMultiColorInRegionFuzzy(0xebc55c,"-54|-12|0xcdb09c,-40|11|0xfdfcfc,-15|12|0x95592e,49|-16|0xecc35b,84|14|0xe4841b,-89|-21|0xf9c716", 95, 383, 368, 577, 425);
	if x > -1 then	
		tapScreen(x,y);
		
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
end

--function doBusiness()
--	--判断游戏正在那个页面
	
--	--做出相应的操作
--end


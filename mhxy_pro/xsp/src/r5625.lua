--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

-- 设置屏幕缩放
setScreenScale(540, 960)

loginGame = function()
	local x, y = findMultiColorInRegionFuzzy(0xebc55c,"-54|-12|0xcdb09c,-40|11|0xfdfcfc,-15|12|0x95592e,49|-16|0xecc35b,84|14|0xe4841b,-89|-21|0xf9c716", 95, 383, 368, 577, 425)
	if x > -1 then	
		tap(x, y);
		
		repeat
			mSleep(3000)
			x, y = findMultiColorInRegionFuzzy(0xebc55c,"-54|-12|0xcdb09c,-40|11|0xfdfcfc,-15|12|0x95592e,49|-16|0xecc35b,84|14|0xe4841b,-89|-21|0xf9c716", 95, 383, 368, 577, 425)
			if x > -1 then	
				tap(x, y);
			end
		until(x == -1)
		
		repeat
			showMsg("正在载入游戏...")
			x, y = findMultiColorInRegionFuzzy(0xf84c20,"-3|7|0x1c81f0,36|40|0x8d5d2c,33|56|0xddb482,-29|4|0xebdcc9", 95, 824, 5, 956, 77)
		until(x > -1)
	end
end
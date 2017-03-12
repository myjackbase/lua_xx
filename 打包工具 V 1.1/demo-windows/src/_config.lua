--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

-- 屏幕分辨率设置
_rconfig = {
	r5625 = { touch = "r5625"},
	r6000 = { touch = "r6000"},
	r6250 = { touch = "r6250"},
	r7500 = { touch = "r7500"},
}

_uiTable = {
	["style"] = "default",
	["width"] = 450,
	["height"] = 350,
	["config"] = "save_001.dat",
	["okname"] = "确定",
	["cancelname"] = "取消",
	["views"] = {
		{
			["type"] = "Page",
			["text"] = "脚本设置",
			["views"] = {
				{
					["id"] = "CheckBoxGroup1",
					["type"] = "CheckBoxGroup",
					["list"] = "主线,师门,红尘",
					["select"] = "0@1@2",
					["orientation"] = "horizontal"
				}	
			}
		},
		{
			["type"] = "Page",
			["text"] = "关于作者",
			["views"] = {
				{                                
				 ["extra"] = {         
						{
							 ["goto"] = "qq",     
							 ["text"] = "202931742"
						},
						{
							 ["goto"] = "qq",     
							 ["text"] = "584376375"
						}
				 },
				 ["size"] = 20,
				 ["text"] = "作者： 明红\nQQ： 584376375\nQQ交流群：202931742\n个性签名：天下武功，唯快不破&大道至简",
				 ["type"] = "Label"
				},
			}
		},
	}
}
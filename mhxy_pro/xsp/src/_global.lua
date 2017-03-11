--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

-- 是否处于调试状态
_isDebug = false

_fsw, _fsh = getScreenSize()
_sw = _fsh - 1
_sh = _fsw - 1
_orientation = 1		--0 竖屏、1 home右、 2 home左

require "_config"
_curR = "r".. (_fsw/_fsh * 10000)
traceLog("_orientation:", _orientation, "_fsw:", _fsw, "_fsh:", _fsh, "_sw:", _sw, "_sh:", _sh, "_curR:", _curR)

if not _rconfig[_curR] then
	traceLog(_fsw/_fsh * 10000)
	dialogRet("不支持当前分辨率", "确定", "", "", 0)
else
	require (_rconfig[_curR].touch)
end
--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

_isDebug = true

_fsw, _fsh = getScreenSize()
_sw = _fsh - 1
_sh = _fsw - 1
_orientation = 1		--0 竖屏、1 home右、 2 home左

require "_config"
_curR = "r".._fsw.._fsh
traceLog("_orientation:", _orientation, "_fsw:", _fsw, "_fsh:", _fsh, "_sw:", _sw, "_sh:", _sh, "_curR:", _curR)

if not _rconfig[_curR] then
	dialogRet("不支持当前分辨率", "XXXXX", "", "", 0)
	do return end
end
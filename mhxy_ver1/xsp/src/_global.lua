--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

_isDebug = true
_isCanRun = false

_fsw, _fsh = getScreenSize()
_sw = _fsh - 1
_sh = _fsw - 1
_wbl = _fsw/540
_hbl = _fsh/960
_orientation = 1		--0 竖屏、1 home右、 2 home左

require "_config"
_curR = "r".._fsw.._fsh
traceLog("_orientation:", _orientation, "_fsw:", _fsw, "_fsh:", _fsh, "_sw:", _sw, "_sh:", _sh, "_curR:", _curR, "_wbl:",_wbl,"_hbl:",_hbl)

if not _rconfig[_curR] then
	dialogRet("不支持当前分辨率", "XXXXX", "", "", 0)
	do return end
else
	_isCanRun = true
end
--Author: Ming
--Email: myjackbase@gmail.com
--2017.03.08

-- 格式化输出
sysLogFmt = function(fmt, ...)
  sysLog(string.format(fmt, ...))
end

-- 任意输出
sysLogLst = function(...)
  local msg = ''
  for k,v in pairs({...}) do
    msg = string.format('%s %s ', msg, tostring(v))
  end
  sysLog(msg)
end

-- 模拟一次点击
tap = function(x, y)
  math.randomseed(tostring(os.time()):reverse():sub(1, 6))  --设置随机数种子
  local index = math.random(1,5)
  x = x + math.random(-2,2)
  y = y + math.random(-2,2)
  touchDown(index,x, y)
  mSleep(math.random(60,80))                --某些特殊情况需要增大延迟才能模拟点击效果
  touchUp(index, x, y)
  mSleep(20)
end

tapponit = function(x,y, msg)
	tap(x,y);
	showMsg(msg);
	mSleep(200);
end

-- 模拟滑动操作，从点(x1, y1)划到到(x2, y2)
swip = function(x1,y1,x2,y2)
    local step, x, y, index = 20, x1 , y1, math.random(1,5)
    touchDown(index, x, y)

    local function move(from, to) 
      if from > to then
        do 
          return -1 * step 
        end
      else 
        return step 
      end 
    end

    while (math.abs(x-x2) >= step) or (math.abs(y-y2) >= step) do
        if math.abs(x-x2) >= step then x = x + move(x1,x2) end
        if math.abs(y-y2) >= step then y = y + move(y1,y2) end
        touchMove(index, x, y)
        mSleep(20)
    end

    touchMove(index, x2, y2)
    mSleep(30)
    touchUp(index, x2, y2)
end

-- 多点颜色对比，格式为{{x,y,color},{x,y,color}...} 
cmpColor = function(array, s, isKeepScreen)
  s = s or 90
  s = math.floor(0xff * (100 - s) * 0.01)
  isKeepScreen = isKeepScreen or false
  
  local lockscreen = function(flag)
    if isKeepScreen == true then
      keepScreen(flag)
    end
  end

  lockscreen(true)
  for i = 1, #array do
    local lr,lg,lb = getColorRGB(array[i][1], array[i][2])
    local rgb = array[i][3]

    local r = math.floor(rgb/0x10000)
    local g = math.floor(rgb%0x10000/0x100)
    local b = math.floor(rgb%0x100)

    if math.abs(lr-r) > s or math.abs(lg-g) > s or math.abs(lb-b) > s then
      lockscreen(false)
      return false
    end
  end

  lockscreen(false)
  return true
end

-- 打印跟踪日志
traceLog = function (...)
	if not _isDebug then
		do return end
	end
	local params = {...}
	local str = nil
	for k,v in pairs(params) do
		if not str then
			str = tostring(v)
		else
			str = str .. ", " .. tostring(v)
		end
	end
    sysLog("[Trace]>>>>"..str)
end

-- 打印脚本运行提示（面向用户）
_userMsg = ""
showMsg = function(msg)
	_userMsg = msg
	showMsgCore()
end

showMsgCore = coroutine.wrap(function()
		--toast(msg)
		local id = createHUD();
		while true do
			showHUD(id,_userMsg,46,"0xffffffff","0x99282828",0,0,_sh-98,700,98);     --显示HUD内容  
			coroutine.yield()
			--hideHUD(id) 
		end
end)

-- 格式化输出table（力荐）
printTable = function (root, notPrint, params)
	if not _isDebug then
		do return end
	end
	local rootType = type(root)
	if rootType == "table" then
		local tag = params and params.tag or "Table detail:>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
		local cache = {  [root] = "." }
		local isHead = false
		local function _dump(t, space, name)
			local temp = {}
			if not isHead then
				temp = {tag}
				isHead = true
			end
			for k,v in pairs(t) do
				local key = tostring(k)
				if cache[v] then
					tinsert(temp, "+" .. key .. " {" .. cache[v] .. "}")
				elseif type(v) == "table" then
					local new_key = name .. "." .. key
					cache[v] = new_key
					tinsert(temp, "+" .. key .. _dump(v, space .. (next(t, k) and "|" or " " ) .. srep(" ", #key), new_key))
				else
					tinsert(temp, "+" .. key .. " [" .. tostring(v) .. "]")
				end
			end
			return tconcat(temp, "\n" .. space)
		end
		if not notPrint then
			print(_dump(root, "", ""))
			print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
		else
			return _dump(root, "", "")
		end
	else
		print("[printr error]: not support type")
	end
end

findMultiColorInRegionFuzzyExt = function (...)		
		keepScreen(true)
		local x,y = findMultiColorInRegionFuzzy(arg[1],arg[2],arg[3],arg[4],arg[5],arg[6],arg[7])
		keepScreen(false)
		return x,y
end

-- JSON模块
--lo_json = {}
--lo_json.obj = require('Libs.JSON')
--lo_json.decode = function(x) return lo_json.obj:decode(x) end
--lo_json.encode = function(x) return lo_json.obj:encode(x) end
--lo_json.encode_pretty = function(x) return lo_json.obj:encode_pretty(x) end;


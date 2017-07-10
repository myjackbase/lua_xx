require "util"
require "app"

function main()
	init("0", _orientation)
	
	while true do
		showMsg("正在执行脚本...");
		MX()
	end
end

main()
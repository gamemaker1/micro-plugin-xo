VERSION = "0.1.0"

-- xo
-- A Micro plugin that lints Typescript and Javascript files using XO

-- Plugin source: https://github.com/gamemaker1/micro-plugin-xo
-- XOJS source: https://github.com/xojs/xo

local micro = import("micro")
local runtime = import("runtime")

-- Pre-initialization hook
function preinit()
	-- Register the linter for both Javascript and Typescript files
	if linter ~= nil then
		linter.makeLinter(
			-- The name of the linter
			"xo",
			-- It should run on Javascript and Typescript files
			"[type|java]script",
			-- Run the XO command
			"npx", {"xo", "--reporter", "unix", "--fix", "%f"}, 
			-- The format in which XO reports its errors
			-- - %f is the file name
			-- - %l is the line number
			-- - %c is the column
			-- - %m is the error message
			"%f:%l:%c: %m",
			-- Run on all operating systems
			{}, false,
			-- The file type param is a regex, interpret it as such
			true
		)
	end
end

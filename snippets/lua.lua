---@diagnostic disable: undefined-global
return {
	parse("fn", "local function $1($2)\n\t$0\nend"),
	parse("_req", 'require("$0")'),
	parse("pr", 'print("$0")'),
}

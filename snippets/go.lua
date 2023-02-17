---@diagnostic disable: undefined-global
return {
	parse("cl", "fmt.Println($1)$0"),
	parse("pf", "fmt.Printf($1)$0"),
}

return {
	parse("cl", "console.log($0);"),
	parse("clO", "console.log({ $1 });$0"),
}

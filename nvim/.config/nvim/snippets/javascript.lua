return {
  parse("cl", "console.log({});"),
  parse("clO", "console.log({ $1 });$0"),
}

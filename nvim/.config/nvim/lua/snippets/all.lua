local date = function()
  return { os.date("%Y-%m-%d") }
end

return {
  s({
    trig = "date",
    namr = "Date",
    dscr = "Date in the form of YYYY-MM-DD",
  }, { f(date) }),
}

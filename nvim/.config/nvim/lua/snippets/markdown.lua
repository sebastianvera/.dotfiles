return {
	s({
		trig = "link",
		namr = "markdown_link",
		dscr = "Create markdown link [txt](url)",
	}, {
		t("["),
		i(1),
		t("]("),
		f(function(_, snip)
			return snip.env.TM_SELECTED_TEXT[1] or {}
		end, {}),
		t(")"),
		i(0),
	}),
}

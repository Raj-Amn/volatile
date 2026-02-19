return {
	s("cl", {
		t("class "),
		f(function()
			return vim.fn.expand("%:t:r")
		end),
		t(" {"),
		t({"", "\t"}),
		i(0),
		t({"", "}"}),
	}),

	s("main", {
		t("public static void main (String[] args) {"),
		t({"", "\t"}),
		i(0),
		t({"", "}"}),
	}),

	s("sout", {
		t("System.out.println("),
		i(0),
		t(");"),
	}),

	s("for", {
		t("for ("),
		i(1),
		t("; "),
		i(2),
		t("; "),
		i(3),
		t(") "),
		i(0),
	}),

	s("wh", {
		t("while ("),
		i(1, "true"),
		t(") "),
		i(0),
	}),
}

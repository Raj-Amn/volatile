-- VS Code Dark+ colorscheme for Neovim
-- Based on the default VS Code Dark+ theme

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "vscode"
vim.o.background = "dark"
vim.o.termguicolors = true

local colors = {
  -- Base UI colors
  bg          = "#1e1e1e",
  bg_sidebar  = "#252526",
  bg_statusbar= "#007acc",
  bg_widget   = "#2d2d2d",
  bg_input    = "#3c3c3c",
  fg          = "#d4d4d4",
  fg_dim      = "#808080",
  fg_inactive = "#858585",
  selection   = "#264f78",
  selection_l = "#add6ff26",
  line_hl     = "#2a2d2e",
  cursor_line = "#2a2d2e",
  border      = "#474747",
  scrollbar   = "#424242",

  -- Syntax colors (VS Code Dark+)
  blue        = "#569cd6",   -- keywords, builtins
  blue_bright = "#4ec9b0",   -- types/classes
  green       = "#6a9955",   -- comments
  green_str   = "#ce9178",   -- strings (actually orange-ish in VS Code)
  yellow      = "#dcdcaa",   -- functions
  yellow_l    = "#d7ba7d",   -- escape chars, operators
  orange      = "#ce9178",   -- strings
  red         = "#f44747",   -- errors
  red_l       = "#d16969",   -- regex
  purple      = "#c586c0",   -- control flow keywords (if/else/return)
  cyan        = "#4fc1ff",   -- variables (debug)
  white       = "#d4d4d4",   -- normal text
  numeric     = "#b5cea8",   -- numbers
  type_param  = "#4ec9b0",   -- type names

  -- UI extras
  none        = "NONE",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ─── Editor UI ───────────────────────────────────────────────────────────────
hi("Normal",          { fg = colors.fg,         bg = colors.bg })
hi("NormalNC",        { fg = colors.fg,         bg = colors.bg })
hi("NormalFloat",     { fg = colors.fg,         bg = colors.bg_widget })
hi("FloatBorder",     { fg = colors.border,     bg = colors.bg_widget })
hi("Pmenu",           { fg = colors.fg,         bg = colors.bg_widget })
hi("PmenuSel",        { fg = colors.fg,         bg = colors.selection })
hi("PmenuSbar",       {                         bg = colors.bg_widget })
hi("PmenuThumb",      {                         bg = colors.scrollbar })
hi("StatusLine",      { fg = "#ffffff",         bg = colors.bg_statusbar })
hi("StatusLineNC",    { fg = colors.fg_dim,     bg = colors.bg_sidebar })
hi("TabLine",         { fg = colors.fg_dim,     bg = colors.bg_sidebar })
hi("TabLineSel",      { fg = colors.fg,         bg = colors.bg })
hi("TabLineFill",     {                         bg = colors.bg_sidebar })
hi("WinBar",          { fg = colors.fg,         bg = colors.bg })
hi("WinBarNC",        { fg = colors.fg_dim,     bg = colors.bg })
hi("WinSeparator",    { fg = colors.border })
hi("VertSplit",       { fg = colors.border })
hi("ColorColumn",     {                         bg = "#2d2d2d" })
hi("CursorLine",      {                         bg = colors.cursor_line })
hi("CursorLineNr",    { fg = "#c6c6c6",         bold = true })
hi("CursorColumn",    {                         bg = colors.cursor_line })
hi("LineNr",          { fg = "#858585" })
hi("SignColumn",      { fg = colors.fg_dim,     bg = colors.bg })
hi("FoldColumn",      { fg = colors.fg_dim,     bg = colors.bg })
hi("Folded",          { fg = colors.fg_dim,     bg = "#202020" })
hi("EndOfBuffer",     { fg = colors.bg })
hi("NonText",         { fg = "#3b3b3b" })
hi("Whitespace",      { fg = "#3b3b3b" })
hi("SpecialKey",      { fg = "#3b3b3b" })
hi("MatchParen",      { fg = colors.yellow_l,   bg = "#3b3b3b", bold = true })
hi("Search",          { fg = "#000000",         bg = "#9e6a03" })
hi("IncSearch",       { fg = "#000000",         bg = "#bf8803" })
hi("CurSearch",       { fg = "#000000",         bg = "#bf8803" })
hi("Substitute",      { fg = "#000000",         bg = "#9e6a03" })
hi("Visual",          {                         bg = colors.selection })
hi("VisualNOS",       {                         bg = colors.selection })
hi("QuickFixLine",    {                         bg = colors.selection })

-- Cursor
hi("Cursor",          { fg = colors.bg,         bg = colors.fg })
hi("iCursor",         { fg = colors.bg,         bg = colors.fg })
hi("lCursor",         { fg = colors.bg,         bg = colors.fg })
hi("CursorIM",        { fg = colors.bg,         bg = colors.fg })
hi("TermCursor",      { fg = colors.bg,         bg = colors.fg })

-- Diff
hi("DiffAdd",         { fg = colors.none,       bg = "#0f2a1c" })
hi("DiffChange",      { fg = colors.none,       bg = "#091f3b" })
hi("DiffDelete",      { fg = "#f44747",         bg = "#2c1313" })
hi("DiffText",        { fg = colors.none,       bg = "#1a3a5c" })
hi("Added",           { fg = "#3fb950" })
hi("Changed",         { fg = "#58a6ff" })
hi("Removed",         { fg = "#f85149" })

-- Messages & prompts
hi("ErrorMsg",        { fg = colors.red })
hi("WarningMsg",      { fg = "#cca700" })
hi("ModeMsg",         { fg = colors.fg,         bold = true })
hi("MoreMsg",         { fg = colors.blue })
hi("Question",        { fg = colors.blue })
hi("Title",           { fg = colors.blue,       bold = true })
hi("Directory",       { fg = colors.blue })

-- Spelling
hi("SpellBad",        { undercurl = true,       sp = colors.red })
hi("SpellCap",        { undercurl = true,       sp = colors.blue })
hi("SpellRare",       { undercurl = true,       sp = colors.purple })
hi("SpellLocal",      { undercurl = true,       sp = colors.cyan })

-- ─── Syntax ───────────────────────────────────────────────────────────────────
hi("Comment",         { fg = colors.green,      italic = true })
hi("Constant",        { fg = colors.blue })
hi("String",          { fg = colors.orange })
hi("Character",       { fg = colors.orange })
hi("Number",          { fg = colors.numeric })
hi("Float",           { fg = colors.numeric })
hi("Boolean",         { fg = colors.blue })
hi("Identifier",      { fg = colors.fg })
hi("Function",        { fg = colors.yellow })
hi("Statement",       { fg = colors.purple })
hi("Conditional",     { fg = colors.purple })
hi("Repeat",          { fg = colors.purple })
hi("Label",           { fg = colors.purple })
hi("Operator",        { fg = colors.fg })
hi("Keyword",         { fg = colors.blue })
hi("Exception",       { fg = colors.purple })
hi("PreProc",         { fg = colors.purple })
hi("Include",         { fg = colors.purple })
hi("Define",          { fg = colors.purple })
hi("Macro",           { fg = colors.purple })
hi("PreCondit",       { fg = colors.purple })
hi("Type",            { fg = colors.blue_bright })
hi("StorageClass",    { fg = colors.blue })
hi("Structure",       { fg = colors.blue_bright })
hi("Typedef",         { fg = colors.blue_bright })
hi("Special",         { fg = colors.yellow_l })
hi("SpecialChar",     { fg = colors.yellow_l })
hi("Tag",             { fg = colors.blue })
hi("Delimiter",       { fg = colors.fg })
hi("SpecialComment",  { fg = colors.green,      italic = true })
hi("Debug",           { fg = colors.red })
hi("Underlined",      { underline = true })
hi("Ignore",          { fg = colors.fg_dim })
hi("Error",           { fg = colors.red })
hi("Todo",            { fg = colors.fg,         bg = "#3d3d00", bold = true })

-- ─── Treesitter ───────────────────────────────────────────────────────────────
-- Variables
hi("@variable",               { fg = colors.fg })
hi("@variable.builtin",       { fg = colors.blue })
hi("@variable.parameter",     { fg = "#9cdcfe" })
hi("@variable.member",        { fg = "#9cdcfe" })

-- Constants
hi("@constant",               { fg = colors.fg })
hi("@constant.builtin",       { fg = colors.blue })
hi("@constant.macro",         { fg = colors.blue })

-- Strings
hi("@string",                 { fg = colors.orange })
hi("@string.regex",           { fg = colors.red_l })
hi("@string.escape",          { fg = colors.yellow_l })
hi("@string.special",         { fg = colors.yellow_l })

-- Numbers
hi("@number",                 { fg = colors.numeric })
hi("@float",                  { fg = colors.numeric })
hi("@boolean",                { fg = colors.blue })

-- Functions
hi("@function",               { fg = colors.yellow })
hi("@function.builtin",       { fg = colors.yellow })
hi("@function.macro",         { fg = colors.yellow })
hi("@function.method",        { fg = colors.yellow })
hi("@function.call",          { fg = colors.yellow })
hi("@function.method.call",   { fg = colors.yellow })
hi("@constructor",            { fg = colors.blue_bright })

-- Keywords
hi("@keyword",                { fg = colors.blue })
hi("@keyword.function",       { fg = colors.blue })
hi("@keyword.operator",       { fg = colors.blue })
hi("@keyword.return",         { fg = colors.purple })
hi("@keyword.conditional",    { fg = colors.purple })
hi("@keyword.repeat",         { fg = colors.purple })
hi("@keyword.import",         { fg = colors.purple })
hi("@keyword.exception",      { fg = colors.purple })

-- Types
hi("@type",                   { fg = colors.blue_bright })
hi("@type.builtin",           { fg = colors.blue })
hi("@type.definition",        { fg = colors.blue_bright })
hi("@type.qualifier",         { fg = colors.blue })
hi("@attribute",              { fg = colors.blue_bright })

-- Comments
hi("@comment",                { fg = colors.green, italic = true })
hi("@comment.documentation",  { fg = colors.green, italic = true })

-- Operators & punctuation
hi("@operator",               { fg = colors.fg })
hi("@punctuation",            { fg = colors.fg })
hi("@punctuation.bracket",    { fg = colors.fg })
hi("@punctuation.delimiter",  { fg = colors.fg })
hi("@punctuation.special",    { fg = colors.yellow_l })

-- Namespaces/modules
hi("@module",                 { fg = colors.fg })
hi("@namespace",              { fg = colors.fg })

-- HTML / markup
hi("@tag",                    { fg = colors.blue })
hi("@tag.builtin",            { fg = colors.blue })
hi("@tag.attribute",          { fg = colors.blue_bright })
hi("@tag.delimiter",          { fg = colors.fg_dim })
hi("@markup.heading",         { fg = colors.blue,   bold = true })
hi("@markup.bold",            { bold = true })
hi("@markup.italic",          { italic = true })
hi("@markup.strikethrough",   { strikethrough = true })
hi("@markup.underline",       { underline = true })
hi("@markup.link",            { fg = colors.blue,   underline = true })
hi("@markup.link.url",        { fg = colors.orange, underline = true })
hi("@markup.raw",             { fg = colors.orange })
hi("@markup.list",            { fg = colors.purple })

-- ─── LSP ──────────────────────────────────────────────────────────────────────
hi("LspReferenceText",        {                   bg = "#3a3d41" })
hi("LspReferenceRead",        {                   bg = "#3a3d41" })
hi("LspReferenceWrite",       {                   bg = "#3a3d41" })
hi("LspInlayHint",            { fg = "#888888",   bg = "#262626", italic = true })
hi("LspCodeLens",             { fg = colors.fg_dim, italic = true })
hi("LspSignatureActiveParameter", { fg = colors.yellow, bold = true })

-- Diagnostics
hi("DiagnosticError",         { fg = "#f44747" })
hi("DiagnosticWarn",          { fg = "#cca700" })
hi("DiagnosticInfo",          { fg = "#75beff" })
hi("DiagnosticHint",          { fg = "#b5cea8" })
hi("DiagnosticOk",            { fg = "#4ec9b0" })

hi("DiagnosticUnderlineError",{ undercurl = true, sp = "#f44747" })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = "#cca700" })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = "#75beff" })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = "#b5cea8" })

hi("DiagnosticVirtualTextError", { fg = "#f44747", italic = true })
hi("DiagnosticVirtualTextWarn",  { fg = "#cca700", italic = true })
hi("DiagnosticVirtualTextInfo",  { fg = "#75beff", italic = true })
hi("DiagnosticVirtualTextHint",  { fg = "#b5cea8", italic = true })

hi("DiagnosticSignError",     { fg = "#f44747" })
hi("DiagnosticSignWarn",      { fg = "#cca700" })
hi("DiagnosticSignInfo",      { fg = "#75beff" })
hi("DiagnosticSignHint",      { fg = "#b5cea8" })

-- ─── Telescope ────────────────────────────────────────────────────────────────
hi("TelescopeBorder",         { fg = colors.border,     bg = colors.bg_widget })
hi("TelescopeNormal",         { fg = colors.fg,         bg = colors.bg_widget })
hi("TelescopePromptBorder",   { fg = colors.blue,       bg = colors.bg_widget })
hi("TelescopePromptNormal",   { fg = colors.fg,         bg = colors.bg_widget })
hi("TelescopeResultsNormal",  { fg = colors.fg,         bg = colors.bg_widget })
hi("TelescopeSelection",      { fg = colors.fg,         bg = colors.selection })
hi("TelescopeSelectionCaret", { fg = colors.blue,       bg = colors.selection })
hi("TelescopeMatching",       { fg = colors.yellow,     bold = true })

-- ─── nvim-cmp ─────────────────────────────────────────────────────────────────
hi("CmpItemAbbr",             { fg = colors.fg })
hi("CmpItemAbbrDeprecated",   { fg = colors.fg_dim,     strikethrough = true })
hi("CmpItemAbbrMatch",        { fg = colors.blue,       bold = true })
hi("CmpItemAbbrMatchFuzzy",   { fg = colors.blue })
hi("CmpItemKind",             { fg = colors.blue_bright })
hi("CmpItemMenu",             { fg = colors.fg_dim })

-- ─── GitSigns ─────────────────────────────────────────────────────────────────
hi("GitSignsAdd",             { fg = "#4ec994" })
hi("GitSignsChange",          { fg = "#2472c8" })
hi("GitSignsDelete",          { fg = "#f44747" })

-- ─── Indent-blankline ─────────────────────────────────────────────────────────
hi("IblIndent",               { fg = "#3b3b3b" })
hi("IblScope",                { fg = "#6e6e6e" })

-- ─── fzf-lua ──────────────────────────────────────────────────────────────────
hi("FzfLuaNormal",            { fg = colors.fg,         bg = colors.bg_widget })
hi("FzfLuaBorder",            { fg = colors.border,     bg = colors.bg_widget })
hi("FzfLuaTitle",             { fg = colors.blue,       bold = true })
hi("FzfLuaPreviewNormal",     { fg = colors.fg,         bg = colors.bg })
hi("FzfLuaPreviewBorder",     { fg = colors.border,     bg = colors.bg })
hi("FzfLuaPreviewTitle",      { fg = colors.blue,       bold = true })
hi("FzfLuaCursor",            { fg = colors.bg,         bg = colors.fg })
hi("FzfLuaCursorLine",        { fg = colors.fg,         bg = colors.selection })
hi("FzfLuaCursorLineNr",      { fg = "#c6c6c6",         bold = true })
hi("FzfLuaSearch",            { fg = "#000000",         bg = "#9e6a03" })
hi("FzfLuaScrollBorderEmpty", { fg = colors.border })
hi("FzfLuaScrollBorderFull",  { fg = colors.blue })
hi("FzfLuaScrollFloatEmpty",  { fg = colors.border })
hi("FzfLuaScrollFloatFull",   { fg = colors.blue })
hi("FzfLuaHelpNormal",        { fg = colors.fg,         bg = colors.bg_widget })
hi("FzfLuaHelpBorder",        { fg = colors.border,     bg = colors.bg_widget })

-- fzf-lua file/path components
hi("FzfLuaPathColNr",         { fg = colors.numeric })
hi("FzfLuaPathLineNr",        { fg = colors.numeric })
hi("FzfLuaBufName",           { fg = colors.orange })
hi("FzfLuaBufNr",             { fg = colors.numeric })
hi("FzfLuaBufFlagCur",        { fg = colors.blue })
hi("FzfLuaBufFlagAlt",        { fg = colors.fg_dim })
hi("FzfLuaTabTitle",          { fg = colors.yellow,     bold = true })
hi("FzfLuaTabMarker",         { fg = colors.blue,       bold = true })

-- fzf-lua match highlight
hi("FzfLuaMatch",             { fg = colors.yellow,     bold = true })

-- fzf-lua header (keybind hints)
hi("FzfLuaHeaderBind",        { fg = colors.purple })
hi("FzfLuaHeaderText",        { fg = colors.fg_dim })

-- fzf-lua LSP / diagnostics entries
hi("FzfLuaLiveSym",           { fg = colors.blue_bright })

-- ─── Notify / Noice ───────────────────────────────────────────────────────────
hi("NotifyERRORBorder",       { fg = "#f44747" })
hi("NotifyWARNBorder",        { fg = "#cca700" })
hi("NotifyINFOBorder",        { fg = "#75beff" })
hi("NotifyDEBUGBorder",       { fg = colors.fg_dim })
hi("NotifyTRACEBorder",       { fg = colors.purple })
hi("NotifyERRORTitle",        { fg = "#f44747", bold = true })
hi("NotifyWARNTitle",         { fg = "#cca700", bold = true })
hi("NotifyINFOTitle",         { fg = "#75beff", bold = true })
hi("NotifyDEBUGTitle",        { fg = colors.fg_dim, bold = true })
hi("NotifyTRACETitle",        { fg = colors.purple, bold = true })

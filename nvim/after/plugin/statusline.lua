-- statusline.lua

-- cache git branch per buffer
local git_cache = {}
local function git_branch()
    local buf = vim.api.nvim_get_current_buf()
    if git_cache[buf] then return git_cache[buf] end
    local branch = vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub("\n", "")
    local result = branch ~= "" and string.format("  %s ", branch) or ""
    git_cache[buf] = result
    return result
end

-- clear cache on buf enter so new buffers get fresh branch
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    callback = function() git_cache[vim.api.nvim_get_current_buf()] = nil end,
})

local function mode()
    local modes = {
        n  = "NORMAL",  i  = "INSERT",  v  = "VISUAL",
        V  = "V-LINE",  ["\22"] = "V-BLOCK",
        c  = "COMMAND", R  = "REPLACE", s  = "SELECT",
        t  = "TERMINAL", S = "S-LINE",
    }
    local m = vim.api.nvim_get_mode().mode
    return string.format(" %s ", modes[m] or m)
end

local function filepath()
    local path = vim.fn.expand("%:~:.")
    if path == "" then return " [No Name] " end
    return string.format(" %s ", path)
end

local function modified()
    if vim.bo.modified then return " [+] " end
    if vim.bo.readonly then return " [-] " end
    return ""
end

local function filetype()
    local ft = vim.bo.filetype
    if ft == "" then return " unknown " end
    return string.format(" %s ", ft)
end

local function fileencoding()
    local enc = vim.bo.fileencoding
    if enc == "" then enc = vim.o.encoding end
    return string.format(" %s ", enc)
end

local function lineinfo()
    local line  = vim.fn.line(".")
    local col   = vim.fn.col(".")
    local total = vim.fn.line("$")
    return string.format(" %d:%d  %d lines ", line, col, total)
end

local function percentage()
    local current = vim.fn.line(".")
    local total   = vim.fn.line("$")
    if current == 1     then return " TOP " end
    if current == total then return " BOT " end
    return string.format(" %d%%%% ", math.floor(current / total * 100))
end

-- pull colors from the current theme at startup (or colorscheme change)
local function set_highlights()
    local normal  = vim.api.nvim_get_hl(0, { name = "Normal",    link = false })
    local keyword = vim.api.nvim_get_hl(0, { name = "Function",  link = false })
    local comment = vim.api.nvim_get_hl(0, { name = "Comment",   link = false })
    local pmenu   = vim.api.nvim_get_hl(0, { name = "CursorLine",link = false })

    local accent_bg = keyword.fg  -- theme's function/keyword color as accent
    local accent_fg = normal.bg   -- usually dark
    local mid_bg    = normal.bg
    local mid_fg    = normal.fg
    local dim_bg    = pmenu.bg or normal.bg
    local dim_fg    = comment.fg or normal.fg

    vim.api.nvim_set_hl(0, "StatusLineMode",     { bg = accent_bg, fg = accent_fg, bold = true })
    vim.api.nvim_set_hl(0, "StatusLineGit",      { bg = dim_bg,    fg = dim_fg })
    vim.api.nvim_set_hl(0, "StatusLineFile",     { bg = mid_bg,    fg = mid_fg })
    vim.api.nvim_set_hl(0, "StatusLineMid",      { bg = mid_bg,    fg = mid_fg })
    vim.api.nvim_set_hl(0, "StatusLineInfo",     { bg = dim_bg,    fg = dim_fg })
    vim.api.nvim_set_hl(0, "StatusLinePosition", { bg = accent_bg, fg = accent_fg, bold = true })
end

set_highlights()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_highlights })

function Statusline()
    local s = ""
    s = s .. "%#StatusLineMode#"     .. mode()
    s = s .. "%#StatusLineGit#"      .. git_branch()
    s = s .. "%#StatusLineFile#"     .. filepath() .. modified()
    s = s .. "%#StatusLineMid#"      .. "%="
    s = s .. "%#StatusLineInfo#"     .. filetype() .. " | " .. fileencoding()
    s = s .. "%#StatusLinePosition#" .. lineinfo() .. percentage()
    return s
end

vim.o.statusline = "%!v:lua.Statusline()"

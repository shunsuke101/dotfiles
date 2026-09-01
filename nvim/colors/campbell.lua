-- campbell — Windows Terminal / Command Prompt の標準配色 "Campbell" を
-- そのまま Neovim のテキスト/シンタックス色に使うカラースキーム。
-- 16 色は Campbell のパレット。UI の下地だけは背景 (#0C0C0C) から
-- 明度を持ち上げたニュートラルグレーを補助的に使う。

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "campbell"

local p = {
  black          = "#0C0C0C",
  red            = "#C50F1F",
  green          = "#13A10E",
  yellow         = "#C19C00",
  blue           = "#0037DA",
  magenta        = "#881798",
  cyan           = "#3A96DD",
  white          = "#CCCCCC",
  bright_black   = "#767676",
  bright_red     = "#E74856",
  bright_green   = "#16C60C",
  bright_yellow  = "#F9F1A5",
  bright_blue    = "#3B78FF",
  bright_magenta = "#B4009E",
  bright_cyan    = "#61D6D6",
  bright_white   = "#F2F2F2",
  -- UI chrome 用の補助グレー (Campbell 背景の明度を段階的に上げたもの)
  bg0            = "#0C0C0C",
  bg1            = "#1C1C1C",
  bg2            = "#2E2E2E",
  bg3            = "#404040",
}

-- :terminal の 16 色も Campbell に揃える
local term = {
  p.black, p.red, p.green, p.yellow, p.blue, p.magenta, p.cyan, p.white,
  p.bright_black, p.bright_red, p.bright_green, p.bright_yellow,
  p.bright_blue, p.bright_magenta, p.bright_cyan, p.bright_white,
}
for i, color in ipairs(term) do
  vim.g["terminal_color_" .. (i - 1)] = color
end

local groups = {
  -- 基本
  Normal       = { fg = p.white, bg = p.bg0 },
  NormalNC     = { fg = p.white, bg = p.bg0 },
  NormalFloat  = { fg = p.white, bg = p.bg1 },
  FloatBorder  = { fg = p.bg3, bg = p.bg1 },
  FloatTitle   = { fg = p.bright_white, bg = p.bg1, bold = true },
  Cursor       = { fg = p.bg0, bg = p.white },
  lCursor      = { fg = p.bg0, bg = p.white },
  CursorLine   = { bg = p.bg1 },
  CursorColumn = { bg = p.bg1 },
  ColorColumn  = { bg = p.bg1 },
  LineNr       = { fg = p.bright_black },
  CursorLineNr = { fg = p.bright_yellow, bold = true },
  SignColumn   = { fg = p.bright_black, bg = "NONE" },
  FoldColumn   = { fg = p.bright_black },
  Folded       = { fg = p.bright_black, bg = p.bg1 },
  VertSplit    = { fg = p.bg3 },
  WinSeparator = { fg = p.bg3 },
  Visual       = { bg = p.bg2 },
  VisualNOS    = { bg = p.bg2 },
  MatchParen   = { fg = p.bright_yellow, bg = p.bg3, bold = true },
  NonText      = { fg = "#3A3A3A" },
  Whitespace   = { fg = "#3A3A3A" },
  SpecialKey   = { fg = "#3A3A3A" },
  Directory    = { fg = p.bright_blue },
  Title        = { fg = p.bright_green, bold = true },
  Conceal      = { fg = p.bright_black },
  EndOfBuffer  = { fg = p.bg0 },

  -- 検索 / メッセージ
  Search       = { fg = p.black, bg = p.yellow },
  IncSearch    = { fg = p.black, bg = p.bright_yellow },
  CurSearch    = { fg = p.black, bg = p.bright_yellow },
  ErrorMsg     = { fg = p.bright_red },
  WarningMsg   = { fg = p.bright_yellow },
  ModeMsg      = { fg = p.white, bold = true },
  MoreMsg      = { fg = p.bright_green },
  Question     = { fg = p.bright_green },

  -- 補完 / statusline / tabline
  Pmenu        = { fg = p.white, bg = p.bg1 },
  PmenuSel     = { fg = p.bright_white, bg = p.blue },
  PmenuSbar    = { bg = p.bg2 },
  PmenuThumb   = { bg = p.bright_black },
  WildMenu     = { fg = p.bright_white, bg = p.blue },
  StatusLine   = { fg = p.white, bg = p.bg2 },
  StatusLineNC = { fg = p.bright_black, bg = p.bg1 },
  TabLine      = { fg = p.bright_black, bg = p.bg1 },
  TabLineSel   = { fg = p.bright_white, bg = p.bg0, bold = true },
  TabLineFill  = { bg = p.bg1 },

  -- 標準シンタックス
  Comment      = { fg = p.bright_black, italic = true },
  -- C / C++ の /* */ ・ // コメントは濃い水色 (Campbell の cyan)
  cComment       = { fg = p.cyan, italic = true },
  cCommentL      = { fg = p.cyan, italic = true },
  ["@comment.c"]                 = { fg = p.cyan, italic = true },
  ["@comment.documentation.c"]   = { fg = p.cyan, italic = true },
  ["@comment.cpp"]               = { fg = p.cyan, italic = true },
  ["@comment.documentation.cpp"] = { fg = p.cyan, italic = true },
  Constant     = { fg = p.yellow },
  String       = { fg = p.green },
  Character    = { fg = p.green },
  Number       = { fg = p.yellow },
  Boolean      = { fg = p.bright_yellow },
  Float        = { fg = p.yellow },
  Identifier   = { fg = p.white },
  Function     = { fg = p.bright_blue },
  Statement    = { fg = p.bright_magenta },
  Conditional  = { fg = p.bright_magenta },
  Repeat       = { fg = p.bright_magenta },
  Label        = { fg = p.bright_magenta },
  Operator     = { fg = p.bright_white },
  Keyword      = { fg = p.bright_magenta },
  Exception    = { fg = p.bright_red },
  PreProc      = { fg = p.cyan },
  Include      = { fg = p.cyan },
  Define       = { fg = p.cyan },
  Macro        = { fg = p.cyan },
  PreCondit    = { fg = p.cyan },
  Type         = { fg = p.bright_cyan },
  StorageClass = { fg = p.bright_cyan },
  Structure    = { fg = p.bright_cyan },
  Typedef      = { fg = p.bright_cyan },
  Special      = { fg = p.bright_red },
  SpecialChar  = { fg = p.bright_red },
  Delimiter    = { fg = p.white },
  Tag          = { fg = p.bright_magenta },
  Debug        = { fg = p.bright_red },
  Underlined   = { fg = p.bright_blue, underline = true },
  Error        = { fg = p.bright_red },
  Todo         = { fg = p.black, bg = p.yellow, bold = true },

  -- 診断
  DiagnosticError = { fg = p.bright_red },
  DiagnosticWarn  = { fg = p.bright_yellow },
  DiagnosticInfo  = { fg = p.bright_cyan },
  DiagnosticHint  = { fg = p.bright_green },
  DiagnosticOk    = { fg = p.bright_green },
  DiagnosticUnderlineError = { sp = p.bright_red, undercurl = true },
  DiagnosticUnderlineWarn  = { sp = p.bright_yellow, undercurl = true },
  DiagnosticUnderlineInfo  = { sp = p.bright_cyan, undercurl = true },
  DiagnosticUnderlineHint  = { sp = p.bright_green, undercurl = true },

  -- diff / git
  DiffAdd      = { bg = "#0F2A0F" },
  DiffChange   = { bg = "#1C1C1C" },
  DiffDelete   = { fg = p.bright_red, bg = "#2A0F0F" },
  DiffText     = { bg = "#14401A" },
  Added        = { fg = p.bright_green },
  Removed      = { fg = p.bright_red },
  Changed      = { fg = p.bright_yellow },

  -- Treesitter
  ["@variable"]         = { fg = p.white },
  ["@variable.builtin"] = { fg = p.bright_red },
  ["@variable.parameter"] = { fg = p.bright_white },
  ["@variable.member"]  = { fg = p.cyan },
  ["@property"]         = { fg = p.cyan },
  ["@field"]            = { fg = p.cyan },
  ["@constant"]         = { fg = p.yellow },
  ["@constant.builtin"] = { fg = p.bright_yellow },
  ["@constant.macro"]   = { fg = p.cyan },
  ["@module"]           = { fg = p.bright_cyan },
  ["@string"]           = { fg = p.green },
  ["@string.escape"]    = { fg = p.bright_red },
  ["@string.special"]   = { fg = p.bright_red },
  ["@character"]        = { fg = p.green },
  ["@number"]           = { fg = p.yellow },
  ["@boolean"]          = { fg = p.bright_yellow },
  ["@float"]            = { fg = p.yellow },
  ["@function"]         = { fg = p.bright_blue },
  ["@function.builtin"] = { fg = p.cyan },
  ["@function.call"]    = { fg = p.bright_blue },
  ["@function.macro"]   = { fg = p.cyan },
  ["@constructor"]      = { fg = p.bright_cyan },
  ["@keyword"]          = { fg = p.bright_magenta },
  ["@keyword.function"] = { fg = p.bright_magenta },
  ["@keyword.operator"] = { fg = p.bright_magenta },
  ["@keyword.return"]   = { fg = p.bright_magenta },
  ["@operator"]         = { fg = p.bright_white },
  ["@punctuation.delimiter"] = { fg = p.white },
  ["@punctuation.bracket"]   = { fg = p.white },
  ["@punctuation.special"]   = { fg = p.bright_red },
  ["@comment"]          = { fg = p.bright_black, italic = true },
  ["@type"]             = { fg = p.bright_cyan },
  ["@type.builtin"]     = { fg = p.bright_cyan },
  ["@type.definition"]  = { fg = p.bright_cyan },
  ["@attribute"]        = { fg = p.cyan },
  ["@tag"]              = { fg = p.bright_magenta },
  ["@tag.attribute"]    = { fg = p.cyan },
  ["@tag.delimiter"]    = { fg = p.white },
  ["@markup.heading"]   = { fg = p.bright_green, bold = true },
  ["@markup.link"]      = { fg = p.bright_blue, underline = true },
  ["@markup.raw"]       = { fg = p.green },
  ["@markup.list"]      = { fg = p.bright_magenta },
  ["@markup.strong"]    = { bold = true },
  ["@markup.italic"]    = { italic = true },
  ["@diff.plus"]        = { fg = p.bright_green },
  ["@diff.minus"]       = { fg = p.bright_red },

  -- LSP
  LspReferenceText  = { bg = p.bg2 },
  LspReferenceRead  = { bg = p.bg2 },
  LspReferenceWrite = { bg = p.bg2 },
  LspInlayHint      = { fg = p.bright_black, bg = p.bg1 },
  LspSignatureActiveParameter = { fg = p.bright_yellow, bold = true },

  -- Telescope
  TelescopeNormal        = { fg = p.white, bg = p.bg1 },
  TelescopeBorder        = { fg = p.bg3, bg = p.bg1 },
  TelescopeSelection     = { bg = p.bg2 },
  TelescopeSelectionCaret = { fg = p.bright_yellow },
  TelescopeMatching      = { fg = p.bright_yellow, bold = true },
  TelescopePromptTitle   = { fg = p.black, bg = p.bright_blue, bold = true },
  TelescopeResultsTitle  = { fg = p.black, bg = p.bright_green, bold = true },
  TelescopePreviewTitle  = { fg = p.black, bg = p.bright_magenta, bold = true },
}

for group, spec in pairs(groups) do
  vim.api.nvim_set_hl(0, group, spec)
end

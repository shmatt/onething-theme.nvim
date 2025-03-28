--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

local colours = require('lush_theme.onething-colours')

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn    { bg = colours.gray_1 }, -- Columns set with 'colorcolumn'
    Conceal        { bg = colours.black, fg = colours.accent }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor         { bg = hsl("#aeaeae"), fg = colours.black }, -- Character under the cursor
    -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    lCursor        { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     { bg = colours.gray_2 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { bg = colours.black, fg = colours.accent }, -- Directory names (and other special names in listings)
    DiffAdd        { bg = colours.warning.mix(colours.black, 75), fg = colours.warning }, -- Diff mode: Added line |diff.txt|
    DiffChange     { bg = colours.gray, fg = colours.gray_15 }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     { bg = colours.error.mix(colours.black, 50), fg = colours.error }, -- Diff mode: Deleted line |diff.txt|
    DiffText       { bg = colours.gray, fg = colours.white }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer    { bg = colours.black, fg = colours.gray_2 }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg       { bg = colours.error, fg = colours.white }, -- Error messages on the command line
    VertSplit      { bg = colours.black, fg = colours.border }, -- Column separating vertically split windows
    Substitute     { bg = colours.gray_3, fg = colours.white }, -- |:substitute| replacement text highlighting
    LineNr         { bg = colours.black, fg = colours.gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg = colours.gray_15 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    Folded         { bg = colours.gray_2, fg = colours.accent }, -- Line used for closed folds
    FoldColumn     { Folded }, -- 'foldcolumn'
    SignColumn     { bg = colours.black, fg = colours.white }, -- Column where |signs| are displayed
    IncSearch      { bg = colours.gray, fg = colours.white }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CursorLineFold { FoldColumn }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign { CursorLineNr }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen     { bg = colours.black, fg = hsl("#cd8a4c"), gui = "bold" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea        { bg = colours.black, fg = colours.white }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { bg = colours.black, fg = colours.accent }, -- |more-prompt|
    NonText        { bg = colours.black, fg = colours.gray_2 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal         { bg = colours.black, fg = colours.white }, -- Normal text
    NormalFloat    { link = Normal }, -- Normal text in floating windows.
    FloatBorder    { bg = colours.black, fg = colours.border }, -- Border of floating windows.
    FloatTitle     { bg = colours.black, fg = colours.accent, gui = "bold" }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    Pmenu          { bg = colours.gray_2, fg = colours.white }, -- Popup menu: Normal item.
    PmenuSel       { Pmenu, fg = colours.accent }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    Question       { bg = colours.black, fg = colours.accent }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine   { bg = colours.accent, fg = colours.black }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { bg = colours.gray, fg = colours.white }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey     { bg = colours.black, fg = colours.gray}, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- StatusLine     { }, -- Status line of current window
    -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    Title          { bg = colours.black, fg = colours.accent, gui = "bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { bg = colours.gray, fg = colours.black }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { bg = colours.black, fg = colours.error }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu       { bg = colours.accent, fg = colours.black }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Obsidian specific highlights
    HashTag { bg = colours.accent, fg = colours.white, gui = "bold" },
    ObsidianTag { bg = colours.accent, fg = colours.white, gui = "bold" },
    ObsidianHighlightText { bg = colours.gray_3, fg = colours.white },
    HighlightText { bg = colours.gray_3, fg = colours.white },
    ObsidianRefText { gui = "underline" },

    -- Notifications
    NotifyBackground { bg = colours.gray_1, fg = colours.white },
    NotifyERRORBorder { bg = colours.black, fg = colours.error },
    NotifyWARNBorder { bg = colours.black, fg = colours.warning },
    NotifyINFOBorder { bg = colours.black, fg = colours.gray_15 },
    NotifyDEBUGBorder { bg = colours.black, fg = colours.gray_10 },
    NotifyTRACEBorder { bg = colours.black, fg = colours.gray },
    NotifyERRORIcon { bg = colours.black, fg = colours.error },
    NotifyWARNIcon { bg = colours.black, fg = colours.warning },
    NotifyINFOIcon { bg = colours.black, fg = colours.gray_15 },
    NotifyDEBUGIcon { bg = colours.black, fg = colours.gray_10 },
    NotifyTRACEIcon { bg = colours.black, fg = colours.gray },
    NotifyERRORTitle { bg = colours.black, fg = colours.error, gui = "bold" },
    NotifyWARNTitle { bg = colours.black, fg = colours.warning, gui = "bold" },
    NotifyINFOTitle { bg = colours.black, fg = colours.gray_15, gui = "bold" },
    NotifyDEBUGTitle { bg = colours.black, fg = colours.gray_10, gui = "bold" },

		-- DAP signs
		DapBreakpoint { bg = colours.black, fg = colours.warning },
		DapBreakpointCondition { bg = colours.black, fg = colours.warning },
		DapStopped { bg = colours.black, fg = colours.error },
		DapLogPoint { bg = colours.black, fg = colours.accent },
		DapBreakpointRejected { bg = colours.black, fg = colours.gray_15 },
    
    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { bg = colours.black, fg = colours.gray }, -- Any comment

    Constant       { bg = colours.black, fg = colours.white }, -- (*) Any constant
    String         { bg = colours.black, fg = colours.white }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier     { bg = colours.black, fg = colours.white, gui = "bold" }, -- (*) Any variable name
    Function       { bg = colours.black, fg = colours.white, gui = "" }, --   Function name (also: methods for classes)

    Statement      { bg = colours.black, fg = colours.accent }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    Operator       { bg = colours.black, fg = colours.accent, gui = "bold" }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc        { bg = colours.black, fg = colours.gray }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { bg = colours.black, fg = colours.white }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { bg = colours.black, fg = colours.accent }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter      { bg = colours.black, fg = hsl("#cd8a4c") }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { bg = colours.black, fg = colours.accent, gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { bg = colours.error, fg = colours.black }, -- Any erroneous construct
    Todo           { bg = colours.accent, fg = colours.black }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { bg = colours.black, fg = colours.error } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { bg = colours.black, fg = colours.warning } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { bg = colours.black, fg = colours.gray_15 } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { bg = colours.black, fg = colours.gray } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { bg = colours.black, fg = colours.white } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    sym"@string"            { bg = colours.black, fg = colours.white }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    sym"@function"          { bg = colours.black, fg = colours.white, gui = "" }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    sym"@method"            { bg = colours.black, fg = colours.white, gui = ""  }, -- Function
    -- sym"@field"             { }, -- Identifier
    sym"@property"          { bg = colours.black, fg = colours.white, gui = ""  }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    sym"@variable"          { bg = colours.black, fg = colours.white, gui = "bold" }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
    
    -- Some obsidian / markdown specific highlights
    -- sym"@atx_heading"       { bg = colours.black, fg = colours.grey },
    -- sym"@setext_heading"       { bg = colours.black, fg = colours.grey },
    -- sym"@heading_content"   { bg = colours.black, fg = colours.accent, gui = "bold" },
    -- sym"@strong_emphasis"   { bg = colours.black, fg = colours.white, gui = "bold" },
    -- sym"@emphasis_delimiter"{ bg = colours.black, fg = colours.grey, gui = "bold" },
    sym"@link"              { bg = colours.black, fg = colours.accent, gui = "underline" },
    sym"@markup.heading"    { bg = colours.black, fg = colours.accent, gui = "bold" },
    sym"@markup.heading.1.marker" { bg = colours.black, fg = colours.gray, gui = "regular" },
    sym"@markup.heading.2.marker" { bg = colours.black, fg = colours.gray, gui = "regular" },
    sym"@markup.heading.3.marker" { bg = colours.black, fg = colours.gray, gui = "regular" },
    sym"@markup.heading.4.marker" { bg = colours.black, fg = colours.gray, gui = "regular" },
    sym"@markup.heading.5.marker" { bg = colours.black, fg = colours.gray, gui = "regular" },
    sym"@markup.heading.6.marker" { bg = colours.black, fg = colours.gray, gui = "regular" },
    sym"@markup.italic"     { bg = colours.black, fg = colours.white, gui = "italic" },
    sym"@markup.emphasis"   { bg = colours.black, fg = colours.white, gui = "italic" },
    sym"@markup.bold"       { bg = colours.black, fg = colours.white, gui = "bold" },
    sym"@markup.strong"     { bg = colours.black, fg = colours.white, gui = "bold" },
    sym"@markup.underline"  { bg = colours.black, fg = colours.accent, gui = "underline" },
    sym"@markup.strikethrough" { bg = colours.black, fg = colours.accent, gui = "strikethrough" },

  }
end)

    
-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap

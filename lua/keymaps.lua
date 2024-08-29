-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Clear highlights on search when pressing <Esc> in normal mode
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- leader based versions (test this difference)
-- vim.keymap.set('n', '<leader>h', '<C-w>h', {desc = 'window left'}) -- note that this overwrites git hunk
-- vim.keymap.set('n', '<leader>j', '<C-w>j', {desc = 'window down'})
-- vim.keymap.set('n', '<leader>k', '<C-w>k', {desc = 'window up'})
-- vim.keymap.set('n', '<leader>l', '<C-w>l', {desc = 'window left'})
-- pane spliting
vim.keymap.set("n", "<leader>|", "<cmd>vs<CR>", { desc = "vertical split" })
vim.keymap.set("n", "<leader>-", "<cmd>sp<CR>", { desc = "horizontal split" })

-- save and send full buffer path to the clipboard
vim.keymap.set("n", "<leader>yp", "<cmd>w<CR><cmd>!echo %:p|pbcopy<CR><CR>", { desc = "[Y]ank current buffer [p]ath" })
-- save and send rtf version of the buffer to the clipboard
vim.keymap.set(
	"n",
	"<leader>yrtf",
	"<cmd>w<CR><cmd>!pandoc --standalone --to=rtf --output=- % |pbcopy<CR><CR>",
	{ desc = "[Y]ank current buffer in [rtf]" }
)
-- save and send pdf version of the buffer to the clipboard
vim.keymap.set(
	"n",
	"<leader>yht",
	"<cmd>w<CR><cmd>!pandoc --standalone --to=html --output=- % |pbcopy<CR><CR>",
	{ desc = "[Y]ank current buffer in [ht]ml" }
)

-- Neo tree keymaps
vim.keymap.set("n", "<leader>tr", "<cmd>Neotree reveal<CR>")
vim.keymap.set("n", "<leader>gss", "<cmd>Neotree float git_status<CR>")

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vim: ts=2 sts=2 sw=2 et

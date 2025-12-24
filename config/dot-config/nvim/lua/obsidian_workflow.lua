--------------
-- obsidian --
--------------
--
-- >>> oo # from shell, navigate to vault (optional)
--
-- # NEW NOTE
-- >>> on "Note Name" # call my "obsidian new note" shell script (~/bin/on)
-- >>>
-- >>> ))) <leader>on # inside vim now, format note as template
-- >>> ))) # add tag, e.g. fact / blog / video / etc..
-- >>> ))) # add hubs, e.g. [[python]], [[machine-learning]], etc...
-- >>> ))) <leader>of # format title
--
-- # END OF DAY/WEEK REVIEW
-- >>> or # review notes in inbox
-- >>>
-- >>> ))) <leader>ok # inside vim now, move to zettelkasten
-- >>> ))) <leader>odd # or delete
-- >>>
-- >>> og # organize saved notes from zettelkasten into notes/[tag] folders
-- >>> ou # sync local with Remote
--
local obsidian_vault = os.getenv("OBSIDIAN_VAULT")
local obsidian_notes = obsidian_vault .. "/Notes"
local obsidian_zettelkasten = obsidian_vault .. "/Zettelkasten"

-- navigate to vault
vim.keymap.set("n", "<leader>oo", string.format(":cd %s<cr>", obsidian_vault))

-- search for files in full vault
vim.keymap.set("n", "<leader>os", string.format(':Telescope find_files search_dirs={"%s"}<cr>', obsidian_vault))
vim.keymap.set("n", "<leader>oz", string.format(':Telescope live_grep search_dirs={"%s"}<cr>', obsidian_vault))

-- move file in current buffer to zettelkasten folder
vim.keymap.set("n", "<leader>ok", string.format(":!mv '%%:p' %s<cr>:bd<cr>", obsidian_zettelkasten))

-- delete file in current buffer
vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")

-- convert note to template and remove leading white space
vim.keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")

-- strip date from note title and replace dashes with spaces
-- must have cursor on title
vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")

-- checkboxes
vim.keymap.set("n", "<leader>ty", [[:s/\[\s\]/[x]/<cr>]], { silent = true })
vim.keymap.set("n", "<leader>tu", [[:s/\[x\]/[ ]/<cr>]], { silent = true })

source ~/.config/nvim/vim-plug/plugins.vim

lua require'nvim-tree'.setup()
lua require'presence'.setup({auto_update = true, neovim_image_text = "But Mr Krabs, he was #1", enable_line_number = true,})
lua require'lspconfig'.pylsp.setup{}
lua require'lualine'.setup()
lua require'modicator'.setup()
lua require'neoscroll'.setup()


set relativenumber

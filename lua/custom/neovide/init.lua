if vim.g.neovide then
  -- Helper to set GUI font
  vim.o.guifont = 'FiraMono Nerd Font:h14'

  -- Neovide specific settings
  vim.g.neovide_highlight_matching_pair = true
  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
end

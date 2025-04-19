return {
	"3rd/image.nvim",
	build = false,
	opts = {
		processor = "magick_cli",
	},
	config = function()
		require("image").setup({
			backend = "kitty",
			processor = "magick_rock", -- or "magick_cli"
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					floating_windows = false, -- if true, images will be rendered in floating markdown windows
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
					resolve_image_path = function(document_path, image_path, fallback)
						local obs = require("obsidian").get_client()
						local vault_root = obs:vault_root().filename

						-- If we're in a vault, try using vault behavior
						if document_path:find(vault_root, 1, 1) then
							local obs_rel = obs:vault_relative_path(image_path)

							if obs_rel and vim.fn.filereadable(vault_root .. "/" .. obs_rel.filename) == 1 then
								return vault_root .. "/" .. obs_rel.filename
							end
						end

						return fallback(document_path, image_path)
					end,
				},
				neorg = {
					enabled = true,
					filetypes = { "norg" },
				},
				typst = {
					enabled = true,
					filetypes = { "typst" },
				},
				html = {
					enabled = false,
				},
				css = {
					enabled = false,
				},
			},
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
		})
	end,
}

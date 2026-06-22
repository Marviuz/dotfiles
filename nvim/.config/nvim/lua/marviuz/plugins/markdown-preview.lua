return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
    -- `Lazy build markdown-preview.nvim`
		vim.fn["mkdp#util#install"]()
	end,
}

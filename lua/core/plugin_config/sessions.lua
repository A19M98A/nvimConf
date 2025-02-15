

require("auto-session").setup({
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    session_lens = {
        buftype_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
    },
    vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, {
        noremap = true,
        }),
})

return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },

    config = function()
      local telescope = require("telescope")
      local lga_actions = require("telescope-live-grep-args.actions")

      telescope.setup({
        defaults = {
          -- File patterns added to the ".gitignore" list:
          file_ignore_patterns = { "dist/.*", },
        },

        extensions = {
          live_grep_args = {
            mappings = {
              i = {
                -- Surround the query with quotes:
                ["<c-k>"] = lga_actions.quote_prompt(),
                -- Require all matches to be surrounded by boundaries:
                ["<c-o>"] = lga_actions.quote_prompt({ postfix = " -w" }),
                -- Exclude file/directory patterns from the search:
                ["<c-e>"] = lga_actions.quote_prompt({ postfix = " -g !" }),
                -- Specify a global pattern where to search:
                ["<c-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              },
            },
          },
        },
      })

      telescope.load_extension("live_grep_args")
    end,

    keys = {
      {
        "<leader>sf",
        function()
          -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
          require("telescope").extensions.live_grep_args.live_grep_args()
          -- Uses ripgrep args (rg) for live_grep
          -- Common Examples:
          -- -i "Data"  # Case insensitive
          -- -g "!*.md" # Ignore md files
          -- -w         # Whole word
          -- -e         # Regex
        end,
        desc = "Live Grep (Args)",
      },
    },
  },
}

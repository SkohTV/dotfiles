local config = function()
  -- Setup
  local harpoon = require("harpoon")
  harpoon:setup()
  local conf = require("telescope.config").values

  -- Define function for later use
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end
    require("telescope.pickers")
      .new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      })
      :find()
  end

  -- Append / remove / show keymaps
  vim.keymap.set("n", "<leader>a", function()
    harpoon:list():append()
  end)
  vim.keymap.set("n", "<leader>x", function()
    harpoon:list():remove()
  end)
  vim.keymap.set("n", "<C-e>", function()
    toggle_telescope(harpoon:list())
  end)

  -- Goto keymaps
  vim.keymap.set("n", "<C-h>", function()
    harpoon:list():select(1)
  end)
  vim.keymap.set("n", "<C-t>", function()
    harpoon:list():select(2)
  end)
  vim.keymap.set("n", "<C-n>", function()
    harpoon:list():select(3)
  end)
  vim.keymap.set("n", "<C-s>", function()
    harpoon:list():select(4)
  end)
end

return {{
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}}

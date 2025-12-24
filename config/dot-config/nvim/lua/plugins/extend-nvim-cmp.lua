return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Override specific keymaps
    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end, { "i", "s" })

    opts.mapping["<CR>"] = function(fallback)
      fallback() -- Make Enter just create new lines
    end

    return opts
  end,
}

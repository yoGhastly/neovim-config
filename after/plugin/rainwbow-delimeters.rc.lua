-- https://github.com/HiPhish/rainbow-delimiters.nvim
local M = {}

local extension_name = "rainbow_delimiters_nvim"

function M.config()
  require("utils.setup").define_extension(extension_name, true, {
    plugin = function()
      return {
        "HiPhish/rainbow-delimiters.nvim",
        event = "BufReadPost",
      }
    end,
    setup = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      return {
        -- Which query to use for finding delimiters
        query = {
          [""] = "rainbow-delimiters",
        },
        -- Highlight the entire buffer all at once
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        highlight = {
          "TSRainbow1",
          "TSRainbow2",
          "TSRainbow3",
          "TSRainbow4",
        },
      }
    end,
    on_setup = function(config)
      require("rainbow-delimiters.setup").setup(config.setup)
    end,
  })
end

return M

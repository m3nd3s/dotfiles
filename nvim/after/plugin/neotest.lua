require("neotest").setup({
  adapters = {
    require("neotest-rspec")({
      rspec_cmd = function()
        return vim.tbl_flatten({
          "docker",
          "compose",
          "exec",
          "-i",
          "-e", "RAILS_ENV=test",
          "app",
          "bundle",
          "exec",
          "rspec"
        })
      end,

      transform_spec_path = function(path)
        local prefix = require('neotest-rspec').root(path)
        return string.sub(path, string.len(prefix) + 2, -1)
      end,

      results_path = "rspec.output",
      formatter = "json"
    })
  }
})

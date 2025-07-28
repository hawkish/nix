{ lib, pkgs, ... }:
{
  extraConfigLuaPre = # Lua
    ''
      local root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})

      -- Ensure JDTLS cache directories exist
      local cache_dir = vim.fn.stdpath('cache') .. '/jdtls/' .. vim.fn.fnamemodify(root_dir, ':t')
      local config_dir = cache_dir .. '/config'
      local workspace_dir = cache_dir .. '/workspace'

      vim.fn.mkdir(config_dir, 'p')
      vim.fn.mkdir(workspace_dir, 'p')
    '';

  plugins.jdtls = {
    enable = true;
    settings = {
      cmd = [
        {
          __raw = "'${lib.getExe pkgs.jdt-language-server}'";
        }
        {
          __raw = "string.format('--jvm-arg=-javaagent:%s', '${pkgs.lombok}/share/java/lombok.jar')";
        }
        {
          __raw = "'-configuration ' .. vim.fn.stdpath('cache') .. '/jdtls/' .. vim.fn.fnamemodify(root_dir, ':t') .. '/config'";
        }
        {
          __raw = "'-data ' .. vim.fn.stdpath('cache') .. '/jdtls/' .. vim.fn.fnamemodify(root_dir, ':t') .. '/workspace')";
        }
      ];
      root_dir = {
        __raw = "root_dir";
      };
    };
  };
}

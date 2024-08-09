-- document existing key chains
local wk = require("which-key")
wk.add({
  { '<leader>a', desc = '[A]ctions',              group = 'actions' },
  { '<leader>b', desc = '[B]uffers',              group = 'buffers' },
  { '<leader>c', desc = '[C]ChatGPT',             group = 'chatgpt' },
  { '<leader>d', desc = '[D]ocument',             group = 'document' },
  { '<leader>e', desc = '[E]xecute Job Runner',   group = 'execute' },
  { '<leader>f', desc = '[F]iles',                group = 'files' },
  { '<leader>g', desc = '[G]it',                  group = 'git' },
  { '<leader>h', desc = '[H]unk',                 group = 'hunk' },
  { '<leader>l', desc = '[L]sp',                  group = 'lsp' },
  { '<leader>n', desc = '[N]oice',                group = 'noise' },
  { '<leader>q', desc = '[Q]uit',                 group = 'quit' },
  { '<leader>r', desc = '[R]efactor',             group = 'refactor' },
  { '<leader>s', desc = '[S]earch',               group = 'search' },
  { '<leader>t', desc = '[T]oggle',               group = 'toggle' },
  { '<leader>u', desc = '[U]p' },
  { '<leader>v', desc = '[V]iew Debugger',        group = 'debugger' },
  { '<leader>y', desc = '[Y]ank',                 group = 'yank' },
  { '<leader>w', desc = '[W]indow & [W]orkspace', group = 'window' },
})

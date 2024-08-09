require("chatgpt").setup {
  api_key_cmd = os.getenv "OPENAI_API_KEY",
  openai_params = {
    model = "gpt-3.5-turbo",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 4095,
    temperature = 0.2,
    top_p = 0.1,
    n = 1,
  },
  actions_paths = { "~/.config/nvim/actions.json" },
  predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/cemmektup/awesome-chatgpt-prompts/main/prompts.csv",
}

-- Leader c
local set = vim.keymap.set
set("n", "<leader>cc", "<cmd>ChatGPT<CR>", { silent = true, noremap = true, desc = "ChatCPT" })
set(
  { "n", "v" },
  "<leader>ce",
  "<cmd>ChatGPTEditWithInstruction<CR>",
  { silent = true, noremap = true, desc = "Edit with instruction" }
)
set(
  { "n", "v" },
  "<leader>cg",
  "<cmd>ChatGPTRun grammar_correction<CR>",
  { silent = true, noremap = true, desc = "Grammar Correction" }
)
-- set({ "n", "v" }, "<leader>ct", "<cmd>ChatGPTRun translate<CR>", { silent = true, noremap = true, desc = "Translate" })
set(
  { "n", "v" },
  "<leader>ct",
  "<cmd>ChatGPTRun translateDE<CR>",
  { silent = true, noremap = true, desc = "Translate" }
)
-- set({ "n", "v" }, "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", { silent = true, noremap = true, desc = "Keywords" })
set({ "n", "v" }, "<leader>ck", "<cmd>ChatGPTRun keywordsDE<CR>", { silent = true, noremap = true, desc = "Keywords" })
-- set({ "n", "v" }, "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", { silent = true, noremap = true, desc = "Docstring" })
set(
  { "n", "v" },
  "<leader>cd",
  "<cmd>ChatGPTRun docstringDE<CR>",
  { silent = true, noremap = true, desc = "Docstring" }
)
set({ "n", "v" }, "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", { silent = true, noremap = true, desc = "Add Tests" })
set(
  { "n", "v" },
  "<leader>cO",
  "<cmd>ChatGPTRun optimize_code<CR>",
  { silent = true, noremap = true, desc = "Optimize Code" }
)
set(
  { "n", "v" },
  "<leader>co",
  "<cmd>ChatGPTRun optimize_codeSym<CR>",
  { silent = true, noremap = true, desc = "Optimize Code" }
)
-- set({ "n", "v" }, "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", { silent = true, noremap = true, desc = "Summarize" })
set(
  { "n", "v" },
  "<leader>cs",
  "<cmd>ChatGPTRun summarizeDE<CR>",
  { silent = true, noremap = true, desc = "Summarize" }
)
set({ "n", "v" }, "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", { silent = true, noremap = true, desc = "Fix Bugs" })
-- set({ "n", "v" }, "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>",
--   { silent = true, noremap = true, desc = "Explain Code" })
set(
  { "n", "v" },
  "<leader>cx",
  "<cmd>ChatGPTRun explain_codeDE<CR>",
  { silent = true, noremap = true, desc = "Explain Code" }
)
set(
  { "n", "v" },
  "<leader>cr",
  "<cmd>ChatGPTRun roxygen_edit<CR>",
  { silent = true, noremap = true, desc = "Roxygen Edit" }
)
set(
  { "n", "v" },
  "<leader>cl",
  "<cmd>ChatGPTRun code_readability_analysis<CR>",
  { silent = true, noremap = true, desc = "Code Readability Analysis" }
)

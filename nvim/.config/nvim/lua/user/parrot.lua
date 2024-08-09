require("parrot").setup {
  -- Providers must be explicitly added to make them available.
  providers = {
    pplx = {
      api_key = os.getenv "PERPLEXITY_API_KEY",
    },
    openai = {
      api_key = os.getenv "OPENAI_API_KEY",
    },
    anthropic = {
      api_key = os.getenv "ANTHROPIC_API_KEY",
    },
    mistral = {
      api_key = os.getenv "MISTRAL_API_KEY",
    },
    gemini = {
      api_key = os.getenv "GEMINI_API_KEY",
    },
    ollama = {} -- provide an empty list to make provider available
  },
  hooks = {
    CommitMsg = function(prt, params)
      local futils = require "parrot.file_utils"
      if futils.find_git_root() == "" then
        prt.logger.warning "Not in a git repository"
        return
      else
        local template = [[
        Ich möchte, dass Sie als Generator für eine Commit-Nachricht fungieren.
        Ich werde Sie mit Informationen über die Aufgabe und das Präfix für
        den Aufgabencode, und ich möchte, dass Sie eine entsprechende Commit-Nachricht
        im konventionellen Commit-Format. Schreiben Sie keine Erklärungen oder
        andere Worte, sondern antworten Sie nur mit der Commit-Nachricht.
        Fangen Sie mit folgendem gefolgt von Leerzeichen an: ]] ..
            vim.fn.system "git rev-parse --abbrev-ref HEAD | sed 's/\\(^[A-Za-z0-9]*-[0-9]*\\).*/\\1/'" .. [[
        und fügen Sie dann die Erklärungen hinzu. Beginnen Sie mit einer kurzen
        Überschrift als Zusammenfassung und listen Sie dann die einzelnen Änderungen
        im Detail auf.


        Hier sind die Änderungen, die in dieser Nachricht berücksichtigt werden sollten:
	]] .. vim.fn.system "git diff --no-color --no-ext-diff --staged"
        local agent = prt.get_command_agent()
        prt.Prompt(params, prt.ui.Target.append, agent, nil, template)
      end
    end,
    CompleteViaComment = function(prt, params)
      local template = [[
        Ich habe den folgenden Code von {{filename}}:

        ```{{filetype}}
        {{filecontent}}
        ```
        und habe die Aufgabe als folgenden Kommentar hinzugefügt:

        ```{{filetype}}
        {{selection}}
        ```

        Bitte beenden Sie den obigen Code sorgfältig und logisch.
        Antworten Sie nur mit dem Codeschnipsel, der eingefügt werden soll."
        ]]
      local agent = prt.get_command_agent()
      prt.Prompt(params, prt.ui.Target.append, agent, nil, template)
    end,
    CompleteViaPrompt = function(prt, params)
      local template = [[
        Ich habe den folgenden Code von {{filename}}:

        ```{{filetype}}
        {{filecontent}}
        ```
        und habe die Aufgabe als folgenden Kommentar hinzugefügt:

        ```{{filetype}}
        {{selection}}
        ```

        Bitte beenden Sie den obigen Code sorgfältig und logisch.
        Antworten Sie nur mit dem Codeschnipsel, der eingefügt werden soll.
        Ich habe die Aufgabe:"
        ]]
      prt.cmd.ChatNew(params, template)
    end,
    Complete = function(prt, params)
      local template = [[
        Ich habe den folgenden Code von {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Bitte beenden Sie den obigen Code sorgfältig und logisch.
        Antworten Sie nur mit dem Codeschnipsel, der eingefügt werden soll."
        ]]
      local agent = prt.get_command_agent()
      prt.Prompt(params, prt.ui.Target.append, agent, nil, template)
    end,
    FixBugs = function(prt, params)
      local template = [[
        You are an expert in {{filetype}}.
        Fix bugs in the below code from {{filename}} carefully and logically:
        Your task is to analyze the provided {{filetype}} code snippet, identify
        any bugs or errors present, and provide a corrected version of the code
        that resolves these issues. Explain the problems you found in the
        original code and how your fixes address them. The corrected code should
        be functional, efficient, and adhere to best practices in
        {{filetype}} programming.

        ```{{filetype}}
        {{selection}}
        ```

        Fixed code:
        ]]
      local agent = prt.get_command_agent()
      prt.logger.info("Fixing bugs in selection with agent: " .. agent.name)
      prt.Prompt(params, prt.ui.Target.new, agent, nil, template)
    end,
    OptimizeCode = function(prt, params)
      local template = [[
        Sie sind ein Experte für {{filetype}}.
        Ihre Aufgabe ist es, den zur Verfügung gestellten {{filetype}} Codeausschnitt
        zu analysieren und Verbesserungen vorzuschlagen, um seine Leistung zu optimieren.
        Identifizieren Sie Bereiche wo der Code effizienter, schneller oder
        weniger ressourcenintensiv gestaltet werden ressourcenintensiv ist.
        Machen Sie konkrete Vorschläge zur Optimierung, zusammen mit Erklärungen,
        wie diese Änderungen die Leistung des Codes verbessern Leistung verbessern.
        Der optimierte Code sollte die gleiche Funktionalität aufweisen wie der
        ursprüngliche Code beibehalten und gleichzeitig eine verbesserte Effizienz
        aufweisen.

        ```{{filetype}}
        {{selection}}
        ```

        Optimized code:
        ]]
      local agent = prt.get_command_agent()
      prt.logger.info("Optimizing selection with agent: " .. agent.name)
      prt.Prompt(params, prt.ui.Target.new, agent, nil, template)
    end,
    Docstring = function(prt, params)
      local template = [[

        Ein ausgeklügelter, hochwertiger Docstring für die folgende Funktion:
        # Schreiben eines guten Docstrings, in der Sprache Deutsch
        Dies ist ein Beispiel für das Schreiben eines wirklich guten Docstrings, der den besten Praktiken für die jeweilige Sprache folgt. Es wird darauf geachtet, dass Dinge wie
        * Parameter- und Rückgabetypen (falls zutreffend)
        * alle Fehler, die je nach Sprache ausgelöst oder zurückgegeben werden könnten, ausführlich beschrieben werden\

        Ich habe den folgenden Code erhalten:

        ```{{filetype}}
        {{selection}}
        ```

        Der Code mit einem wirklich guten docstring hinzugefügt ist unten:
        `{{filetype}}"

        Antworten Sie nur mit dem Codeschnipsel, der eingefügt werden soll."
        ]]
      local agent = prt.get_command_agent()
      prt.Prompt(params, prt.ui.Target.before, agent, nil, template)
    end,
  },
}

vim.cmd [[
 PrtProvider openai
 PrtAgent CodeGPT4o
]]

local set = vim.keymap.set

set({ "i" }, "<C-g>g", "<cmd>PrtCommitMsg<CR>",
  { silent = true, noremap = true, desc = "Generate Commit Messages" })
set({ "n" }, "<leader>c.",
  function()
    vim.cmd "Copilot disable"
  end,
  { silent = true, noremap = true, desc = "Copilot disable" })

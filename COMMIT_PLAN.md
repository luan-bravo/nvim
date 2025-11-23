# Commit Plan

Here is a plan for breaking down the recent changes into logical commits.

## How to Use This Plan

For each of the commits outlined below, you'll do the following:

1.  Run `git add -p`.
2.  Git will show you each hunk of changes.
3.  For each hunk, ask yourself: "Does this change belong to the commit I'm currently building (e.g., **Refactor: Core Configuration and Initialization**)?".
    *   If **yes**, type `y`.
    *   If **no**, type `n`.
    *   If a hunk contains changes for *multiple* commits, type `s` to split it into smaller hunks. Then decide for each smaller hunk.
    *   If you're not sure, you can use `?` to see all the options.
4.  Once you've gone through all the changes and staged only the ones for your current commit, run `git commit -m "Your commit message"`.
5.  Repeat for the next commit in the plan.

---

## Proposed Commits

### 1. Refactor: Core Configuration and Initialization

*   **Files:** `init.lua`, `options.lua`, `autocmd.lua`, `functions.lua`
*   **Changes:**
    *   Introduce `PRequire` for safer module loading.
    *   Move `mapleader` to a new `globals.lua` file.
    *   General cleanup and refactoring of core configuration files.

### 2. Feat: Enhanced Clipboard and File Operations

*   **Files:** `clipboard.lua`, `files_and_buffers.lua`
*   **Changes:**
    *   Update `clipboard.lua` for better `wl-clipboard` and `cliphist` integration.
    *   Improve file and buffer keymaps in `files_and_buffers.lua` to include checks for read-only files.

### 3. Refactor: Keymap Organization and Cleanup

*   **Files:** `basics_and_moves.lua`, `clipboard.lua`, `files_and_buffers.lua`, `formatting.lua`, `functions.lua`, `misc.lua`
*   **Changes:**
    *   Consolidate and clean up keymaps for better organization and readability.

### 4. Feat: Improved Formatting and Indentation Control

*   **Files:** `formatting.lua`, `tabstop.lua`
*   **Changes:**
    *   Add new formatting commands.
    *   Introduce `tabstop.lua` for dynamic management of tab sizes.

### 5. Feat: Enhanced Telescope Configuration

*   **Files:** `telescope.lua`
*   **Changes:**
    *   Complete overhaul of the Telescope configuration with new keymaps and a more structured layout.

### 6. Feat: LSP and Treesitter Enhancements

*   **Files:** `lsp.lua`, `treesitter.lua`
*   **Changes:**
    *   Update LSP configurations for new language servers.
    *   Update Treesitter parsers.

### 7. Feat: DAP and Neotest Improvements

*   **Files:** `dap.lua`, `neotest.lua`
*   **Changes:**
    *   Updates to the DAP and Neotest configurations.

### 8. Refactor: Plugin Configuration and Cleanup

*   **Files:** All files in `lua/lul/plugins/`
*   **Changes:**
    *   Remove unused plugin configurations (`avante.lua`, `noice.lua`, `obsidian.lua`).
    *   Update and clean up the configurations for the remaining plugins.

### 9. Docs: Update README with TODOS

*   **Files:** `README.md`
*   **Changes:**
    *   Add a new `TODOS` section to the `README.md` file.

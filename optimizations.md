# Neovim performance optimization specification

## Goal and assessment

Performance improvements appear possible without changing editing behavior, primarily by avoiding shell processes and loading command-driven features only when needed. This is a developer implementation plan, not an applied configuration change.

Preserve all mappings (including modes, counts, arguments and descriptions), commands, completion sources, LSP settings, formatting results and ordering, UI appearance, theme persistence, directory browsing, and language support. Internal load timing may change only when the feature remains available on its first invocation. Measure first-use latency as well as startup: shifting a pause to a keypress is not automatically an improvement.

### Review scope and evidence

- Reviewed `init.lua`, all Lua configuration modules, plugin lock data, and supporting documentation/scripts. The active entry point imports `general.keymap`, `general.set`, Lazy specifications, and `general.theme`.
- `init.old.vim` is a historical configuration, not sourced by the active entry point. README instructions still describe vim-plug; use the Lua configuration as the implementation baseline.
- Available Neovim: **0.12.3**, Release/LuaJIT. A clean, headless `loadfile` syntax check of the Lua modules reported no errors; this does not validate execution or plugin compatibility.
- Inspected locally installed Lazy defaults: plugins without triggers default to eager loading, its cache is already enabled, and automatic update checking is already disabled.
- No full configuration startup benchmark or interactive behavior test was performed. Priorities below are based on code paths, not measured speedups. Record installed plugin revisions before implementation; local installations need not match every lock entry.
- Lock entries alone do not establish that a plugin is active. For example, worktree mappings exist, but no active git-worktree plugin specification was found.

## 1. Establish a reproducible baseline before editing

**Files:** no production configuration changes required.

1. Record Neovim version, plugin revisions, installed parsers/servers, working directory, recalled colorscheme, environment/PATH, and Python/pyenv selection. Keep versions and dependencies fixed between comparisons.
2. Use a disposable configuration/data/state/cache copy with already-installed dependencies. Avoid including installation, updates, or downloads in steady-state measurements. Use disposable project fixtures for write/debug/Git tests.
3. Run at least 10 repetitions per scenario; report median and spread. Separate cold-cache from warm-cache measurements and alternate baseline/candidate runs.
4. Collect startup logs, for example, from the appropriate isolated configuration:

   ```sh
   nvim --headless -i NONE --startuptime /tmp/opencode/nvim-empty-before.log +qa
   nvim --headless -i NONE --startuptime /tmp/opencode/nvim-lua-before.log init.lua +qa
   ```

   Use a fresh filename for each run because startup logs append. These examples use the normal configuration lookup, so point the environment at the isolated copy before running them.
5. Use `:Lazy profile` to identify actual load reasons and expensive setup functions. Capture a real interactive launch too: headless exit does not measure first paint, deferred work, LSP readiness, or input responsiveness.
6. Measure empty startup, existing-file startup, new files, opening a file after empty startup, directory startup, and first invocation of Telescope, terminals, Trouble, and debugging.
7. Record Python file-open time and shell-process counts, save latency, LSP attach time/client count, completion latency, and scrolling/typing on representative large files.

Treat existing runtime failures as baseline defects. Fix them separately before comparing successful startup paths; a session that aborts initialization can look misleadingly fast.

## 2. Remove unnecessary Python discovery processes

**Priority:** high; direct blocking-work reduction.

**Files:** `lua/general/set.lua:149–159`, `lua/plugins/python-setup.lua:7–10`; optionally a new shared module under `lua/general/`.

### Evidence

Startup runs `pyenv version` synchronously and uses `io.popen("which python")`. Opening the first Python file repeats `pyenv version` and runs `which python` through `vim.fn.system`. The two sites also normalize output differently.

### Implementation

1. Extract shared discovery logic without delaying the existing startup assignment of `PYENV_VERSION` or `python3_host_prog`; Python provider consumers can run before debugging.
2. Replace external `which python` with `vim.fn.exepath("python")` where equivalent. Keep the startup `executable("python3")` gate and the existing order: select `PYENV_VERSION`, then resolve Python.
3. Verify shell aliases/functions, pyenv shims, missing executables, whitespace, and trailing-newline handling. Do not silently switch to `python3`, `pyenv which`, or a fixed interpreter: these can select a different environment.
4. Retain the existing pyenv query initially. Evaluate avoiding the second query only with a sound invalidation rule. Changes to cwd, PATH, `PYENV_VERSION`, or `.python-version` between startup and first Python file must still be respected. If correctness cannot be established cheaply, retain that query.
5. Do not make this asynchronous unless every provider/debugger consumer waits for the result; that is a larger behavioral change than the initial optimization warrants.

**Acceptance:** same effective interpreter and pyenv selection for startup and first debug session, including changing projects before opening Python; no shell process solely to execute `which`; provider and debugpy behavior unchanged. Compare missing-pyenv and missing-Python cases against the baseline.

## 3. Defer Telescope and coordinate its extension loading

**Priority:** high potential startup improvement.

**Files:** `lua/plugins/telescope.lua`, `lua/plugins/git.lua`, `lua/plugins/dap.lua`, `lua/plugins/which-key.lua`; consult `lua/general/keymap.lua`.

### Evidence

Telescope has no load trigger. LazyGit setup immediately requires Telescope to register its extension. `telescope-dap` requires it on the configured language filetypes. Which-key contains direct `require("telescope.builtin")` calls while building mapping tables. Adding `cmd = "Telescope"` alone does not remove these loading paths.

### Implementation

1. Add `cmd = "Telescope"` to the Telescope specification and preserve its complete setup, including hidden/ignored file behavior, layout, and filtering.
2. Keep Lazy's module autoloading available for existing mappings that directly call `require("telescope.builtin")`, such as grep-input and diagnostics.
3. Change direct Telescope function references in which-key mapping registration to callbacks that require and call the same picker at invocation time. Do not change mapping scope or resolve existing LSP mapping overlaps in this optimization.
4. Move LazyGit and DAP extension registration to a coordinated Telescope initialization path. Make their specifications lazy, arrange for their code to be available before `load_extension`, and load each extension once after Telescope setup.
5. Cover both entry orders: native LazyGit/DAP first, and Telescope extension first. Avoid reciprocal eager dependencies or setup recursion. Loading Telescope may reasonably load the small extension modules, but should not implicitly initialize the whole debugger UI.
6. Inventory LazyGit's commands at the installed revision and register all supported public commands as Lazy triggers, including `LazyGit` and any config/current-file/filter variants. Preserve its Telescope entry point.
7. Keep existing worktree mappings intact; absent worktree integration is a separate baseline issue.

**Acceptance:** no Telescope load on an empty launch or ordinary file opening merely from these registration paths; every existing picker and extension works on first use, with identical options and results. Confirm completion of `:Telescope` subcommands and record first-picker latency.

## 4. Defer additional command-driven features

**Priority:** medium; implement independently and measure each change.

| Target | Necessary change | Behavior checks |
| --- | --- | --- |
| `lua/plugins/trouble.lua` | Remove the broad `ft = vim.g.languages` trigger; retain `cmd = "Trouble"`, existing `keys`, and `opts`. Audit TODO integration before accepting. | All six Trouble mappings, direct commands, `TodoTrouble`, diagnostics/symbols/list views work on first call. |
| ToggleTerm in `lua/plugins/init.lua` | Add command triggers for the installed version's public commands, including `ToggleTerm` and supported send/exec/toggle-all commands. Keep setup unchanged. Audit plugin-defined mappings and restored terminal sessions before deferring it. | `<leader>tt`, direct command arguments/counts, terminal persistence, focus, shell and exit behavior match. |
| Conform in `lua/plugins/odinfmt.lua` | Make the specification `lazy = true`; retain automatic module loading for the existing Odin `BufWritePre` callback. Add a trigger for `ConformInfo` if supported by the installed revision, and preserve any other public command. | First write of a newly opened or newly created Odin buffer loads setup before formatting; exact formatter, arguments, synchronization and error behavior are preserved. |

Do not broadly set `defaults.lazy = true`: several plugins install automatic behavior or mappings without explicit triggers.

## 5. Debugger loading: conditional second phase

**Priority:** medium potential first-file improvement; higher implementation risk.

**Files:** `lua/plugins/dap.lua`, `lua/plugins/python-setup.lua`, `lua/plugins/golang.lua`.

### Evidence

DAP UI, Telescope DAP integration, and virtual text load on `vim.g.languages`. Python and Go adapters also explicitly depend on DAP UI, so changing the UI's filetype trigger alone cannot defer it for those languages.

### Implementation requirements

1. First complete Telescope extension decoupling in section 3.
2. Extract lightweight mapping/sign/highlight registration from heavy UI setup. Preserve the current scope and availability of mappings after the first matching language filetype. Do not install new global debugger bindings on an empty startup merely as a shortcut.
3. Preserve exact RHS behavior, including the unusual extra input after `<F5>`, conditional/log-point prompts, and `<leader>dt`.
4. Inventory direct DAP commands and API entry points. Load UI and register its listeners **before** any first session initialization event, not after the session has already started.
5. Resolve the Go/Python adapter dependency paths together. Keep adapter setup on its existing filetype initially; defer UI through a verified pre-session hook supported by the installed DAP version. If direct API calls cannot be covered reliably, retain eager UI for those paths.
6. Keep highlight groups needed outside debugging available at the same time. DAP defines generic groups such as `green`, which Obsidian references.
7. Preserve current virtual-text behavior; the existing specification has no explicit setup call. Do not enable additional features as part of this optimization.

**Acceptance:** identical first and subsequent Go/Python debugging, breakpoint signs, stepping, termination, REPL and automatic UI open/close, including direct command/API and Telescope launch routes. Reject this phase if it only adds first-debug latency without worthwhile file-open savings.

## 6. Changes requiring evidence before implementation

These are investigation items, not unconditional edits.

### Nvim-tree directory behavior

`lua/plugins/nvim_tree.lua` is eager and contains automatic directory hijacking. Command-only loading would break `nvim .` or later `:edit directory` behavior.

If profiling identifies meaningful cost, keep the netrw-disabling globals early (in `init`, before plugin sourcing), retain existing options, and design a directory-entry trigger in addition to every public tree command. Handle both startup and later directory buffers before normal directory handling occurs; avoid duplicate tree windows or manual event replay. Test `nvim .`, a named directory, `:edit directory`, session restoration, `<F2>`, `<F3>`, cwd changes, and file-selection window behavior. Otherwise retain eager loading.

### Themes

`lua/plugins/themes/*.lua` loads several inactive themes on Lua filetype. Test replacing those filetype triggers with `lazy = true`, relying on verified Lazy colorscheme loading. Keep last-color recall and highlight overrides at their current startup point.

Before accepting, compare `:colorscheme` completion and Telescope colorscheme enumeration/preview before opening Lua: unloaded themes must remain discoverable exactly as required. Preserve transparency state and lualine's Sonokai dependency. Theme setup can alter highlights or terminal colors even when the theme is not selected; compare those side effects. Retain existing loading where equivalence cannot be demonstrated.

### Completion dependency graph

`lua/plugins/lsp.lua:152–220` eagerly initializes Mason, LSP, and nvim-cmp. Deferring completion is not a simple `InsertEnter` change: `cmp-nvim-lsp` can load cmp during capability construction, and SQL FileType callbacks call `require("cmp").setup.buffer`.

Only attempt a split after inspecting the installed dependency code. Keep capability advertisement before server startup, diagnostics/LspAttach registration before attachment, and SQL source overrides after global completion setup. Preserve manual `<C-Space>` completion, Enter/Tab behavior, `completeopt`, and native LSP completion with `autotrigger = false`. Keep Mason PATH setup and server installation/enable behavior unchanged. Do not defer the whole LSP stack merely to improve an empty-startup number.

## 7. Behavior-sensitive findings to preserve

- `vim.g.languages_extented` is referenced in `lua/plugins/init.lua` and `lua/plugins/todo-comments.lua` but is not defined in this repository. Those `ft` fields therefore do not restrict loading as their spelling might suggest. Defining or replacing the variable would change comment/TODO availability; keep actual current coverage.
- `lua/plugins/treesitter.lua` installs a **global** FileType callback from `init`, despite its narrower plugin `ft` list. It attempts highlighting and sets `indentexpr` for every filetype. Restricting it to `vim.g.languages`, disabling regex syntax, or skipping large buffers changes behavior. Verify the installed main-branch loading requirements before any Treesitter restructuring.
- `lua/general/set.lua:95–109` runs synchronous isort against the on-disk Python file and then `edit!` during `BufWritePre`. Replacing this with stdin formatting or asynchronous formatting changes save/reload/unsaved-text semantics. Profile it, but treat a rewrite as a separate correctness task.
- Preserve Go imports, Rust autosave formatting, Odin formatting, and trailing-whitespace processing, including ordering and event patterns. Do not convert save hooks to asynchronous work.
- `lua/plugins/golang.lua` is active despite its `DEPRECATED` comment. Inspect actual gopls client counts before claiming duplicate LSP setup; only consolidate if identical settings, roots and capabilities can be preserved.
- `lua/plugins/odin.lua` returns an empty specification; `general/copilot_cfg.lua` has no active require; the legacy LSP utility is not used by the active LSP module. Removing inactive code is not a meaningful runtime optimization.
- `which-key.lua` has `ft = {}`. Confirm its resolved Lazy load state before assuming it runs at startup; do not turn a currently dormant plugin into an eager one.
- Keep `updatetime = 50`, UI refresh/debounce values, Gitsigns diff settings, filesystem watchers, completion sources, pylsp diagnostic plugins, Obsidian rendering, and Telescope search coverage. Changing them can improve performance by reducing functionality or responsiveness, which is outside this task.
- Do not remove Dadbod's deoplete/provider dependencies without proving their behavior is unused. Do not remove native completion because cmp also exists.
- Do not add `vim.loader.enable()` as a presumed free speedup: Lazy already has a cache/loader. Verify compatibility and measure before proposing another loader.
- Avoid blanket disabling of built-in runtime plugins; archives, matching, directory access and other features may depend on them.

## 8. Delivery sequence and acceptance checklist

Implement separate, reversible commits in this order:

1. Capture baseline and document existing failures.
2. Replace Python executable shell lookup; evaluate query reuse separately.
3. Decouple Telescope and extension registration.
4. Apply Trouble, ToggleTerm and Conform changes individually.
5. Consider debugger, tree, theme and completion work only if profiles justify it.

For each commit, record changed files, baseline/candidate timing distributions, first-use timings, and behavioral results. Keep only improvements larger than run-to-run noise, with no material regression in common workflows. No fixed percentage speedup is promised.

### Regression matrix

- Empty buffer, existing/new files, stdin, directory arguments, and files opened after startup.
- Lua, Python, Go/gomod, Odin, Rust, SQL/mysql/plsql, Markdown inside/outside the vault, shell/config files, and an unlisted filetype.
- All affected mappings and commands on first use and repeated use; compare modes, scope, arguments and command completion.
- LSP clients/settings/root selection, diagnostics, navigation, manual completion, SQL completion and buffer-local `:Format`.
- Formatting and writes on disposable fixtures: buffer and disk contents, undo history, cursor/view, import ordering and failures.
- Debugger start/stop/step/breakpoint/REPL and UI lifecycle for supported adapters.
- Tree startup/hijacking, Git signs/hunks, Fugitive, LazyGit and Telescope extensions.
- Recalled and manually selected themes, transparency, custom highlights, statusline/bufferline, TODO marks, indentation, cloak and Markdown rendering.
- System clipboard, terminal and tmux navigation remain functional.
- No new startup/configuration errors, duplicate callbacks, sessions, clients or extension registration.

Final developer deliverable: Lua changes plus measured before/after results and this checklist's outcomes. Update this document with implemented, rejected and deferred items so speculative improvements are not reported as verified gains.

## Implementation notes (2026-11-14)

- Implemented: replaced the two `which python` subprocesses with `exepath("python")`. The startup python3 gate, both pyenv queries, their order, and the original sites' different whitespace/newline handling remain. On this machine both lookups selected `/home/rubens/.pyenv/shims/python`; opening a Python file loaded dap-python and retained the original trailing newline in the host setting.
- Investigated but retained: Trouble's filetype trigger. A headless `:Trouble diagnostics toggle` smoke test loaded it on first invocation without the trigger, but the timing measurements did not demonstrate a gain and interactive/TODO integration was not fully checked.
- Deferred: Telescope and its extensions, ToggleTerm, Conform, debugger UI, tree, themes, and completion. Their full first-use and behavior checks require further profiling and interactive testing; no claim is made that they were optimized.
- Warm headless wall-clock measurements, 10 consecutive runs per scenario, in the existing configuration and data directories, Neovim 0.12.3: empty startup before median 133.9 ms (range 129.2–142.8), candidate 129.5 ms (121.7–181.7); `init.lua` startup before 198.6 ms (190.7–223.2), candidate 195.4 ms (189.6–200.8). The candidate included the subsequently reverted Trouble change. Runs were not alternated or isolated, so these numbers do not establish a performance improvement.
- Checks performed: headless startup, Lua syntax, Python file opening and debugger-plugin loading, and a Trouble command smoke test. Full regression matrix, interactive first-use latency, missing executables, alternate PATH/project changes, debugger sessions, and plugin revision capture remain unverified.

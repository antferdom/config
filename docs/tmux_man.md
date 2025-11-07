We have update the basic tmux config, in particular, changing the **prefix key** `.tmux.conf`

```shell
set -g prefix `
bind-key ` last-window
bind-key e send-prefix
```

From [tmux manual](https://github.com/tmux/tmux/wiki/Getting-Started) can you list the basic windows commands (e.g. create, split into panels, kill window, move between windows)

# Basic windows & panes commands

| Key Binding         | Description                                       |
| ------------------- | ------------------------------------------------- |
| **` c**             | Create a new window                               |
| **` %**             | Split current pane horizontally                   |
| **` "**             | Split current pane vertically                     |
| **` &**             | Kill the current window (confirm with 'y')        |
| **` x**             | Kill the active pane (confirm with 'y')           |
| **`0\** to \**` 9** | Select window by number (0-9)                     |
| **` '**             | Prompt for a window index to select               |
| **` n**             | Go to next window                                 |
| **` p**             | Go to previous window                             |
| **` l**             | Go to last-used window                            |
| **``**              | Go to last-used window (toggle, your custom)      |
| **` e**             | Send literal backtick **``**to the pane           |
| **` ↑/↓/←/→**       | Move to pane above/below/left/right               |
| **` q**             | Briefly display pane numbers (then press a digit) |
| **` o**             | Move to next pane                                 |
| **` z**             | Zoom pane (toggle full-screen / restore)          |
| **` Space**         | Cycle through pane layouts                        |

## Resizing panes (unchanged)

- Small steps: **Ctrl-arrow**
- Larger steps: **Alt-arrow** (or **M-arrow**)

## Pre-defined layouts (quick)

- **` Alt-1** → even-horizontal
- **` Alt-2** → even-vertical
- **` Alt-3** → main-horizontal
- **` Alt-4** → main-vertical
- **` Alt-5** → tiled

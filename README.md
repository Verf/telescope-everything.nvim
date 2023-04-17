# telescope-everything.nvim

Search things by es.exe(Everything Command Line Interface) for windows user.

## Requirement

Install [Everything](https://www.voidtools.com/), and put [Everything Command Line Interface](https://www.voidtools.com/support/everything/command_line_interface/)
in PATH (or setup `es_path` to the path of es).

## Installation

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'Verf/telescope-everything.nvim'
```

or [packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'Verf/telescope-everything.nvim'
```

## Setup

```lua
require('telescope').load_extension 'everything'
```

## Usage

```vim
:Telescope everything
```

## Config

You can check [Everything Command Line Interface](https://www.voidtools.com/support/everything/command_line_interface/) for more information,
the default config is:

```lua
require('telescope').setup {
    extensions = {
        everything = {
            es_path = "es",
            case_sensitity = false,
            whole_word = false,
            match_path = false,
            sort = false,
            regex = true,
            offset = 0,
            max_results = 100,
        }
    },
}
```

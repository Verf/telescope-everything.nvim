# telescope-everything.nvim

Search things by es.exe(Everything Command Line Interface) for windows user.

## Requirement

[Everything](https://www.voidtools.com/) and [Everything Command Line Interface](https://www.voidtools.com/support/everything/command_line_interface/) in PATH.

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

You can check [Everything Command Line Interface](https://www.voidtools.com/support/everything/command_line_interface/) for more information:

```lua
require('telescope').setup {
    extensions = {
        everything = {
            case_sensitity = false,
            whole_word = false,
            match_path = false,
            sort = false,
            offset = 0,
            max_results = 100,
        }
    },
}
```

## Roadmap
[ ] Support regex

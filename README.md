# Ajat's Neovim Config

## Table of Contents

- [Preview](#preview)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Usage](#usage)
- [Mappings](#default-mappings)

## Preview

## Getting Started

### Required dependencies

- [nvim](https://neovim.io/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [nodejs](https://nodejs.org/en)

### Installation

- Clone this repo

```sh
git clone git@github.com:ajatdarojat45/nvim.git ~/.config
```

- Open nvim

```sh
nvim
```

- Install plugins

```
:PlugInstall
```

- Install language parsers

```
:TSInstall <language_to_install>
```

Check supported languages [here](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)

- Install coc extensions

```
:CocInstall <extensions_to_install>
```

Check extentions list [here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions)

- Install MarkdownPreview

```
:call mkdp#util#install()
```

## Usage

### Mappings

| Mappings     | Action      |
| ------------ | ----------- |
| `which keys` | description |

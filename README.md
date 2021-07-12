# pVimHouse Vim Setup
### Dependencies
- Vim > 8.1
- NodeJS > v12
- NPM
- Vundle
- Yarn
- Git

### How to install Vundle
Run:
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

### Setup Instructions
- Install Agave (or any other nerd font) and set that as the font to use in your terminal
- Place the `.vimrc` file in your home directory
- On first run of Vim, 
     1. run: `:PluginInstall`
     2. Wait for plugins to download
     3. Restart Vim
- To get Coc to work correctly:
     1. Navigate to ~/.vim/bundle/coc.nvim
     2. Run: `npm install`
- To add autocomplete to new file types using Coc
     run: `:CocInstall coc-[file type]`
- To get Prettier to work correctly:
     1. Navigate to ~/.vim/bundle/vim-prettier/
     2. Run: `npm install`

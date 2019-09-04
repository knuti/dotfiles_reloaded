## Reorganize Settings And Files

### general requirements

* brew
* wget
* git
* the_silver_searcher
* vim
* ctags
* rvm
* fzf
* tmux

-----------------

### thanks to

* https://trevordmiller.com/projects/nova
For defining a great color scheme

-----------------

### fonts/

*  FjordOne-Regular.otf
*  Meslo LG M DZ Regular for Powerline.otf
*  Open_Sans.zip

Include through Fontbook.app on Mac OS. After that, open up iterm2 > Preferences
\> Profile > Change Font. Select font of choice (Meslo LG, 13pt) and enjoy.

-----------------

### git/

* gitconfig
* gitignore

Link both files to $HOME (`ln -s path/to/project/git/<file> .<file>` and change
at least "username" and "email" inside gitconfig file.

-----------------

### terminal/

* color_schemes/

In iterm2 app, open Preferences > Colors > and select Import from the Dropdown.
In the same Dropdown, select the colorscheme to be imported. Inside the schemes
folder are a lot of themes to choose from. The folder itself is a submodule.
Currently in use: japanesque
Already provided: Tango Dark

New find: https://gist.github.com/kevin-smets/8568070

-----------------

### vim/

* colors/
  * jellybeans.vim
* bundle/ _(includes vim related submodules, loaded through Plug())_
* vimrc _(main vim configuration file)_

great colorscheme: [Night Owl](https://github.com/Khaledgarbaya/night-owl-vim-theme)

In `$HOME` directory, use `ln -s /path/to/project/vim/ .vim` and
`ln -s /path/to/project/vim/vimrc .vimrc` to symlink the configuration folder
and file. Restart vim and see the change happen. Change `vimrc` to your likes.
For example search for "jellybeans" and replace it with "railscast". Any change
made in vimrc file needs a restart of vim to take effect.

Plugins are managed through Plug. In vimrc you will find a call to it,
loading all plugins listed

-----------------

### misc

 `git submodule add <link_to_repo:most_often_git> <path_to_dotfiles>/vim/bundle/<repo_name>`.
To be up to date use `git submodule update --init --recursive`.

make dock appear only after a long time hovering over:
`defaults write com.apple.Dock autohide-delay -float XXX; killall Dock`
where XXX is a number of seconds (5 is good)
reenable default behaviour:
` delete com.apple.Dock autohide-delay; killall Dock`

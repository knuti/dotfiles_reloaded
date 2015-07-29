## Reorganize Settings And Files

### fonts/

*  FjordOne-Regular.otf
*  Meslo LG M DZ Regular for Powerline.otf
*  Open_Sans.zip

Include through Fontbook.app on Mac OS. After that, open up iterm2 > Preferences
\> Profile > Change Font. Select font of choice (Meslo LG, 11pt) and enjoy.

-----------------

### terminal/

* colors/
  * Solarized Dark.itermcolors

In iterm2 app, open Preferences > Colors > and select Import from the Dropdown.
In the same Dropdown, select the imported color. I do not like the set, but it
gives a nice example. Maybe more color sets should follow.

-----------------

### vim/

* colors/
  * jellybeans.vim
* plugins/
* vimrc _(main vim configuration file)_

In `$HOME` directory, use `ln -s /path/to/project/vim/ .vim` and
`ln -s /path/to/project/vim/vimrc .vimrc` to symlink the configuration folder
and file. Restart vim and see the change happen. Change `vimrc` to your likes.
For example search for "jellybeans" and replace it with "railscast". Any change
made in vimrc file needs a restart of vim to take effect.

Plugins are managed through pathogen. In vimrc you will find a call to it,
loading all plugins inside this folder. To be loaded, plugins will need to be
placed as git submodules: `git submodule add <link_to_repo:most_often_git>`.
To be up to date use `git submodule update`.

-----------------

### git/

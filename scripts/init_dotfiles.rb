# other ways of executing shell commands:
# `echo hi`
# %x(echo hi)
# but those do not return true ...

script_dir   = File.expand_path(File.dirname(__FILE__))
terminal_dir = script_dir.split("/")[0..-2].push("terminal").join("/")
vim_dir      = script_dir.split("/")[0..-2].push("vim").join("/")
git_dir      = script_dir.split("/")[0..-2].push("git").join("/")

unless system 'brew help'
  puts "-----------------------"
  unless system 'curl -V'
    puts "-----------------------"
    puts "At least, provide curl"
    exit -1
  else
    puts "installing homebrew"
    system `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
    puts "-----------------------"
  end
else
  puts "You're already ready to brew"
  puts "-----------------------"
end

puts "start brewing"
puts "-----------------------"

system "brew install wget git the_silver_searcher ctags yarn redis tmux htop node postgresql pgcli readline vim"
puts "-----------------------"

puts "installing oh-my-zsh"
system 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
puts "-----------------------"

puts "removing pre-installed files and linking own"
system 'rm ~/.zshrc ~/.gitconfig ~/.vimrc'
system 'rm -rf ~/.vim'
system "ln -s #{git_dir}/gitconfig ~/.gitconfig"
system "ln -s #{git_dir}/gitignore ~/.gitignore"
system "ln -s #{terminal_dir}/zshrc ~/.zshrc"
system "ln -s #{vim_dir}/vimrc ~/.vimrc"
system "ln -s #{vim_dir} ~/.vim"
system "ln -s #{script_dir} ~/scripts"
puts "-----------------------"

puts "installing rvm"
system "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
system "\curl -sSL https://get.rvm.io | bash -s stable"
puts "-----------------------"

puts "installing ruby 2.4"
system "rvm install 2.4"
puts "-----------------------"

puts "preparing use of tmuxinator"
system "rvm use 2.4@tmuxinator --create"
system "gem install tmuxinator --no-ri --no-rdoc"

Dir.mkdir("~/.tmuxinator") unless Dir.exists?("~/.tmuxinator")

# some more linking


puts "-----------------------"
puts "-----------------------"

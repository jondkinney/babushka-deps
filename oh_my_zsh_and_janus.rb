dep 'oh-my-zsh and janus' do
  met? {
    "~/.oh-my-zsh/custom/j2fly_shortcuts.zsh".p.exists?
  }

  meet {
    log "Initializing the submodule for .oh-my-zsh"
    shell 'cd ~/.dotfiles; git submodule init; git submodule update;'
    log_shell "Symlinking j2fly_shortcuts.zsh", "ln -nsF /Users/`whoami`/.dotfiles/zsh_conf/custom/j2fly_shortcuts.zsh /Users/`whoami`/.oh-my-zsh/custom/j2fly_shortcuts.zsh"
    log_shell "Symlinking j2fly zsh theme", "ln -nsF /Users/`whoami`/.dotfiles/zsh_conf/j2fly.zsh-theme /Users/`whoami`/.oh-my-zsh/themes/j2fly.zsh-theme"
    log_shell "Raking Janus... um, yea... TWSS?", "cd ~/.vim;rake"
    log_shell "Symlinking j2fly.vim colorscheme", "ln -nsF /Users/`whoami`/.dotfiles/vim_conf/j2fly.vim /Users/`whoami`/.vim/colors/j2fly.vim"
    log_shell "Symlinking j2fly.snippets", "ln -nsF /Users/`whoami`/.dotfiles/vim_conf/j2fly.snippets /Users/`whoami`/.vim/snippets/j2fly.snippets"
  }
end
  
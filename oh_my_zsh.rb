dep 'oh-my-zsh' do
  met? {
    "~/.oh-my-zsh".p.exists?
  }

  meet {
    log "Installing oh-my-zsh from http://github.com/robbyrussell/oh-my-zsh"
    shell 'sudo bash -c "`curl https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh`"'
    log_shell "Symlinking ~/.j2fly-dotfiles/home/.zshrc to ~/.zshrc", "ln -nsf /Users/`whoami`/.j2fly-dotfiles/home/.zshrc /Users/`whoami`/.zshrc"
  }
end
  
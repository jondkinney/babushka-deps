meta 'dotfiles' do
  accepts_value_for :repo, :basename
  accepts_value_for :target, :basename

  template {
    met? {
      "~/.#{target}".p.exists?
    }
    meet {
      log_shell "Cloning", "git clone https://github.com/jondkinney/#{repo}.git ~/.#{target}"
      log "Symlinking"
      shellout = raw_shell("cd ~/.#{target} && chmod +x install.sh && sh install.sh").stdout
      log "#{shellout}"
    }
  }
end

dep 'dotfiles', :template => 'dotfiles'
dep 'private-dotfiles', :template => 'dotfiles'

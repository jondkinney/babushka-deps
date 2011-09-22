meta 'dotfiles' do
  accepts_value_for :repo, :basename
  accepts_value_for :target, :basename

  template {
    met? { "~/.j2fly-#{target}/installed_successfully".p.exists? }
    meet {
      if "~/.j2fly-#{target}".p.exists?
        log_shell "Backing up the existing ~/.j2fly-dotfiles to ~/.bkp-j2fly-dotfiles", "mv ~/.j2fly-dotfiles ~/.bkp-j2fly-dotfiles"
      end
      if log_shell "Cloning", "git clone git@github.com:j2fly/#{repo}.git /Users/`whoami`/.j2fly-#{target}"
        log "Symlinking"
        shellout = raw_shell("cd /Users/`whoami`/.j2fly-#{target}/tools && sh install.sh").stdout
        log shellout.to_s
        return true if shellout.include?("All done")
      end
    }
  }
end

dep 'dotfiles', :template => 'dotfiles'
# dep 'private-dotfiles', :template => 'dotfiles'

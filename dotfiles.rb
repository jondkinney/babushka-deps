meta 'dotfiles' do
  accepts_value_for :repo, :basename
  accepts_value_for :target, :basename

  template {
    met? { "/Users/`whoami`/.j2fly-#{target}/".p.dir? }
    meet {
      log_shell "Cloning", "git clone git@github.com:j2fly/#{repo}.git /Users/`whoami`/.j2fly-#{target}"
      log "Symlinking"
      raw_shell("cd /Users/`whoami`/.j2fly-#{target}/tools && sh install.sh").stdout.include?("All done")
    }
  }
end

dep 'dotfiles', :template => 'dotfiles'
# dep 'private-dotfiles', :template => 'dotfiles'

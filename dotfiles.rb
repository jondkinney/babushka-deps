meta 'dotfiles' do
  accepts_value_for :repo, :basename
  accepts_value_for :target, :basename
  accepts_value_for :email

  template {
    met? {
      "~/.#{target}".p.exists?
    }
    meet {
      log_shell "Cloning", "git clone https://github.com/jondkinney/#{repo}.git ~/.#{target}"
      log "Symlinking"
      # shellout = raw_shell("cd ~/.#{target} && chmod +x install.sh && bash install.sh \"#{full_name}\" #{email}").stdout
      shellout = raw_shell("cd ~/.#{target} && chmod +x install.sh && bash install.sh #{email}").stdout
      log "#{shellout}"
    }
  }
end

dep 'dotfiles', :template, :email do
  template.default('dotfiles')
  email.ask('What is your email?')
end
dep 'private-dotfiles', template: 'dotfiles'

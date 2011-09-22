meta 'dotfiles' do
  accepts_value_for :repo, :basename
  accepts_value_for :target, :basename

  template {
    met? { "~/.j2fly-#{target}/installed_successfully".p.exists? }
    meet {
      if "~/.j2fly-#{target}".p.exists?
        if "~/.bkp-j2fly-dotfiles".p.exists?
          log_shell "Removing backup", "sudo rm -r ~/.bkp-j2fly-dotfiles"
        end
        log_shell "Backing up the existing ~/.j2fly-dotfiles to ~/.bkp-j2fly-dotfiles", "mv ~/.j2fly-dotfiles ~/.bkp-j2fly-dotfiles"
      end
      
      # Setup SSH Temporarily
      shell "sudo rm -r ~/.ssh"
      shell "sudo mkdir -p ~/.ssh"
      shell "sudo touch ~/.ssh/known_hosts"
      shell "sudo echo \"github.com,207.97.227.239 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==\" >> ~/.ssh/known_hosts"
      shell "sudo rm -r ~/.ssh/id_rsa.pub"
      shell "sudo touch ~/.ssh/id_rsa.pub"
      shell "sudo chmod 777 ~/.ssh/id_rsa.pub"
      shell "sudo curl -s https://raw.github.com/j2fly/dotfiles/master/.ssh/id_rsa.pub >> ~/.ssh/id_rsa.pub"
      shell "sudo chmod 644 ~/.ssh/id_rsa.pub"
      
      if log_shell "Cloning", "git clone git@github.com:j2fly/#{repo}.git /Users/`whoami`/.j2fly-#{target}"
        log "Symlinking"
        shellout = raw_shell("cd /Users/`whoami`/.j2fly-#{target}/tools && sh install.sh").stdout
        log "#{shellout}"
        return true if shellout.include?("Successfully Installed")
      else
        log_shell "Restoring ~/.bkp-j2fly-dotfiles to ~/.j2fly-dotfiles", "mv ~/.bkp-j2fly-dotfiles ~/.j2fly-dotfiles"
      end
    }
  }
end

dep 'dotfiles', :template => 'dotfiles'
# dep 'private-dotfiles', :template => 'dotfiles'
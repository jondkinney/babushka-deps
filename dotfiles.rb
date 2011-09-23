meta 'dotfiles' do
  accepts_value_for :repo, :basename
  accepts_value_for :target, :basename

  template {
    met? { 
      if "~/.#{target}/installed_successfully".p.exists?
        log "There is already a ~/.#{target} installation in place."
        log "Remove the ~/.#{target}/installed_successfully file and re-run to install again"
        true
      else
        false
      end  
    }
    meet {
      if "~/.#{target}".p.exists?
        if "~/.bkp-#{target}".p.exists?
          log_shell "Removing backup", "sudo rm -r ~/.bkp-#{target}"
        end
        log_shell "Backing up the existing ~/.#{target} to ~/.bkp-#{target}", "mv ~/.#{target} ~/.bkp-#{target}"
      end
      
      if log_shell "Cloning", "git clone https://github.com/j2fly/#{repo}.git /Users/`whoami`/.#{target}"
        log "Symlinking"
        shellout = raw_shell("cd /Users/`whoami`/.#{target} && sh install.sh").stdout
        log "#{shellout}"
      else
        log_shell "Restoring ~/.bkp-#{target} to ~/.#{target}", "mv ~/.bkp-#{target} ~/.#{target}"
      end
    }
  }
end

dep 'dotfiles', :template => 'dotfiles'
dep 'private-dotfiles', :template => 'dotfiles'
# Complete setup for my Macbook Pro, 'mbp17'
dep 'mbp17' do
  requires 'dotfiles', 
           'private-dotfiles'

  requires 'os x prefs'

  requires 'brew packages'
           
  requires 'special'

  requires 'osx apps installed'
  
end

dep 'brew packages' do
  requires 'ack.managed',
           'git.managed',
           'growlnotify.managed',
           'imagemagick.managed',
           'redis',
           'sphinx.managed',
           'tig.managed',
           'tmux.managed',
           'tree.managed',
           'wget.managed'
end

dep 'special' do
  # Custom Installs (each maps to a file in this repo)
#  'coffeescript.src',
  requires 'HEXColorPicker',
           # 'macvim',
           'mysql.managed',
           'npm',
           'nvm',
           'oh-my-zsh and janus',
           'postgresql.managed',
           'Pow',
           'rvm'

  # System Level
  requires 'Growl.installer',
           'KeyRemap4MacBook.installer',
           'locatedb',
           'MercuryMover.installer',
           'SIMBL.installer',
           'teleport.installer'
end


dep 'osx apps installed' do
  # Social, Web, Media etc.
  requires 'Colloquy.app',
           'ColorSchemer Studio 2.app',
           'Echofon.app',
           'Evernote.app',
           'Firefox.app',
           'Fluid.app',
           'Google Chrome.app',
           'Notational Velocity.app',
           'OmniGraffle Professional 5.app',
           'Pixelmator.app',
           'Plex.app',
           'Skype.app',
           'Sparrow.app',
           'Mailplane.app',
           'Things.app',
           'Transmission.app',
           'VLC.app'

  # Development
  requires 'CoRD.app',
           'GitX.app',
           'iTerm.app',
           'MacVim.app',
           'Reggy.app',
           'Sequel Pro.app',
           'Snippets.app',
           'TextMate.app',
           'VirtualBox.installer'

  # System utilities
  requires 'Airfoil.app',
           'Alfred.app',
           'Carbon Copy Cloner.app',
           'DaisyDisk.app',
           'Dropbox.app',
           'ExpanDrive.app',
           # 'Flip4Mac.app',
           'Flux.app',
           'gfxCardStatus.app',
           'iStat Menus.app',
           'ScreenSharingMenulet.app',
           'SmartSleep.app',
           'Spark.app',
           'Stay.app',
           'TotalFinder.app'
  # Tools
  requires '1Password.app',
           'Acorn.app',
           'KeyCastr.app',
           'SizeUp.app',
           'SuperDuper!.app',
           'xScope.app'

  # Mac App Store Apps (install through the store)
           # 'Cloud.app',
           # 'QuickCal.app',
           # 'QuickURLShortener.app',
           # 'Skitch.app'
end

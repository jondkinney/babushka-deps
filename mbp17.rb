# Complete setup for my Macbook Pro, 'mbp17'

dep 'mbp17' do
  requires 'dotfiles'

  requires 'mbp17 brew packages'
  
  requires 'mbp17 special'

  requires 'mbp17 osx apps installed'
end

dep 'mbp17 brew packages' do
  # Brew Packages
  requires '',
           'ack.managed',
           'git.managed',
           'growlnotify.managed',
           'imagemagick.managed',
           'redis',
           'sphinx.managed',
           'tig.managed',
           'tmux',
           'tree.managed',
           'wget',
           ''
end


dep 'mbp17 special' do
  requires '',
           'coffeescript.src',
           'HEXColorPicker',
           'macvim',
           'mysql',
           'nvm',
           'postgres',
           'Pow',
           'rvm',
           ''
end


dep 'mbp17 osx apps installed' do
  # Social, Web, Media etc.
  requires '',
           'Colloquy.app',
           'Color Schemer Studio.app',
           'Echofon.app',
           'Evernote.app',
           'Firefox.app',
           'Fluid.app',
           'Google Chrome.app',
           'Notational Velocity.app',
           'OmniGraffle.app',
           'Pixelmator.app',
           'Plex.app',
           'Skype.app',
           'Sparrow.app',
           'Things.app',
           'Transmission.app',
           'VLC.app',
           ''

  # Development
  requires '',
           'CoRD.app',
           'GitX.app',
           'iTerm.app',
           'Reggy.app',
           'Sequel Pro.app',
           'Snippets.app',
           'TextMate.app',
           'VirtualBox.installer',
           ''

  # System utilities
  requires '',
           'Airfoil.app',
           'Carbon Copy Cloner.app',
           'Dropbox.app',
           'Flip4Mac',
           'Flux.app',
           'gfxCardStatus.app',
           'Growl.installer',
           'iStat Menus.app',
           'KeyRemap4MacBook.installer',
           'ScreenSharingMenulet.app',
           'Screenshot Settings.app',
           'SIMBL.installer',
           'SmartSleep.app',
           'Spark.app',
           'Stay.app',
           'teleport.installer',
           'TotalFinder.app',
           ''
  # Tools
  requires '',
           '1Password.app',
           'Acorn.app',
           'Alfred.app',
           'Cloud.app',
           'KeyCastr.app',
           'MercuryMover.installer',
           'QuickCal.app',
           'QuickURLShortener.app',
           'SizeUp.app',
           'Skitch.app',
           'SuperDuper.app',
           'xScope.app',
           ''
end

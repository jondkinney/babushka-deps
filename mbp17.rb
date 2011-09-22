# Complete setup for my Macbook Pro, 'mbp17'

dep 'mbp17' do
  requires 'dotfiles'

  requires 'brew_packages'
           
  requires 'special'

  requires 'osx apps installed'
end

dep 'special' do
  # Custom Installs (each maps to a file in this repo)
  requires 'coffeescript.src',
           'HEXColorPicker',
           'macvim',
           'mysql configured',
           'npm',
           'nvm',
           'oh-my-zsh',
           'postgres',
           'Pow',
           'rvm'

  # System Level
  requires 'Growl.installer',
           'KeyRemap4MacBook.installer',
           'MercuryMover.installer',
           'Screenshot Settings Configured',
           'SIMBL.installer',
           'teleport.installer'
end


dep 'osx apps installed' do
  # Social, Web, Media etc.
  requires 'Colloquy.app',
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
           'VLC.app'

  # Development
  requires 'CoRD.app',
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
           'iStat Menus.app',
           'ScreenSharingMenulet.app',
           'SmartSleep.app',
           'Spark.app',
           'Stay.app',
           'TotalFinder.app',
           ''
  # Tools
  requires '',
           '1Password.app',
           'Acorn.app',
           'KeyCastr.app',
           'SizeUp.app',
           'SuperDuper.app',
           'xScope.app'

  # Mac App Store Apps (install through the store)
           # 'Alfred.app',
           # 'Cloud.app',
           # 'QuickCal.app',
           # 'QuickURLShortener.app',
           # 'Skitch.app',
end
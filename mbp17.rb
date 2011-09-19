# Complete setup for my Macbook Pro, 'mbp17'

dep 'mbp17' do
  requires 'dotfiles'

  requires 'mbp17 osx apps installed'

  requires 'macvim',
           'tmux',
           'ack.managed',
           'tree.managed'

  requires 'rvm'
  requires 'nvm'
  requires 'Pow'
end

dep 'mbp17 osx apps installed' do
  # Social, Web, Media etc.
  requires 'Google Chrome.app',
           'Echofon.app',
           'Skype.app',
           'Airfoil.app'

  # System utilities
  requires 'Dropbox.app',
           'Growl.installer',
           'iStat Menus.app',
           'KeyRemap4MacBook.installer',
           'gfxCardStatus.app',
           'HEXColorPicker'

  # Tools
  requires 'SizeUp.app',
           '1Password.app'

  # Development
  requires 'iTerm.app',
           'Sequel Pro.app',
           'GitX.app',
           'Reggy.app',
           'VirtualBox.installer',
           'CoRD.app',
           'coffeescript.src'
end
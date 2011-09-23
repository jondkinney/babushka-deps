# Pref Panes
# ----------
dep 'Growl.installer' do
  source 'http://growl.cachefly.net/Growl-1.2.2.dmg'
  #pkg_name 'Growl.pkg'
  provides 'growlnotify'
  met? {
    '/Library/PreferencePanes/Growl.prefPane'.p.exist?
  }
end

dep 'KeyRemap4MacBook.installer' do
  source 'http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-7.4.0.pkg.zip'
  met? {
    '/Library/PreferencePanes/KeyRemap4MacBook.prefPane'.p.exist?
  }
end

dep 'MercuryMover.installer' do
  source 'http://www.heliumfoot.com/files/release/mercurymover/MercuryMover.dmg'
  met? {
    '/Library/PreferencePanes/MercuryMover.prefPane'.p.exist?
  }
end

dep 'teleport.installer' do
  source 'http://www.abyssoft.com/software/teleport/downloads/teleport.zip'
  met? {
    '/Library/PreferencePanes/teleport.prefPane'.p.exist?
  }
end


# OS X Preferences
# ----------------
dep 'screenshot settings configured' do
  requires 'Screenshot Folder Location Exists'
  met? {
    '~/Library/Preferences/com.apple.screencapture.plist'.p.exist?
  }
  meet {
    log_shell("Setting up screenshot preferences", "defaults write com.apple.screencapture location /Users/`whoami`/Pictures/ScreenShots")
  }
end

dep 'Screenshot Folder Location Exists' do
  met? {
    '~/Pictures/ScreenShots'.p.exist?
  }
  meet {
    log_shell("Creating ~/Pictures/ScreenShots folder", "mkdir -p /Users/`whoami`/Pictures/ScreenShots")
  }
end


# Non-standard
# -------------
dep 'SIMBL.installer' do
  source 'http://www.culater.net/dl/files/SIMBL-0.9.9.zip'
  met? { '/Library/ScriptingAdditions/SIMBL.osax'.p.exists? }
end
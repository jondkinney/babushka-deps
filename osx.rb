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
  # source 'http://www.heliumfoot.com/files/release/mercurymover/MercuryMover.dmg'
  met? {
    "/Library/PreferencePanes/MercuryMover.prefPane".p.exist?
  }
  meet {
    log_shell("Downloading MercuryMover", "curl 'http://www.heliumfoot.com/files/release/mercurymover/MercuryMover.dmg' -o ~/Downloads/MercuryMover.dmg")
    log_shell("Stripping EULA","/usr/bin/hdiutil convert -quiet ~/Downloads/MercuryMover.dmg -format UDTO -o ~/Downloads/mercury_mover")
    log_shell("Mounting and creating local folder with contents of DMG","/usr/bin/hdiutil attach -quiet -nobrowse -noverify -noautoopen -mountpoint ~/Downloads/mercury_mover ~/Downloads/mercury_mover.cdr")
    log_shell("Copying into /Library/PreferencePanes","sudo cp -r ~/Downloads/mercury_mover/MercuryMover.prefPane /Library/PreferencePanes")

    after {
      log "Detaching DMG and cleaning up (deleting downloaded files)"
      shell("/usr/bin/hdiutil detach ~/Downloads/mercury_mover/")
      "~/Downloads/MercuryMover.dmg".p.remove
      "~/Downloads/mercury_mover.cdr".p.remove
    }
  }
end

# Not sure why I had to custom do this one...but it didn't work when I tried it.
dep 'teleport.installer' do
  # source 'http://www.abyssoft.com/software/teleport/downloads/teleport.zip'
  met? {
    "/Library/PreferencePanes/teleport.prefPane".p.exist?
  }
  meet {
    log_shell("Downloading teleport", "curl 'http://www.abyssoft.com/software/teleport/downloads/teleport.zip' -o ~/Downloads/teleport.zip")
    log_shell("Unzipping","unzip -o ~/Downloads/teleport.zip -d ~/Downloads")
    log_shell("Copying into /Library/PreferencePanes","sudo cp -r ~/Downloads/teleport/teleport.prefPane /Library/PreferencePanes")

    after {
      log "Cleaning up (deleting downloaded files)"
      "~/Downloads/teleport.zip".p.remove
      "~/Downloads/teleport".p.remove
      "~/Downloads/__MACOSX".p.remove
    }
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



# dep 'os x configured' do
#   met? {
#     '~/Library/Preferences/com.apple.finder.plist'.p.exist?
#   }
#   meet {
#     log_shell("Setting up finder preferences", "defaults write com.apple")
#   }
# end




# Non-Standard Apps
# -----------------
dep 'SIMBL.installer' do
  source 'http://www.culater.net/dl/files/SIMBL-0.9.9.zip'
  met? { '/Library/ScriptingAdditions/SIMBL.osax'.p.exists? }
end
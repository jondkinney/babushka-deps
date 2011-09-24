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


# Non-Standard Apps
# -----------------
dep 'SIMBL.installer' do
  source 'http://www.culater.net/dl/files/SIMBL-0.9.9.zip'
  met? { '/Library/ScriptingAdditions/SIMBL.osax'.p.exists? }
end



dep 'os x prefs' do
  requires 'locatedb',
           'Show these items on the desktop',
           'New Finder window show',
           'finder view options',
           'additional prefs'

end


dep 'locatedb' do
  shell "sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist"
end

# Setup Preferences typically configured in the GUI at Finder > Preferences
dep 'Show these items on the desktop' do
  shell "defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true"
  shell "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true"
  shell "defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true"
  shell "defaults write com.apple.finder ShowMountedServersOnDesktop -bool true"
end

dep 'New Finder window show' do
  # Set this to open to the home directory, not "All My Files", if you want All My Files though it's PfAF
  shell "defaults write com.apple.finder NewWindowTarget PfHm"  
end

# Setup Preferences typically configured in the GUI at Finder > View > Show View Options
dep 'finder view options' do
  shell "/usr/libexec/PlistBuddy -c \"Set ':DesktopViewSettings:IconViewSettings:arrangeBy' name\" ~/Library/Preferences/com.apple.finder.plist"
  shell "/usr/libexec/PlistBuddy -c \"Set ':DesktopViewSettings:IconViewSettings:gridSpacing' 100\" ~/Library/Preferences/com.apple.finder.plist"
  shell "/usr/libexec/PlistBuddy -c \"Set ':DesktopViewSettings:IconViewSettings:iconSize' 44\" ~/Library/Preferences/com.apple.finder.plist"
  shell "/usr/libexec/PlistBuddy -c \"Set ':DesktopViewSettings:IconViewSettings:labelOnBottom' false\" ~/Library/Preferences/com.apple.finder.plist"
  shell "/usr/libexec/PlistBuddy -c \"Set ':DesktopViewSettings:IconViewSettings:showItemInfo' true\" ~/Library/Preferences/com.apple.finder.plist"
  shell "/usr/libexec/PlistBuddy -c \"Set ':DesktopViewSettings:IconViewSettings:showIconPreview' true\" ~/Library/Preferences/com.apple.finder.plist"
  shell "/usr/libexec/PlistBuddy -c \"Set ':DesktopViewSettings:IconViewSettings:textSize' 11\" ~/Library/Preferences/com.apple.finder.plist"
end

dep 'additional prefs' do
  # Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
  shell "defaults write NSGlobalDomain AppleKeyboardUIMode -int 3"

  # Put the Dock on the left
  shell "defaults write com.apple.dock orientation -string left"
  
  # Enable the 2D Dock
  shell "defaults write com.apple.dock no-glass -bool true"

  # Make Dock icons of hidden applications translucent
  shell "defaults write com.apple.dock showhidden -bool true"
  
  # Don’t animate opening applications from the Dock
  shell "defaults write com.apple.dock launchanim -bool false"

  # Enable highlight hover effect for the grid view of a stack (Dock)
  shell "defaults write com.apple.dock mouse-over-hilte-stack -bool true"

  # Show indicator lights for open applications in the Dock
  shell "defaults write com.apple.dock show-process-indicators -bool true"

  # Enable spring loading for all Dock items
  shell "defaults write enable-spring-load-actions-on-all-items -bool true"

  # Disable menu bar transparency
  shell "defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false"

  # # Show remaining battery time; hide percentage
  # shell "defaults write com.apple.menuextra.battery ShowPercent -string 'NO'"
  # shell "defaults write com.apple.menuextra.battery ShowTime -string 'YES'"
  # 
  # # Always show scrollbars
  # shell "defaults write NSGlobalDomain AppleShowScrollBars -string 'Always'"

  # # Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
  # shell "defaults write com.apple.finder QuitMenuItem -bool true"

  # Show all filename extensions in Finder
  shell "defaults write NSGlobalDomain AppleShowAllExtensions -bool true"

  # Expand save panel by default
  shell "defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true"

  # Expand print panel by default
  shell "defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true"

  # Disable the “Are you sure you want to open this application?” dialog
  shell "defaults write com.apple.LaunchServices LSQuarantine -bool false"

  # Disable shadow in screenshots
  shell "defaults write com.apple.screencapture disable-shadow -bool true"

  # Disable press-and-hold for keys in favor of key repeat
  shell "defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false"

  # Set a blazingly fast keyboard repeat rate
  shell "defaults write NSGlobalDomain KeyRepeat -int 0"

  # Disable auto-correct
  shell "defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false"

  # Disable window animations
  shell "defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false"

  # Enable AirDrop over Ethernet and on unsupported Macs running Lion
  shell "defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true"

  # Disable disk image verification
  shell "defaults write com.apple.frameworks.diskimages skip-verify -bool true"
  shell "defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true"
  shell "defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true"

  # Automatically open a new Finder window when a volume is mounted
  shell "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true"
  shell "defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true"

  # Display full POSIX path as Finder window title
  shell "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true"

  # Increase window resize speed for Cocoa applications
  shell "defaults write NSGlobalDomain NSWindowResizeTime -float 0.001"

  # Avoid creating .DS_Store files on network volumes
  shell "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"

  # Disable the warning when changing a file extension
  shell "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false"

  # Disable the warning before emptying the Trash
  shell "defaults write com.apple.finder WarnOnEmptyTrash -bool false"

  # Empty Trash securely by default
  shell "defaults write com.apple.finder EmptyTrashSecurely -bool true"

  # Require password immediately after sleep or screen saver begins
  shell "defaults write com.apple.screensaver askForPassword -int 1"
  shell "defaults write com.apple.screensaver askForPasswordDelay -int 0"

  # # Enable tap to click (Trackpad)
  # shell "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true"

  # # Map bottom right Trackpad corner to right-click
  # shell "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2"
  # shell "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true"

  # Disable Safari’s thumbnail cache for History and Top Sites
  shell "defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2"

  # Enable Safari’s debug menu
  shell "defaults write com.apple.Safari IncludeDebugMenu -bool true"

  # Remove useless icons from Safari’s bookmarks bar
  shell 'defaults write com.apple.Safari ProxiesInBookmarksBar "()"'

  # Only use UTF-8 in Terminal.app
  shell "defaults write com.apple.terminal StringEncodings -array 4"

  # Disable send and reply animations in Mail.app
  shell "defaults write com.apple.Mail DisableReplyAnimations -bool true"
  shell "defaults write com.apple.Mail DisableSendAnimations -bool true"

  # Disable Resume system-wide
  shell "defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false"

  # Enable Dashboard dev mode (allows keeping widgets on the desktop)
  shell "defaults write com.apple.dashboard devmode -bool true"

  # # Reset Launchpad
  # shell "rm ~/Library/Application\ Support/Dock/*.db"

  # Show the ~/Library folder
  shell "chflags nohidden ~/Library"

  # Disable local Time Machine backups
  shell "sudo tmutil disablelocal"

  # Kill affected applications (hopefully you don't have Mail or Safari Open when running this script)
  shell 'for app in Finder Dock; do killall "$app"; done'

  # Fix for the ancient UTF-8 bug in QuickLook (http://mths.be/bbo)
  shell 'echo "0x08000100:0" > ~/.CFUserTextEncoding'
end
# http://www.omnigroup.com/ftp1/pub/software/MacOSX/10.5/OmniGrafflePro-5.3.3.dmg
meta 'skip_eula_prompt' do
  accepts_value_for :app_name, :basename
  accepts_value_for :source, :source
  accepts_value_for :dmg_name

  template {
    met? {
      "/Applications/#{app_name}".p.exist?
    }
    meet {
      log "Using Babushka's Resource.get to snatch #{app_name}"
      Babushka::Resource.get("#{source}") do end
      log_shell "Stripping EULA","/usr/bin/hdiutil convert -quiet ~/.babushka/downloads/#{dmg_name} -format UDTO -o ~/.babushka/downloads/app"
      log_shell "Mounting and creating local folder with contents of DMG","/usr/bin/hdiutil attach -quiet -nobrowse -noverify -noautoopen -mountpoint ~/.babushka/downloads/app ~/.babushka/downloads/app.cdr"
      log_shell "Copying into /Applications","sudo cp -r ~/.babushka/downloads/app/*.app /Applications", :spinner => true

      after {
        log "Detaching DMG and deleting the .cdr we created"
        shell("/usr/bin/hdiutil detach ~/.babushka/downloads/app/")
        "~/.babushka/downloads/app.cdr".p.remove
      }
    }
  }
end

dep 'OmniGraffle Professional 5.app', :template => 'skip_eula_prompt' do
  source 'http://www.omnigroup.com/ftp1/pub/software/MacOSX/10.5/OmniGrafflePro-5.3.4.dmg'
  dmg_name 'OmniGrafflePro-5.3.4.dmg'
end

dep 'Evernote.app', :template => 'skip_eula_prompt' do
  source 'http://evernote.s3.amazonaws.com/mac/release/Evernote_172019.dmg'  
  dmg_name 'Evernote_172019.dmg'
end

dep 'SuperDuper!.app', :template => 'skip_eula_prompt' do
  source 'http://www.shirt-pocket.com/downloads/SuperDuper%21.dmg'
  dmg_name 'SuperDuper!.dmg'
end

dep 'Mailplane.app', :template => 'skip_eula_prompt' do
  source 'http://mailplaneapp.com/downloads/MailplaneSL_1647.dmg'
  dmg_name 'MailplaneSL_1647.dmg'
end


# Mac App Store Apps
# ------------------
# dep 'Cloud.app'
# dep 'Skitch.app'
# dep 'QuickCal.app'
# dep 'QuickURLShortener.app'

# Normal Apps
# ----------------
dep 'Alfred.app' do
  source 'http://media.alfredapp.com/alfred_0.9.10_152.dmg'
end

dep 'SizeUp.app' do
  source 'http://irradiatedsoftware.com/download/SizeUp.zip'
end

dep 'Stay.app' do
  source 'http://cordlessdog.com/stay/versions/Stay%201.1.4.zip'
end

dep 'ScreenSharingMenulet.app' do
  source 'http://www.klieme.com/Downloads/ScreenSharingMenulet/ScreenSharingMenulet_2.2.zip'
end

dep 'iStat Menus.app' do
  source 'http://s3.amazonaws.com/bjango/files/istatmenus3/istatmenus3.18.zip'
end

dep 'Dropbox.app' do
  source 'http://cdn.dropbox.com/Dropbox%201.1.45.dmg'
end

dep 'SmartSleep.app' do
  source 'http://www.jinx.de/SmartSleep_files/SmartSleep.current.dmg'
end

dep 'Flip4Mac.app' do
  source 'http://download.microsoft.com/download/C/8/9/C8951314-E056-404A-8EA8-8744E42594AA/Flip4Mac%20WMV%202.4.0.11.dmg'
end

dep 'Fluid.app' do
  source 'http://fluidapp.com/dist/Fluid_1.2.zip'
end

dep 'GitX.app' do
  source 'http://frim.frim.nl/GitXStable.app.zip'
end

dep 'Sequel Pro.app' do
  source 'http://sequel-pro.googlecode.com/files/Sequel_Pro_0.9.9.1.dmg'
end

dep 'Snippets.app' do
  source 'http://snippetsapp.com/download/Snippets-1.3.2.dmg'
end

dep 'Spark.app' do
  source 'http://www.shadowlab.org/Software/Spark/Spark.dmg'
end

dep 'iTerm.app' do
  source 'http://iterm2.googlecode.com/files/iTerm2-beta2.zip'
end

dep 'Colloquy.app' do
  source 'http://colloquy.info/downloads/colloquy-latest.zip'
end

dep 'ColorSchemer Studio 2.app' do
  source 'http://www.colorschemer.com/colorschemerstudio.dmg'
end

dep 'CoRD.app' do
  source 'http://sourceforge.net/projects/cord/files/cord/0.5.5/CoRD_0.5.5.zip/download?use_mirror=surfnet'
end

dep 'TotalFinder.app' do
  source 'http://downloads.binaryage.com/TotalFinder-1.3.dmg'
end

dep 'Google Chrome.app' do
  source 'http://dl.google.com/chrome/mac/dev/GoogleChrome.dmg'
end

dep '1Password.app' do
  source 'http://aws.cachefly.net/dist/1P/mac/1Password-3.8.6.zip'
end

dep 'Echofon.app' do
  source 'http://www.echofon.com/twitter/mac/bin/Echofon.dmg'
end

dep 'Airfoil.app' do
  source 'http://www.rogueamoeba.com/airfoil/download/Airfoil.zip'
end

dep 'Skype.app' do
  source 'http://www.skype.com/go/getskype-macosx-samplingb'
end

dep 'VirtualBox.installer' do
  source 'http://download.virtualbox.org/virtualbox/4.1.2/VirtualBox-4.1.2-73507-OSX.dmg'
  met? { '/Applications/VirtualBox.app'.p.exists? }
end

dep 'Pixelmator.app' do
  source 'http://pixelmator.s3.amazonaws.com/Pixelmator.zip'
end

dep 'Acorn.app' do
  source 'http://flyingmeat.com/download/Acorn.zip'
end

dep 'Firefox.app' do
  source 'http://releases.mozilla.org/pub/mozilla.org/firefox/releases/latest/mac/en-US/Firefox%207.0.1.dmg'
end

dep 'KeyCastr.app' do
  source 'http://stephendeken.net/software/keycastr/releases/keycastr_0.8.0.dmg'
end

dep 'Plex.app' do
  source 'http://plex.rabozee.net/Plex-v0.9.3.4.dmg'
end

dep 'Flux.app' do
  source 'http://secure.herf.org/flux/Flux.zip'
end

dep 'Notational Velocity.app' do
  source 'http://notational.net/NotationalVelocity.zip'
end

dep 'Reggy.app' do
  source 'http://github.com/downloads/samsouder/reggy/Reggy_v1.3.tbz'
end

dep 'gfxCardStatus.app' do
  source 'http://codykrieger.com/downloads/gfxCardStatus-2.1.zip'
end

dep 'Sparrow.app' do
  source 'http://download.sparrowmailapp.com/appcast/Sparrow-latest.dmg'
end

dep 'Carbon Copy Cloner.app' do
  source 'http://web.mac.com/bombich/ccc-3.4.2.dmg'
end

dep 'Things.app' do
  source 'http://culturedcode.com/things/download/?e=3102'
end

dep 'Transmission.app' do
  #source 'svn://svn.transmissionbt.com/Transmission/trunk'
  #build { shell "./autogen.sh && make -s" }
  #install { shell "sudo make install" }
  source 'http://download.transmissionbt.com/files/Transmission-2.41.dmg'
  #$ svn co svn://svn.transmissionbt.com/Transmission/trunk Transmission
  #$ cd Transmission
  #$ ./autogen.sh && make -s
  #$ su (if necessary for the next line)
  #$ make install
end

dep 'DaisyDisk.app' do
  source 'https://s3.amazonaws.com/DaisyDisk_Public/DaisyDisk.dmg'
end

dep 'ExpanDrive.app' do
  source 'http://www.expandrive.com/ExpanDrive.zip'
end

dep 'TextMate.app' do
  source 'http://download.macromates.com/TextMate_1.5.10.zip'
end

dep 'VLC.app' do
  source 'http://sourceforge.net/projects/vlc/files/1.1.11/macosx/vlc-1.1.11.dmg/download'
end

dep 'xScope.app' do
  source 'http://iconfactory.com/assets/software/xscope/xScope_251.zip'
end




# Non-Standard Apps
# -----------------
dep 'SIMBL.installer' do
  source 'http://www.culater.net/dl/files/SIMBL-0.9.9.zip'
  met? { '/Library/ScriptingAdditions/SIMBL.osax'.p.exists? }
end
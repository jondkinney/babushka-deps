dep 'HEXColorPicker' do
  require "FileUtils"
  met? {
    "~/Library/ColorPickers/HexColorPicker.colorPicker".p.exists?
  }

  before {
    log_shell "Creating the ~/Library/ColorPickers directory", "mkdir -p ~/Library/ColorPickers"
    log_shell("Downloading ~/Downloads/colorpicker.zip", "curl 'http://wafflesoftware.net/hexpicker/download/HexColorPicker-1.6.1.zip' -o ~/Downloads/colorpicker.zip")
    log_shell("Unzipping","unzip -o ~/Downloads/colorpicker.zip -d ~/Downloads")
  }

  meet {
    log "Moving HexColorPicker.colorPicker into place"
    FileUtils.cp_r("/Users/`whoami`/Downloads/Hex Color Picker/HexColorPicker.colorPicker/", "/Users/`whoami`/Library/ColorPickers/")
    # "~/Downloads/Hex Color Picker/HexColorPicker.colorPicker/".p.copy("~/Library/ColorPickers")

    after {
      log "Cleaning up"
      "~/Downloads/Hex Color Picker".p.remove
      "~/Downloads/colorpicker.zip".p.remove
      "~/Downloads/__MACOSX".p.remove
    }
  }  
end
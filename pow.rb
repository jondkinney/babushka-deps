dep 'Pow' do
  met? {
    "~/Library/Application Support/Pow/Current".p.exists?
  }

  meet {
    log_shell "Installing Pow", "curl get.pow.cx | sh"
  }
end
dep 'rvm' do
  met? {
    "~/.rvm/scripts/rvm".p.file?
  }

  meet {
    shell 'bash -c "`curl https://rvm.beginrescueend.com/install/rvm`"'
    shell "echo \"
# RVM
[[ -s '/Users/`whoami`/.rvm/scripts/rvm' ]] && source '/Users/`whoami`/.rvm/scripts/rvm'\" >> /etc/bashrc
  source /etc/bashrc"
  }
end

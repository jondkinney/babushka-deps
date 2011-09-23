dep 'mysql', :template => 'managed'

dep 'mysql configured' do
  requires 'mysql'
  shell 'sudo mysql_install_db --basedir="$(brew --prefix mysql)"'
end
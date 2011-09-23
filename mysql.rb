dep 'mysql', :template => 'managed'

dep 'mysql configured' do
  requires 'mysql'
  shell "unset TMPDIR"
  shell 'sudo mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp'
  log_shell "Starting MySQL", "mysql.server start"
end
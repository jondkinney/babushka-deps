dep 'mysql.managed' do
  before {
    log_shell "unset TMPDIR", "unset TMPDIR"
    log_shell "Executing mysql_install_db with custom flags", 'sudo mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp'
    log_shell "Starting MySQL", "mysql.server start"
  }
end
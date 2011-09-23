dep 'mysql.managed' do

  unless "/usr/local/var/mysql".p.exists?
    log "This is your first install"
    log_shell "unset TMPDIR", "unset TMPDIR"
    log_shell "Executing mysql_install_db with custom flags", 'sudo mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp'
  end

  log_shell "Starting MySQL", "mysql.server start"
end
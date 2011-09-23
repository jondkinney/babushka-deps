dep 'mysql.managed' do
  provides "mysql"
end

dep 'mysql configured' do
  requires 'mysql.managed'
  met? { "/usr/local/var/mysql".p.exists? }
  meet {
    shell "unset TMPDIR"
    shell 'sudo mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp'
    log_shell "Starting MySQL", "mysql.server start"
  }
end
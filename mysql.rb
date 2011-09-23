dep 'mysql', :template => 'managed'

dep 'mysql configured' do
  requires 'mysql'
  def my_cnf
    '/etc/my.cnf'
  end
  met? { "/etc/my.cnf".p.exists?  }
  meet {
    render_erb 'mysql/my.cnf', :to => my_cnf, :sudo => true
    shell 'sudo mysql_install_db'
  }
end
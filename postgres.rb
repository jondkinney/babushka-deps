dep 'postgres', :template => 'managed'

dep 'postgres configured' do
  requires 'postgres'
  def pg_db
    '/usr/local/var/postgres'
  end
  met? { pg_db.p.exists?  }
  meet {
    log "This is your first install, creating the postgres database at /usr/local/var/postgres"
    shell "initdb #{pg_db}"
  }
end
  
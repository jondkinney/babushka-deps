dep 'postgres', :template => 'managed'

dep 'postgres configured' do
  requires 'postgres'
  helper(:pg_db) { '/usr/local/var/postgres' }
  met? { pg_db.p.exists?  }
  meet {
    log "This is your first install, creating the postgres database at /usr/local/var/postgres"
    shell 'initdb /usr/local/var/postgres'
  }
end
  
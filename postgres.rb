dep 'postgresql.managed' do
  provides "psql"
  
  after {
    unless "/usr/local/var/postgres".p.exists?
      log "This is your first install, creating the postgres database at /usr/local/var/postgres"
      shell "initdb /usr/local/var/postgres"
    end
  
    log_shell "Starting PostgreSQL", "pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"    
  }
end
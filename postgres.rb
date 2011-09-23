dep 'postgresql.managed' do
  provides "psql"
  
  after {
    log "This is your first install, creating the postgres database at /usr/local/var/postgres"
    shell "initdb /usr/local/var/postgres"
    log_shell "Starting PostgreSQL", "pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"    
  }
end
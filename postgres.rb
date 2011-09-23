dep 'postgresql.managed' do
  provides "psql"
end

dep 'postgres configured' do
  requires 'postgresql.managed'
  met? { "/usr/local/var/postgres".p.exists? }
  meet {
    log "This is your first install, creating the postgres database at /usr/local/var/postgres"
    shell "initdb /usr/local/var/postgres"
  }
end
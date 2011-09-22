dep 'ack.managed'

dep 'git.managed'

dep 'growlnotify.managed'

dep 'imagemagick.managed' do
  provides 'convert'
end

dep 'redis', :template => 'managed' do
  provides 'redis-cli'
end

dep 'sphinx.managed' do
  provides 'searchd'
end

dep 'tig.managed'

dep 'tmux.managed'

dep 'tree.managed'

dep 'wget', :template => 'managed'

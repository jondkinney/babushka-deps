dep 'macvim', :template => 'managed' do
  provides 'mvim'
end

dep 'tmux', :template => 'managed'

dep 'git.managed'

dep 'tig.managed'

dep 'growlnotify.managed'

dep 'redis', :template => 'managed' do
  provides 'redis-cli'
end

dep 'ack.managed'

dep 'tmux.managed'

dep 'wget', :template => 'managed'

dep 'imagemagick.managed' do
  provides 'convert'
end

dep 'sphinx.managed' do
  provides 'searchd'
end

dep 'tree.managed'
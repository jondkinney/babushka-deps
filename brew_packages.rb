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

dep 'wget.managed'

dep 'brew_packages' do
  requires 'ack.managed',
           'git.managed',
           'growlnotify.managed',
           'imagemagick.managed',
           'redis',
           'sphinx.managed',
           'tig.managed',
           'tmux.managed',
           'tree.managed',
           'wget.managed'
end
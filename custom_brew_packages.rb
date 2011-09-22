dep 'imagemagick.managed' do
  provides 'convert'
end

dep 'redis', :template => 'managed' do
  provides 'redis-cli'
end

dep 'sphinx.managed' do
  provides 'searchd'
end
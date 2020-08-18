Gem::Specification.new do |s|
  s.name = 'chronic_between'
  s.version = '0.4.0'
  s.summary = 'chronic_between'
  s.files = Dir['lib/chronic_between.rb']
  s.authors = ['James Robertson']
  s.add_runtime_dependency('chronic', '~> 0.10', '>=0.10.2')
  s.add_runtime_dependency('app-routes', '~> 0.1', '>=0.1.19') 
  s.signing_key = '../privatekeys/chronic_between.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/chronic_between'
  s.required_ruby_version = '>= 2.1.2'
end

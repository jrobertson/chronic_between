Gem::Specification.new do |s|
  s.name = 'chronic_between'
  s.version = '0.2.11'
  s.summary = 'chronic_between'
  s.files = Dir['lib/**/*.rb']
  s.authors = ['James Robertson']
  s.add_dependency('chronic')
  s.add_dependency('app-routes') 
  s.signing_key = '../privatekeys/chronic_between.pem'
  s.cert_chain  = ['gem-public_cert.pem']
end

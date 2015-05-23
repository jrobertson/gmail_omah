Gem::Specification.new do |s|
  s.name = 'gmail_omah'
  s.version = '0.1.0'
  s.summary = 'Gmail gem + Omah (Offline Mail Helper) gem'
  s.authors = ['James Robertson']
  s.files = Dir['lib/gmail_omah.rb']
  s.add_runtime_dependency('omah', '~> 0.4', '>=0.4.0')
  s.add_runtime_dependency('gmail', '~> 0.5', '>=0.5.0')
  s.add_runtime_dependency('sps-pub', '~> 0.4', '>=0.4.0')  
  s.signing_key = '../privatekeys/gmail_omah.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/gmail_omah'
end
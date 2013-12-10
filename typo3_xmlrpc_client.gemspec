$LOAD_PATH.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name              = "typo3_xmlrpc_client"
  s.version           = "1.0.0"
  s.platform          = Gem::Platform::RUBY
  s.author            = "Anton Evangelatov"
  s.email             = ["anton.evangelatov@gmail.com"]
  s.homepage          = "https://github.com/nonsense/typo3_xmlrpc_client"
  s.summary           = ""
  s.description       = ""
  s.license           = "GPLv2"
  s.required_ruby_version = ">= 1.9.2"

  s.files = "lib/typo3_xmlrpc_client.rb"
  s.files += Dir["lib/typo3_xmlrpc_client/**"]
end

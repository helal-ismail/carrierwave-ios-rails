$:.push File.expand_path("../lib", __FILE__)

require "carrierwave_ios_rails/version"

Gem::Specification.new do |s|
  s.name        = "carrierwave_ios_rails"
  s.version     = CarrierwaveIosRails::VERSION
  s.authors     = ["Netguru"]
  s.email       = ["netguru@netguru.co"]
  s.homepage    = "http://github.com/netguru/carrierwave-ios-rails"
  s.summary     = "Integrates Carrierwave with iOS."
  s.description = "Integrates Carrierwave with iOS."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 4.0.0", "<= 4.2.0"
  s.add_dependency "carrierwave"
  s.add_dependency "decent_exposure"
  s.add_dependency "responders"

  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "pry"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency 'rspec-rails'

end

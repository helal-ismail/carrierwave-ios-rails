module CarrierwaveIosRails
  class Engine < ::Rails::Engine
    require 'carrierwave'
    require 'decent_exposure'

    isolate_namespace CarrierwaveIosRails

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    def self.app_path
      File.expand_path('../../app', called_from)
    end

    %w{controller helper mailer model}.each do |resource|
      class_eval <<-RUBY
    def self.#{resource}_path(name)
      File.expand_path("#{resource.pluralize}/carrierwave_ios_rails/\#{name}.rb", app_path)
    end
    RUBY
  end

end
end

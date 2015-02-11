Carrierwave iOS
=========================================

Gem that provides API to Carrierwave, built with Ruby on Rails.

Example app using the gem: https://github.com/netguru/carrierwave-ios-rails-example

API
===================

If you have succesfully installed and configured the gem inside of your project you should get an access to Carrierwave API.

Here is the list of endpoints:
```
                 index attachments - GET      /ios-api/api/v1/attachments
                 create attachment - POST     /ios-api/api/v1/attachments
                   show attachment - GET      /ios-api/api/v1/attachments/:id
  directly download the attachment - GET      /ios-api/api/v1/attachments/:id/download
                 delete attachment - DELETE   /ios-api/api/v1/attachments/:id
         view supported extensions - GET      /ios-api/api/v1/attachments/supported_extensions
```

You can test the API with some old school curl commands:
- View all attachments
```bash
 curl http://localhost:3000/ios-api/api/v1/attachments
```
- Create attachment
```bash
curl --form attachment[file]=@/Path/to/file.png http://localhost:3000/ios-api/api/v1/attachments
```
- View created attachment
```bash
curl http://localhost:3000/ios-api/api/v1/attachments/<created attachment id>
```

After the attachment has been created, you can directly download it using this address:
`http://localhost:3000/ios-api/api/v1/attachments/<created attachment id>/download`

Config
==================

### Required

| Name |  Version |
| :--: | :---: |
| [Ruby][ruby] | 2.1.5 |
| [Ruby on Rails][rails] | 4.1.8 |

You can find some guidelines on how to install the above [on mac][mac_guidelines] and [on ubuntu][ubuntu_guidelines]

### Recommended

Install git - on mac: `brew install git`, on ubuntu: `apt-get install git`


Getting started
===================
The gem works with Rails 4+. You can add it to your Gemfile with:
```ruby
gem 'carrierwave_ios_rails', :git => 'git@github.com:netguru/carrierwave-ios-rails.git'
```
§
Run the bundle command to install it.

After that, you need to copy migrations and migrate them.
```
rake carrierwave_ios_rails:install:migrations
rake db:migrate
```

You also need to configure your carrierwave by creating `config/initializers/carrierwave.rb` and filling it with your configuration.
You can follow that example: https://github.com/carrierwaveuploader/carrierwave#configuring-carrierwave
or use our example:
```ruby
CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :file
  end
end
```
Inside your project create file `.env` and fill it with proper values.
```ruby
MAIN_NAME='example.com'
DOMAIN_URL='http://example.com'
ROLLBAR_SERVER_TOKEN=''
SECRET_KEY_BASE='generate this by running `rake secret`'
DEFAULT_SENDER='no-reply@no-reply.com'
```

You need to add this line to `routes.rb` of your project:
```ruby
  mount CarrierwaveIosRails::Engine => "/ios-api"
```

If you want to add your own list of supported extensions, add initializer containing monkey patching class:
```ruby
require CarrierwaveIosRails::Engine.root.join('app', 'uploaders','file_uploader')
class FileUploader
  def self.supported_extensions
    %w(jpg jpeg mp3)
  end
end
```


Info
============

### Authentication

By default GEM doesn't implement any specific authentication mechanism, so if you want to authenticate the requests, you will have to implement it by yourself.


Contribution
============

First, thank you for contributing!

Copy `spec/dummy/.env.sample` to `spec/dummy/.env` and fill it with proper values and save it as `.env`


Here's a few guidelines to follow:

- we follow [Ruby Style Guide][ruby_style_guides].
- you can use [rubocop][rubocop] which can be easily integrated with popular editors. ([our rubocop config][rubocop_config])
- keep gems up to date - you can use [gemsurance][gemsurance] to check for outdated gems - simply run `bundle exec gemsurance`.
- write tests
- make sure the entire test suite passes
- make sure rubocop passes our config
- open a pull request on GitHub
- [squash your commits][squash_commits] after receiving feedback

Copyright  2015 © [Netguru][netguru_url], released under the New BSD License

[ruby]: https://www.ruby-lang.org
[rails]: http://www.rubyonrails.org
[postgres]: http://www.postgresql.org
[ios_devise]: https://github.com/netguru/devise-ios
[mac_guidelines]: https://gorails.com/setup/osx/10.10-yosemite
[ubuntu_guidelines]: https://gorails.com/setup/ubuntu/14.10
[postgres_guidelines]: https://wiki.postgresql.org/wiki/Detailed_installation_guides
[spring]: https://github.com/rails/spring
[ruby_style_guides]: https://github.com/bbatsov/ruby-style-guide
[rubocop]: https://github.com/bbatsov/rubocop
[rubocop_config]: https://github.com/netguru/hound/blob/master/config/rubocop.yml
[gemsurance]: https://github.com/appfolio/gemsurance
[squash_commits]: http://blog.steveklabnik.com/posts/2012-11-08-how-to-squash-commits-in-a-github-pull-request
[netguru_url]: https://netguru.co

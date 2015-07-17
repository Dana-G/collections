require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "e94cc60c9a15cb57b2d9c413a393e72ae09725d97f9951b947661a25002a45ab"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('spec/factories/dragonfly', Rails.env),
    server_root: Rails.root.join('spec')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end

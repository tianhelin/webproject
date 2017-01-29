Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['app_id'], ENV['secret']
end
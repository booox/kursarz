OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '5d5c6f51ec961af04433', '44e68aa54d21e32781bd8e5c8d236220d936f21b'
end

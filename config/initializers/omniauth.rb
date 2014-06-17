OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.secrets.github_client_id, Rails.application.secrets.github_client_secret
  provider :bitbucket, Rails.application.secrets.bitbucket_client_id, Rails.application.secrets.bitbucket_client_secret
end

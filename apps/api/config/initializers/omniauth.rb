Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 
    ENV.fetch('GITHUB_APP_CLIENT_ID', ''), 
    ENV.fetch('GITHUB_APP_CLIENT_SECRET', ''),
    scope: 'user,repo,read:org'
end
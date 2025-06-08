Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  
  # OAuth
  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  # GitHub Webhooks
  post "/webhooks/github", to: "webhooks#github"
  
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end

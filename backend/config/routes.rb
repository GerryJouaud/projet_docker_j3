# This file defines the HTTP routes for your Rails API
# It maps URLs to controller actions
Rails.application.routes.draw do
  # Simple health check endpoint for Docker/K8s monitoring
  get '/health', to: proc { [200, {}, ['{"status":"ok"}']] }, defaults: { format: :json }

  # API namespace for versioning and organization
  namespace :api do
    # RESTful routes for users and posts resources
    resources :users, only: [:index, :show, :create, :update, :destroy]
    resources :posts, only: [:index, :show, :create, :update, :destroy]
  end
end

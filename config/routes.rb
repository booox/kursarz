Rails.application.routes.draw do
  root "landing#show"

  resource :landing, only: :show

  get 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
end

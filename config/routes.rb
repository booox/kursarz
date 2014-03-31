Rails.application.routes.draw do
  root "landing#show"

  resource :landing, only: :show

  resources :courses, only: [:index, :show]

  get 'logout', to: 'sessions#destroy'
  get 'auth/github/callback', to: 'sessions#github'
  get 'auth/bitbucket/callback', to: 'sessions#bitbucket'
  get 'auth/failure', to: 'sessions#failure'
end

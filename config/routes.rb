Rails.application.routes.draw do
  root "landing#show"

  resource :landing, only: :show


	resources :courses, only: [:index, :show, :create, :new] do
		resources :lessons, only: [:index, :show, :create, :new, :destroy]
    resources :assignments, only: [:index, :show, :create, :new]
    resources :course_signups, only: [:create]
	end

  get 'logout', to: 'sessions#destroy'
  get 'auth/github/callback', to: 'sessions#github'
  get 'auth/bitbucket/callback', to: 'sessions#bitbucket'
  get 'auth/failure', to: 'sessions#failure'
end


Rails.application.routes.draw do
  root "landing#show"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resource :landing, only: :show

  resource :user, only: [:edit, :update], scope: :users

  get :search, to: "searches#search"

  namespace :user do
    resources :courses, only: [:index]
  end

	resources :courses do
		resources :lessons
    resources :assignments do
      resources :assignment_submissions, only: [:show, :create, :new]
    end
    resources :quizzes, only: [:index, :show, :create, :new, :destroy] do
      resources :quiz_submissions, only: [:create, :show]
    end
    resources :course_signups, only: [:create, :destroy]
    resources :course_teachers, only: [:create, :destroy]
	end

  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :edit, :update]
  end

  get 'logout', to: 'sessions#destroy'
  get 'auth/github/callback', to: 'sessions#github'
  get 'auth/bitbucket/callback', to: 'sessions#bitbucket'
  get 'auth/failure', to: 'sessions#failure'
end


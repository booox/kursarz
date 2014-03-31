Rails.application.routes.draw do
  root "landing#show"

  resource :landing, only: :show
end

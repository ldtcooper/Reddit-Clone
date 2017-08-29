Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#
#   Prefix Verb   URI Pattern            Controller#Action

#  users POST   /users(.:format)       users#create
# new_user GET    /users/new(.:format)   users#new

# new_session GET    /session/new(.:format) sessions#new
# session DELETE /session(.:format)     sessions#destroy
#        POST   /session(.:format)     sessions#create
end

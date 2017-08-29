Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy] do
    resources :posts, only: [:index]
  end
  resources :posts, except: [:index]

end

# Prefix Verb   URI Pattern                   Controller#Action

#       users POST   /users(.:format)              users#create
#    new_user GET    /users/new(.:format)          users#new


# new_session GET    /session/new(.:format)        sessions#new
#     session DELETE /session(.:format)            sessions#destroy
#             POST   /session(.:format)            sessions#create


#        subs GET    /subs(.:format)               subs#index
#             POST   /subs(.:format)               subs#create
#     new_sub GET    /subs/new(.:format)           subs#new
#    edit_sub GET    /subs/:id/edit(.:format)      subs#edit
#         sub GET    /subs/:id(.:format)           subs#show
#             PATCH  /subs/:id(.:format)           subs#update
#             PUT    /subs/:id(.:format)           subs#update


#   sub_posts GET    /subs/:sub_id/posts(.:format) posts#index

#       posts POST   /posts(.:format)              posts#create
#    new_post GET    /posts/new(.:format)          posts#new
#   edit_post GET    /posts/:id/edit(.:format)     posts#edit
#        post GET    /posts/:id(.:format)          posts#show
#             PATCH  /posts/:id(.:format)          posts#update
#             PUT    /posts/:id(.:format)          posts#update
#             DELETE /posts/:id(.:format)          posts#destroy

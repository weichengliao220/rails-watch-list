Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]

  root to: 'lists#index'

  # # As a user, can see all my movie lists
  # get 'lists', to: 'lists#index', as: :lists

  # # As a user, can create a movie list
  # get 'lists/new', to: 'lists#new', as: :new_list
  # post 'lists', to: 'lists#create'

  # # As a user, can see the details of a movie list
  # get 'lists/:id', to: 'lists#show', as: :list

  # # As a user, can bookmark a movie inside a movie list
  # get 'lists/:gener/edit', to: 'lists#edit', as: :edit_restaurant
  # patch 'lists/:genre', to: 'lists#update'

  # # As a user, can destroy a bookmark
  # delete '/bookmarks/:id', to: 'bookmarks#destroy'
end

# https://cli-auth.heroku.com/auth/cli/browser/71907fdb-e7d4-40bc-bf9d-e62f408f142e?requestor=SFMyNTY.g2gDbQAAAA8yMjMuMTM1LjIwMC4xMDFuBgDwKvotkwFiAAFRgA.yGPzQIzLwSQYFsLkKP9_UdRitvmrf4_OvcuSHLdRFgg
# https://movie-lists-a528da53ad1e.herokuapp.com/ | https://git.heroku.com/movie-lists.git

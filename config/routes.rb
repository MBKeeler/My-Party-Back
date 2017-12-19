# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[index show]
  resources :beverages, only: %i[index show create update destroy index_user_beverages index_by_occasion]
  resources :examples, except: %i[new edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  get '/users/:id/beverages' => 'beverages#show'
  get '/users/:id/beverages' => 'beverages#index_user_beverages'
  # routes for beverages_by
  get '/beverages/:occasion' => 'beverages#index_by_occasion'
end

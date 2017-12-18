# frozen_string_literal: true

Rails.application.routes.draw do
  resources :beverages, only: %i[index show create update destroy indexuserbeverages indexbyoccasion]
  resources :examples, except: %i[new edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  get 'beverages/index_by_occasion'
  get 'beverages/index_user_beverages'
  resources :users, only: %i[index show]
end

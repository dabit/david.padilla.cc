Rails.application.routes.draw do
  devise_for :users
  mount Crowdblog::Engine => '/'

  resources :posts, only: [:show], controller: 'crowdblog/posts'
end

Rails.application.routes.draw do
  get 'archive/index'

  devise_for :users
  mount Crowdblog::Engine => '/'

  get '/about-me', to: 'crowdblog/posts#show', defaults: { id: 'about-me' },
    as: 'about_me'

  resources :posts, only: [:show], controller: 'crowdblog/posts'
  resources :previews, only: [:show]

  get '/archive', to: 'archive#index'

  get 'sitemap.(:format)', to: 'sitemap#show'
end

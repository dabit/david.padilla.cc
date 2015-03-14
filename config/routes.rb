Rails.application.routes.draw do
  devise_for :users
  mount Crowdblog::Engine => '/'

  get '/about-me', to: 'crowdblog/posts#show', defaults: { id: 'about-me' },
    as: 'about_me'

  resources :posts, only: [:show], controller: 'crowdblog/posts'

  get 'sitemap.(:format)', to: 'sitemap#show'
end

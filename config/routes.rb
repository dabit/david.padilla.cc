Rails.application.routes.draw do
  get 'archive/index'

  devise_for :users
  mount Miniblog::Engine => '/'

  get '/about-me', to: 'cms#show', defaults: { id: 'about-me' },
    as: 'about_me'

  get '/archive', to: 'archive#index'

  get 'sitemap.(:format)', to: 'sitemap#show'
  get 'atom.(:format)', to: 'feeds#show', as: 'atom_feed'
end

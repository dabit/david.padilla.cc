Rails.application.routes.draw do
  devise_for :users
  mount Crowdblog::Engine => '/'
end

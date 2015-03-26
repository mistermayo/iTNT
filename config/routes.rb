Rails.application.routes.draw do
  devise_for :users
  root :to => 'spots#index'

  resources :spots do
    resources :photos, only: [:new, :create]
  end

  get "/browse" => "spots#browse"
  post "/browse" => "spots#browse"
end

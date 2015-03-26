Rails.application.routes.draw do
  devise_for :users
  root :to => 'spots#index'

  resources :spots

  get "/browse" => "spots#browse"
  post "/browse" => "spots#browse"
end

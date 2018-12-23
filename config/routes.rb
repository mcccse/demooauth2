Rails.application.routes.draw do
  get "home/index"

  resources :buckets

  root "home#index"
end

Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}
  get "home/index"

  resources :buckets do
    resources :notes
  end

  root "home#index"
end

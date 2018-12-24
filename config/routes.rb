Rails.application.routes.draw do
  get "home/index"

  resources :buckets do
    resources :notes
  end

  root "home#index"
end

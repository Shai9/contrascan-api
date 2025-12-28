Rails.application.routes.draw do
  resources :contracts, only: [:create]
end

namespace :api do
  namespace :v1 do
    resources :contracts, only: [:create, :show]
  end
end
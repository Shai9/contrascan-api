Rails.application.routes.draw do
  resources :contracts, only: [:create, :show] do
    member do
      get :report
    end
  end
end


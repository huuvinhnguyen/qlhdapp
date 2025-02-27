Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :manufactures
  resources :payments do
    collection do
      get :manufactures
      get :last_payment
    end
  end
  resources :contracts do
    resources :payments, only: [:new, :create, :index, :destroy]
    resources :paid_lists, only: [:index, :new, :create, :destroy]
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

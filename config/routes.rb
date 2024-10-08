Rails.application.routes.draw do
  resources :roles
  resources :posts
  resources :permissions
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'posts#index', as: :authenticated_root
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"

end

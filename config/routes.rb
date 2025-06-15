Rails.application.routes.draw do
  get "about", to: "pages#about", as: "about"
  get "portfolio", to: "pages#portfolio", as: "portfolio"
  get "products", to: "pages#products", as: "products"
  get "contact", to: "pages#contact", as: "contact"
  post "contact", to: "contacts#create"
  devise_for :users, skip: [ :registrations ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "pages#home"
  resources :products, only: [ :show ]

  namespace :admin do
    root "dashboard#index"
    delete "portfolio/photo/:id", to: "portfolios#destroy_photo", as: :destroy_portfolio_photo
    resource :portfolio, except: [ :index, :new, :create, :destroy ]
    resources :products, except: [ :show, :index ]
  end
end

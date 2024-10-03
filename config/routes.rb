Rails.application.routes.draw do
  get "home/index"
  root to: 'home#index' # Create a home controller for the landing page
  get 'receptionist', to: 'receptionists#index' # Adjust as necessary
  get 'doctor', to: 'doctors#index' # Adjust as necessary
  get 'doctors_patient/:id', to: 'doctors#show', as: 'doctors_patient'
  # get 'doctors/patients', to: 'doctors#patients', as: 'doctor_patients'
  get 'doctors/dashboard', to: 'doctors#dashboard', as: 'doctor_dashboard'
  get 'doctor/dashboard', to: 'doctors#dashboard'
  
  devise_for :users
  resources :patients
  resources :doctors
  resources :receptionists
  # root 'patients#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end

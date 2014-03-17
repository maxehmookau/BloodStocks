BloodStocks::Application.routes.draw do
  resources :records
  resources :blood_types
  root to: 'static#index'
end

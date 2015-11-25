Rails.application.routes.draw do
  resources :orders, only: :index
  resources :csv_exports, only: [:create, :show]
end

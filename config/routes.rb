Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :boards
  resources :tickets
  root "boards#index"

  get "/boards/appel_aja", to: "boards#appel_aja"

end

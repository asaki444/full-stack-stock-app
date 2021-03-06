Rails.application.routes.draw do
  get '/', to: 'static#index'
  resources :sessions,  only: [:create]
  resources :registrations, only: [:create]
  resources :transactions, only: [:create, :index]
  resources :stocks, only: [:index]

  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create]

  get '/register', to: 'users#new'
  get '/register/success', to: 'users#success'
end

Rails.application.routes.draw do
  root to: 'flights#index'
  get '/airports', to: redirect('/flights')

  resources :flights
  # resources :airports
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

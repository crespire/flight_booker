Rails.application.routes.draw do
  root to: 'flights#index'
  get '/airports', to: redirect('/flights')

  resources :flights, only: :index
  resources :bookings, only: %i[show create new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  resources :iterations, only: %i[index show create]
  root to: 'home#welcome'
end

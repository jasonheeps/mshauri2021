Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#welcome'

  resources :users, only: [:create]
  resources :questions, only: %i[index show]
  resources :iterations, only: %i[index show create]
  resources :recommendations, only: %i[show] do
    # collection do
    #   get :all
    # end
  end

  get '/admin_board/:user_slug', to: 'admin#home', as: :admin_home
  get '/admin_login/:user_slug/', to: 'admin#login', as: :admin_login
  

  get '/:user_slug', to: 'home#index', as: :home
  get '/:user_slug/i/:iteration_id/questions/:question_id', to: 'questions#show', as: :iteration_question
  get '/:user_slug/i/:iteration_id/recommendations', to: 'recommendations#index', as: :recommendations

  # recommendations route from original app
  # get '/:user_slug/i/:iteration_id/recommendations', to: 'home#index', as: :recommendations
end

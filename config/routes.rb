Rails.application.routes.draw do
  root to: 'home#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :questions, only: %i[index show]
  resources :iteration_answers, only: %i[index create]
  resources :recommendations, only: %i[show] do
    # collection do
    #   get :all
    # end
  end

  get '/:user_slug/i/:iteration_id/questions/:question_id', to: 'questions#show', as: :iteration_question
  get '/:user_slug/i/:iteration_id/recommendations', to: 'recommendations#index', as: :recommendations

  # recommendations route from original app
  # get '/:user_slug/i/:iteration_id/recommendations', to: 'home#index', as: :recommendations

end

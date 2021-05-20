Rails.application.routes.draw do
<<<<<<< HEAD

  resources :iterations, only: %i[index show create]
  root to: 'home#welcome'

=======
>>>>>>> bffbfc7c8ccfec66e5a5983115a52bc6199208a5
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#welcome'

  resources :users, only: [:create]
  resources :questions, only: %i[index show]
  resources :iteration_answers, only: %i[index create]

  get '/:user_slug', to: 'home#index', as: :home
  get '/:user_slug/i/:iteration_id/questions/:question_id', to: 'questions#show', as: :iteration_question
end

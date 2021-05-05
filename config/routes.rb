Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#welcome'

  resources :users, only: [:create]
  resources :questions, only: %i[index show]
  resources :iteration_answers, only: %i[index create]

  get '/:user_slug/i/:iteration_id/questions/:question_id', to: 'questions#show', as: :iteration_question
end

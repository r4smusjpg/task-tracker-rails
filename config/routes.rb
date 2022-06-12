Rails.application.routes.draw do
  resources :projects, :tasks
  resources :users, only: %i[show new edit create update]

  resource :session, only: %i[new create]
  get '/sign-out', to: 'sessions#destroy'


  root 'projects#index'
end

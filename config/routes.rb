Rails.application.routes.draw do
  resources :projects, :tasks

  resources :users, only: %i[new edit create update]
  get '/profile', to: "users#show"
  get '/profile/edit', to: "users#edit" 

  resource :session, only: %i[new create]
  delete '/sign-out', to: 'sessions#destroy'


  root 'projects#index'
end

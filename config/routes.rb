Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'
  
  resources :projects
  resources :tasks do
    resources :comments, only: %i[create edit update destroy]
  end

  resources :users, only: %i[new edit create update]
  get '/sign-up', to: 'users#new'
  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit' 

  resource :session, only: %i[new create]
  get '/sign-in', to: 'sessions#new'
  delete '/sign-out', to: 'sessions#destroy'

  root 'sessions#new'
end

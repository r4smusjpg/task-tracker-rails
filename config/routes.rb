Rails.application.routes.draw do
  resources :projects, :tasks
  resources :users, only: %i[show new create edit update]

  resource :session, only: %i[new create destroy]

  root 'projects#index'
end

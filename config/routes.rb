Rails.application.routes.draw do
  root 'pages#home'
  get 'survey/new', to: 'pages#survey', as: :new_survey
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
end

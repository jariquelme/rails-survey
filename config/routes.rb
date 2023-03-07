Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'survey_response/create'
    end
  end

  get 'survey/new', to: 'pages#survey', as: :new_survey
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'pages#home'
end

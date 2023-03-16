Rails.application.routes.draw do
  resources :survey_responses, only: [:index, :show, :new]
  namespace :api do
    namespace :v1 do
      post 'survey_response/create'
    end
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'pages#home'
end

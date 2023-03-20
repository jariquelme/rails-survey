Rails.application.routes.draw do

  resources :departments, excerpt: [:show] do
    collection do
      get :teams
    end
  end

  resources :survey_responses, only: [:index, :show, :new]

  get 'profile' => 'profiles#edit'
  patch 'profile' => 'profiles#update'

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

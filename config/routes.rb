Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "pomodoro", to: "pomodoro#index"
  resource :profile, only: [ :show, :new, :create, :edit, :update, :destroy ] do
    resource :address, only: %i[ show create update ]
    resources :educations
    resources :experiences
    resources :certifications, only: %i[ new create edit update destroy ]
    resources :skills, only: %i[ new create edit update destroy ]
    resources :languages, only: %i[ new create edit update destroy ]
  end
end

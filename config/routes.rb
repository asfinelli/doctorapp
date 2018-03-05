Rails.application.routes.draw do

  devise_for :doctors

  devise_for :users


  authenticated :user do
    root to: 'user_sessions#show'
  end


  authenticated :doctor do
    root to: 'doctor_sessions#show'
  end


  resources :user_sessions


  resources :doctor_sessions


  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

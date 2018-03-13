Rails.application.routes.draw do

  get 'doctors/index'

  get 'doctors/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :doctors

  devise_for :users
  resources :users


  authenticated :user do
    root to: 'user_sessions#show'
  end


  authenticated :doctor do
    root to: 'doctor_sessions#show'
  end


  resources :user_sessions
  resources :doctor_sessions

  resources :appointments

  root to: 'home#index'

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash


 resources :conversations do
   member do
     post :reply
     post :trash
     post :untrash
   end
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

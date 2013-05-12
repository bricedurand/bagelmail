BagelMail::Application.routes.draw do
  namespace :backoffice do
    resources :letters, :attachments
  end

  resources :letters, path: 'courriers'
  resource :account, path: 'mon-compte'
  resource :subscription, path: 'abonnement' do
    get :thank_you
    get :canceled
  end

  match "backoffice/letters/:id/send_email" => "backoffice/letters#send_email"

  devise_for :users, :controllers => { :registrations => :registrations, :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'connexion', :to => 'devise/sessions#new', :as => :new_user_session
  end

  root :to => "home#index"
end

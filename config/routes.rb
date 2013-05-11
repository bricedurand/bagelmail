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

  devise_for :users, :controllers => { :registrations => :registrations }
  devise_scope :user do
    get 'connexion', :to => 'devise/sessions#new', :as => :new_user_session
  end

  root :to => "home#index"
end

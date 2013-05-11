BagelMail::Application.routes.draw do
  namespace :backoffice do
    resources :letters, :attachments
  end

  resources :letters, path: 'courriers'
  resource :account, path: 'mon-compte'
  resource :subscription, path: 'abonnement'

  devise_for :users

  root :to => "home#index"
end

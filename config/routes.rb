BagelMail::Application.routes.draw do
  namespace :backoffice do
    resources :mails, :attachments
  end

  resources :mails, path: 'courriers'
  resource :account, path: 'mon-compte'
  resource :subscription, path: 'abonnement' do
    get :thank_you
    get :canceled
  end

  devise_for :users

  root :to => "home#index"
end

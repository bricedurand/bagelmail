BagelMail::Application.routes.draw do
  namespace :backoffice do
    resources :mails, :attachments
  end

  resources :mails

  devise_for :users

  root :to => "home#index"
end

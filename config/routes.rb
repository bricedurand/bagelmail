BagelMail::Application.routes.draw do
  namespace :backoffice do
    resources :mails
  end

  devise_for :users

  root :to => "home#index"
end

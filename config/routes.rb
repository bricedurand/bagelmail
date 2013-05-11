BagelMail::Application.routes.draw do
  resources :mails


  devise_for :users

  #root :to => "home#index"
end

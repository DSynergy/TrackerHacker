Rails.application.routes.draw do

  root 'boards#index'

  resources :boards

  namespace :boards do
    resources :tickets
  end

end

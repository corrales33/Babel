Rails.application.routes.draw do
  root :to => "site#welcome"
  resources :users do
    resources :meetings
  end
  resources :places do
  	resources :meetings
  end
  resources :guests
end

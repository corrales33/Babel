Rails.application.routes.draw do
  root :to => "users#welcome"
  resources :users_registered do
    resources :meetings
  end
  resources :places
  resources :users_not_registered
end

Rails.application.routes.draw do
  root :to => "site#welcome"
  resources :users do
    resources :meetings
  end
  resources :places do
  	resources :meetings
  end
  resources :guests
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end

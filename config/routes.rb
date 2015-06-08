Rails.application.routes.draw do
  root :to => "site#welcome"
  resources :users do
    resources :meetings
  end
  resources :places do
  	resources :meetings
  end
  resources :guests
  get 'signup' => 'site#signup' 
  get 'login_user' => 'sessions_user#new'
  post 'login_user' => 'sessions_user#create'
  delete 'logout_user' => 'sessions_user#destroy'
  get 'login_place' => 'sessions_place#new'
  post 'login_place' => 'sessions_place#create'
  delete 'logout_place' => 'sessions_place#destroy'
end

Rails.application.routes.draw do
  root :to => "site#welcome"
  post 'users/:user_id/meetings/:id' => 'meetings#assist_meeting'
  post 'users/:user_id/meetings/:id/confirm' => 'meetings#update_parameter', as: 'confirm'

  resources :users do
    resources :meetings
    resources :ratings
  end
  resources :places do
    resources :meetings
    resources :ratings
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

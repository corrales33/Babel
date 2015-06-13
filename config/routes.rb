Rails.application.routes.draw do
  root :to => "site#welcome"
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
  get 'users/:user_id/meetings/:id/add_video' => 'meetings#add_video', as: 'add_video'
  get 'users/:user_id/meetings/:id/save_participant' => 'meetings#save_participant', as: 'save_participant'
end

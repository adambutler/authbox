Rails.application.routes.draw do
  devise_for :users

  use_doorkeeper do
    controllers :applications => 'oauth/applications'
  end

  resources :authorized_users

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/unauthorized', to: 'static#unauthorized'
  get '/sign_in', to: 'static#sign_in'
  root 'static#landing'
end

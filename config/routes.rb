Rails.application.routes.draw do
  get '/new_session', to: 'session#new_session'
  get '/create', to: 'session#register_session'
  post '/get_token', to: 'session#get_token'
  post '/create_user', to: 'session#create'
  get '/logout', to: 'session#logout', as: 'logout'

  get '/', to: 'dashboard#index'
  get '/vehicles', to: 'dashboard#show'
  get '/new', to: 'dashboard#new'
  post '/create_task', to: 'dashboard#create_task'
  resources :dashboard, only: %i[destroy]
end

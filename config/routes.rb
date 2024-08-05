Rails.application.routes.draw do
  get '/new_session', to: 'session#new_session'
  get '/create', to: 'session#register_session'
  post '/get_token', to: 'session#get_token'
  post '/create_user', to: 'session#create'

  get '/', to: 'dashboard#index'
  get '/vehicles', to: 'dashboard#show'
end

Rails.application.routes.draw do
  root "welcome#index"
  get '/words', to: 'word#index'
  post '/word', to: 'word#new'
  get '/error', to: 'word#error'
  resources :word
end

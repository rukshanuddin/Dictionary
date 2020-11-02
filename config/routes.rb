Rails.application.routes.draw do
  root "welcome#index"
  get '/words', to: 'word#index'
  post '/word', to: 'word#new'
  resources :word
end

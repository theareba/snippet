Rails.application.routes.draw do
  root 'snippets#index'
  get '/search', to: 'snippets#search'
  resources :snippets
end

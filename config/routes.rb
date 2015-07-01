Rails.application.routes.draw do
  root 'snippets#index'
  resources :snippets
end

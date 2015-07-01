Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :snippets
    end
  end

  root 'snippets#index'
  get '/search', to: 'snippets#search'
  resources :snippets, except: [:edit, :destroy, :update]
end

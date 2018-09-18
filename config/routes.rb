Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/sign_up', to: 'users#new'

  namespace :api, format: 'json' do
    resources :tasks, only: %i[index create destroy]
  end
end

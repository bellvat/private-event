Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,  only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only:[:new,:create,:show,:index]
  post 'events/join', to: 'events#join', as: 'event_join'
end

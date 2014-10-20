ScratchClientPortal::Application.routes.draw do

  get 'eventvenue/index'
  get 'eventvenue/show'

root to: 'sessions#new'
  match '/venues', to: 'eventvenue#index', via: [:get, :post]
  match '/events', to: 'eventsuser#index', via: [:get, :post]
  match '/venue/events', to: 'eventvenue#show', via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match '/logout', to: 'sessions#destroy', as: 'logout', via: [:get, :post]
  resources :identities
  resources :venues, :has_many => :events
end
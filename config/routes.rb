ScratchClientPortal::Application.routes.draw do

  get 'eventvenue/index'
  get 'eventvenue/show'

root to: 'sessions#new'
  match '/venues', to: 'venues#index', via: [:get, :post]
  match '/events', to: 'events_user#index', via: [:get, :post]
  match '/past_events', to: 'events_user#show', via: [:get, :post]
  match '/past_clientevents', to: 'venues#past_events', via: [:get, :post]
  #eventvenue#show
  match '/venue/events', to: 'venues#show', via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match '/logout', to: 'sessions#destroy', as: 'logout', via: [:get, :post]
  resources :identities
  resources :venues, :has_many => :events
end
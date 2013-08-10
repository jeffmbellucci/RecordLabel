MusicInventory::Application.routes.draw do
  resources :bands
  resources :albums
  resources :tracks
  resource :sessions, :only => [:new, :create, :destroy]
  resource :users, :only => [:new, :create]
end
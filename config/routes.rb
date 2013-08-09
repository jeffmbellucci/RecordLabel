MusicInventory::Application.routes.draw do
  resources :bands
  resources :albums
  resources :tracks
end
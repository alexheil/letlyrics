Rails.application.routes.draw do
  
  root 'static_pages#home'

  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations",  unlocks: "users/unlocks"}

  devise_scope :user do
    get 'sign_out', to: 'users/sessions#destroy', path: 'sign-out'
    get 'sign_in', to: 'users/sessions#new', path: 'sign-in'
    get 'register', to: 'users/registrations#new'
    get 'edit_user_settings', to: 'users/registrations#edit', path: 'u/:user_id/settings/edit'
  end

  resources :users, controller: 'users/users', only: [:show], path: 'u'

  resources :artists, controller: 'artists/artists', only: :index

  # TODO: Change path to lyrics/artist/album/track
  resources :artists, controller: 'artists/artists', except: [:index, :new, :create], path: 'lyrics/' do
    resources :albums, controller: 'albums/albums', except: [:index, :new, :create], path: '' do
      resources :tracks, controller: 'tracks/tracks', except: [:index, :new, :create], path: ''
    end
  end

  # TODO: Change path to lyrics/new
  resources :tracks, controller: 'tracks/tracks', only: [:new, :create], path: 'add-lyrics/'

end

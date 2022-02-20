Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :profiles, only: %i[new create index show edit update] do
    get 'likes', on: :collection
    resource :like, only: %i[create destroy]
  end
  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  delete 'logout', to: 'user_sessions#destroy', as: :logout
end

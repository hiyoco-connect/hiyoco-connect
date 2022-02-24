Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :profiles, only: %i[new create index show edit update]

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  get 'terms', to: 'static_pages#terms'
  get 'policy', to: 'static_pages#policy'
  get 'contact', to: 'static_pages#contact'
end

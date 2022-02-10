Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :profiles, only: %i[new create index show edit update]
end

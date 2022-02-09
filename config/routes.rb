Rails.application.routes.draw do
  resources :profiles, only: %i[new create index show edit update]
end

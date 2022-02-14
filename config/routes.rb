Rails.application.routes.draw do
post "oauth/callback", to: "oauths#callback"
get "oauth/callback", to: "oauths#callback"
get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
root to: 'static_pages#top'
resources :profiles, only: %i[new create index show edit update]

end

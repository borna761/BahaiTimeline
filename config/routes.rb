Rails.application.routes.draw do
  resources :event_groups
  resources :event_types

  get "events" => "events#index"
  get "timeline" => "timeline#index"
  get "presentation" => "presentation#index"

  root "timeline#index"
end

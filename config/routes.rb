Rails.application.routes.draw do
  resources :event_groups
  resources :event_types

  get "events" => "events#index"
  get "timeline" => "timeline#index"
  get "calendar" => "calendar#index"
  get "about" => "about#index"

  root "timeline#index"
end

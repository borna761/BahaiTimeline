Rails.application.routes.draw do
  resources :event_groups
  resources :event_types

  get "events" => "events#index"
  get "timeline" => "timeline#index"
  get "presentation" => "presentation#index"
  get "events/:id/edit" => "events#edit", as: "edit_event"
  get "events/:id" => "events#show", as: "event"

  patch "events/:id" => "events#update"

  root "timeline#index"
end

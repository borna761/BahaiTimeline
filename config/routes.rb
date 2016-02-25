Rails.application.routes.draw do
  devise_for :admins
  resources :event_groups
  resources :event_types

  get "events" => "events#index"

  get "timeline" => "timeline#index"

  get "presentation" => "presentation#index"

  get "events/:id/edit" => "events#edit", as: "edit_event"
  get "events/:id" => "events#show", as: "event"
  patch "events/:id" => "events#update"

  get "calendar" => "calendar#index"

  get "about" => "about#index"

  root "timeline#index"
end

Rails.application.routes.draw do
  if Rails.env.production?
    devise_for :admins, :controllers => { :registrations => "registrations" }
  else
    devise_for :admins
  end
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

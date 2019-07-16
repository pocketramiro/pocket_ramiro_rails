Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :resources, only: [:index, :show, :create, :update]
      resources :tickets, only: [:index, :show]
      resources :parts, only: [:index, :show, :create, :update]

      namespace :resources do
        get ':id/tickets', to: 'tickets#index'
        get ':id/tickets/:ticket_id', to: 'tickets#show'
        post ':id/tickets', to: 'tickets#create'
        patch ':resource_id/tickets/:id', to: 'tickets#update'

        get ':resource_id/notes', to: 'notes#index'
        get ':resource_id/notes/:id', to: 'notes#show'
        post ':resource_id/notes', to: 'notes#create'
        patch ':resource_id/notes/:id', to: 'notes#update'
      end

      namespace :parts do
        get ':id/tickets', to: 'tickets#index'
      end

      resources :resource_types, only: [:index, :create, :show, :update]

      resources :users, only: [:show, :create, :update]
    end
  end
end

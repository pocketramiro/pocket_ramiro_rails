Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :resources, only: [:index, :show, :create, :update]

      get '/tickets', to: 'tickets#index'

      namespace :resources do
        get ':id/tickets', to: 'tickets#index'
        get ':id/tickets/:ticket_id', to: 'tickets#show'
        post ':id/tickets', to: 'tickets#create'

        get ':resource_id/notes', to: 'notes#index'
        get ':resource_id/notes/:id', to: 'notes#show'
        post ':resource_id/notes', to: 'notes#create'
        patch ':resource_id/notes/:id', to: 'notes#update'
      end

      namespace :parts do
        get ':id/tickets', to: 'tickets#index'
      end

      resources :resource_types, only: [:index, :create, :show, :update]
    end
  end
end

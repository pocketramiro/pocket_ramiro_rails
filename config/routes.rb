Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :resources, only: [:index, :show, :create, :update]

      get '/tickets', to: 'tickets#index'

      namespace :resources do
        get ':id/tickets', to: 'tickets#index'
        get ':id/tickets/:ticket_id', to: 'tickets#show'
        post ':id/tickets', to: 'tickets#create'

        get ':id/notes', to: 'notes#index'
        get ':id/notes/:note_id', to: 'notes#show'
      end

      namespace :parts do
        get ':id/tickets', to: 'tickets#index'
      end

    end
  end
end

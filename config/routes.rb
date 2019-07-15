Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/tickets', to: 'tickets#index'
    end
  end
  namespace :api do
    namespace :v1 do
      namespace :resources do
        get ':id/tickets', to: 'tickets#index'
        get ':id/tickets/:ticket_id', to: 'tickets#show'
        post ':id/tickets', to: 'tickets#create'
      end
    end
  end
  namespace :api do
    namespace :v1 do
      namespace :parts do
        get ':id/tickets', to: 'tickets#index'
      end
    end
  end
end

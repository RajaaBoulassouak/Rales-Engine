Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do   
      namespace :merchants do 
        get '/most_revenue' => 'most_revenue#index'
        get '/most_items' => 'most_items#index'
        get '/revenue' => 'revenue#index'
        get '/:id/revenue' => 'revenue#show'
        get '/:id/favorite_customer' => 'favorite_customer#show'
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
      end 
    
      namespace :invoices do 
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
      end
      
      namespace :invoice_items do 
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
      end
      
      namespace :items do 
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
      end
      
      namespace :customers do 
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
      end
      
      namespace :transactions do 
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
      end
      
      resources :merchants, only: [:index, :show] 
      resources :invoices, only: [:index, :show] 
      resources :invoice_items, only: [:index, :show] 
      resources :items, only: [:index, :show] 
      resources :transactions, only: [:index, :show] 
      resources :customers, only: [:index, :show]
    end 
  end 
end

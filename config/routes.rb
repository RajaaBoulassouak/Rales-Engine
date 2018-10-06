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
        get '/random' => 'random#show'
        get '/:id/items' => 'merchant_items#show'
        get '/:id/invoices' => 'merchant_invoices#show'
      end 
    
      namespace :invoices do 
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
        get '/random' => 'random#show'
        get '/:id/transactions' => 'invoice_transactions#show'
        get '/:id/invoice_items' => 'invoice_invoice_items#show'
        get '/:id/items' => 'invoices_items#show'
        get '/:id/customer' => 'invoice_customer#show'
        get '/:id/merchant' => 'invoice_merchant#show'
      end
      
      namespace :invoice_items do 
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
        get '/random' => 'random#show'
        get '/:id/invoice' => 'invoice_item_invoice#show'
        get '/:id/item' => 'invoice_item_item#show'
      end
      
      namespace :items do 
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
        get '/random' => 'random#show'
        get '/:id/invoice_items' => 'item_invoice_items#show'
        get '/:id/merchant' => 'item_merchant#show'
      end
      
      namespace :customers do 
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
        get '/random' => 'random#show'
        get '/:id/invoices' => 'customer_invoices#show'
        get '/:id/transactions' => 'customer_transactions#show'
      end
      
      namespace :transactions do 
        get '/find' => 'find#show'
        get '/find_all' => 'find#index'
        get '/random' => 'random#show'
        get '/:id/invoice' => 'transaction_invoice#show'
      end
      
      resources :merchants, only: [:index, :show] do 
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end
      
      resources :invoices, only: [:index, :show] do 
        resources :transactions, only: [:index] 
        resources :invoice_items, only: [:index]
        resources :items, only: [:index]
        resources :customers, only: [:show]
        resources :merchants, only: [:show]
      end
      
      resources :invoice_items, only: [:index, :show] do 
        resources :invoices, only: [:show]
        resources :items, only: [:show]
      end 
      
      resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index]
        resources :merchants, only: [:show]
      end
      
      resources :transactions, only: [:index, :show] do
        resources :invoices, only: [:show]
      end
      
      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :transactions, only: [:index]
      end
    end 
  end 
end

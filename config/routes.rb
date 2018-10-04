Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      resources :merchants, only: [:index, :show] do 
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end
      resources :invoices, only: [:index, :show] do 
        resources :transactions, only: [:index]
        resources :invoice_items, only: [:index]
        resources :items, only: [:index]
        resources :customers, only: [:index]
        resources :merchants, only: [:index]
      end
      resources :invoice_items, only: [:index, :show] do 
        resources :invoices, only: [:index]
        resources :items, only: [:index]
      end 
      resources :items, only: [:index, :show] do 
        resources :invoice_items, only: [:index]
        resources :merchants, only: [:index]
      end 
      resources :transactions, only: [:index, :show] do 
        resources :invoices, only: [:index]
      end
      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :transactions, only: [:index]
      end
    end 
  end 
end

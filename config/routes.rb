Rails.application.routes.draw do
  
    get 'addresses' => 'public/addresses#index',as: 'addresses'
    get 'addresses/:id/edit' => 'public/addresses#edit',as: 'edit_addresses'
    post 'addresses' => 'public/addresses#create',as: 'address'
    patch 'addresses/:id' => 'public/addresses#update',as: 'patch_address'
    delete 'addresses/:id' => 'public/addresses#destroy',as: 'destroy_address'
  
    get 'orders/new' => 'public/orders#new',as: 'new_order'
    post 'orders/confirm' => 'public/orders#confirm'
    get 'orders/complete' => 'public/orders#complete'
    get 'orders' => 'public/orders#index',as: 'orders'
    post 'orders' => 'public/orders#create'
    get 'orders/:id' => 'public/orders#show',as: 'order'
  
    get 'cart_items' => 'public/cart_items#index',as: 'cart_items'
    patch 'cart_items/:id' => 'public/cart_items#update'
    delete 'cart_items/:id' => 'public/cart_items#destroy'
    delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
    post 'cart_items' => 'public/cart_items#create',as: 'create_cart'
    
    get 'customers/my_page' => 'public/customers#show',as: 'my_page'
    get 'customers/information/edit' => 'public/customers#edit',as: 'edit_customers'
    patch 'customers/information' => 'public/customers#update',as: 'customer'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe',as: 'unsubscribe'
    patch 'customers/withdraw' => 'public/customers#withdraw',as: 'withdraw'
  
    get 'items' => 'public/items#index',as: 'items' 
    get 'items/:id' => 'public/items#show',as: 'item'
  
    get root to: 'public/homes#top'
    get '/about' => 'public/homes#about',as: 'about'
  
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update, :new]

  end
  namespace :admin do
    resources :items
  end
  namespace :admin do
    get root to: 'homes#top'
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

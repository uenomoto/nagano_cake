Rails.application.routes.draw do

    get "search" => "public/searches#search",as: 'search'

    get 'addresses' => 'public/addresses#index',as: 'addresses'
    get 'addresses/:id/edit' => 'public/addresses#edit',as: 'edit_addresses'
    post 'addresses' => 'public/addresses#create',as: 'address'
    patch 'addresses/:id' => 'public/addresses#update',as: 'patch_address'
    delete 'addresses/:id' => 'public/addresses#destroy',as: 'destroy_address'

    get 'orders/new' => 'public/orders#new',as: 'new_order'
    post 'orders/confirm' => 'public/orders#confirm',as: 'confirm_orders'
    get 'orders/complete' => 'public/orders#complete',as: 'complete'
    get 'orders' => 'public/orders#index',as: 'orders'
    post 'orders' => 'public/orders#create',as: 'create_order'
    get 'orders/:id' => 'public/orders#show',as: 'order'

    scope module: :public do
      resources :cart_items
      delete :cart_items, to: 'cart_items#destroy_all'
    end


    get 'customers/my_page' => 'public/customers#show',as: 'my_page'
    get 'customers/information/edit' => 'public/customers#edit',as: 'edit_customers'
    patch 'customers/information' => 'public/customers#update',as: 'customer'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe',as: 'unsubscribe'
    patch 'customers/withdraw' => 'public/customers#withdraw',as: 'withdraw'

    get 'items' => 'public/items#index',as: 'items'
    get 'items/:id' => 'public/items#show',as: 'item'
    get 'items/type_items/:id' => 'public/items#type_item',as: 'type_items'

    get root to: 'public/homes#top'
    get '/about' => 'public/homes#about',as: 'about'

  namespace :admin do
    get '/search' => 'searches#search'
  end

  namespace :admin do
    resources :orders, only: [:show, :update]
    get 'orders/percustomer/:id', to: 'orders#percustomer',as: 'percustomer'
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
    resources :ordered_goods, only: [:update]
  end

  namespace :admin do
    get root to: 'homes#top'
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
    registrations: "admin/registrations"
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


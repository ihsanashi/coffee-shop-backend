namespace :admin do
  post 'users/register' => 'users#register'
  post 'users/login' => 'users#login'

  resources :roles do
    resources :users, shallow: true do
      resources :profiles, shallow: true
    end
  end

  resources :products, param: :slug do
    resources :product_images
    resources :product_tags
    resources :product_taxes
    resources :product_variants, shallow: true do
      resources :variant_options, shallow: true do
        resources :variant_images, shallow: true
        resources :variant_inventories, shallow: true
      end
    end
  end

  resources :orders do
    resources :order_sessions
    resources :order_discounts
    resources :order_items, shallow: true do
      resources :order_item_fulfillments, shallow: true
    end
    resources :order_payments, shallow: true do
      resources :order_payment_logs, shallow: true
    end
  end
end
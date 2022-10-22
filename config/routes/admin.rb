namespace :admin do
  resources :roles do
    resources :users do
      resources :profiles
    end
  end

  resources :products do
    resources :product_categories
    resources :product_images
    resources :product_notes
    resources :product_tags
    resources :product_taxes
    resources :product_variants do
      resources :variant_options do
        resources :variant_images
        resources :variant_inventories
      end
    end
  end

  resources :orders do
    resources :order_sessions
    resources :order_discounts
    resources :order_items do
      resources :order_item_fulfillments
    end
    resources :order_payments do
      resources :order_payment_logs
    end
  end
end
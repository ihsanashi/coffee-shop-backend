namespace :storefront do
  resources :users, shallow: true do
    resources :profiles, shallow: true
  end

  resources :products, param: :slug

  resources :orders, shallow: true do
    resources :order_payments, shallow: true
  end
end
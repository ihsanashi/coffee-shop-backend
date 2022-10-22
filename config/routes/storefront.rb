namespace :storefront do
  resources :users do
    resources :profiles
  end

  resources :products
  resources :orders do
    resources :order_payments
  end
end
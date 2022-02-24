Rails.application.routes.draw do
  root "products#index"
  resources :products do
    resources :orders
  end
  namespace :business do
    resources :customers, only: [:index, :new, :create, :edit ,:update] do
      member do
        get 'preview'
        match 'delete_customer', via: [:delete]
      end
      collection do
        get 'search'
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

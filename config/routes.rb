# -*- coding: utf-8 -*-
SmalrubyEditor::Application.routes.draw do
  scope '(:locale)', locale: /en|ja/ do
    root to: 'editor#index'
  end

  match '/demo(/:filename)' => 'editor#demo',
        defaults: { filename: 'car_chase' }, via: :get

  resources :sessions, only: [:create, :destroy]
  match '/signout', to: 'sessions#destroy', via: 'delete'

  resources :source_codes, only: [:create, :index]
  post 'source_codes/check'
  delete 'source_codes/download'
  post 'source_codes/load'
  post 'source_codes/load_local'
  post 'source_codes/load_demo'
  delete 'source_codes/write'
  post 'source_codes/run'
  post 'source_codes/to_blocks'

  # The priority is based upon order of creation: first created ->
  # highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id:
  # product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions
  # automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

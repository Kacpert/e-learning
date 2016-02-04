Rails.application.routes.draw do
  #mount RailsAdmin::Engine => '/super_admin', as: 'rails_admin'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "application#home"

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
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
  

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :sessions, :only => [:create, :destroy]
      resources :users, only: [:show, :create]
      put 'user' => 'users#update'
      delete 'user' => 'users#destroy' 
      resources :groups, only: [:index]
      resources :groups, only: [:show, :create, :update, :destroy ]
      resources :messages, only: [:index ,:show, :create, :update, :destroy ]
      resources :categories, only: [:show, :index]
      resources :sections, only: [:show, :index, :create, :update, :destroy]
      resources :lessons, only: [:show, :index, :create, :update, :destroy]
      resources :quizzes, only: [:show, :index, :create, :update, :destroy]
      resources :courses, only: [:show, :index, :create, :update, :destroy]
    end
  end
end

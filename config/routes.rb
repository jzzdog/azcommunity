# -*- encoding : utf-8 -*-
Azcommunity::Application.routes.draw do

  
  get "community/news"
  resources :comments
  get "posts/index"
  resources :posts

  get "forum/index"
  get "forum/notify"
  resources :topics

  get "chat/index"
  post "chat/showmore"
  resources :messages

  get "adv_list/index"
  post "adv_list/showmore"

  controller :adv_list do
    get 'invite' => :invite
    post 'invite' => :send_invite        
  end  
  #resources :adverts  
  get "adv_list/myindex"
  get "adv_list/info"
  get "adv_list/invite"
  get "adverts/new"
  post "adverts/new"
  post "adverts/edit"
  resources :adverts
  
  #get 'login' => 'sessions#new'
  #post 'login' => 'adv_list#index'

  get 'users/new'
  get 'users/confirm'
  resources :users
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'login_check' => :create        
    get 'logout' => :destroy
  end  
  #get "sessions/create"
  #get "sessions/destroy"
  resources :users

  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'adv_list#index'

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
end

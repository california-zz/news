News::Application.routes.draw do

  get "ajax/edit"

  get "article/index"

  get "article/create"

  get "article/edit"

  get "article/delete"

  get "home/index"

  root :to => "home#index"
  get "user/index"
  get "user/logout"

  match '/register' => 'user#register', :as => :register
  match '/login' => 'user#login', :as => :login
  match '/success' => 'user#success', :as => :success
  match '/profile' => 'user#index', :as => :profile
  match '/update' => 'user#update', :as => :update
  match '/article' => 'post#create', :as => :article
  match '/changpass' => 'user#change', :as => :change
  match '/logout' => 'user#logout', :as => :logout
  match '/post/:id/detail' => 'post#index', :as => :detail
  match '/post/:id/delete' => 'post#delete', :as => :delete
  match '/ajax/:id' => 'ajax#edit_article', :as => :edit_article
  match '/ajax/article/set_edit' => 'ajax#set_edit_article', :as => :set_edit_article


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

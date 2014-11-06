Ttt::Application.routes.draw do
  root :to => "students#index"
  devise_for :users

  match "/sending" =>"application#sending"

  resources :students

  match "/attens/updateRow/:id" => "attens#updateRow"
  match "/attens/editRow/:id" => "attens#editRow"
  resources :attens

  match "/discs/updateRow/:id" => "discs#updateRow"
  match "/discs/editRow/:id" => "discs#editRow"
  resources :discs

  match "/finals/updateRow" => "finals#updateRow"
  match "/finals/editRow" => "finals#editRow"
  resources :finals


  match "labs/editRow/:id" =>"labs#editRow"
  match "labs/updateRow/:id" =>"labs#updateRow"
  resources :labs



  resources :iterations
  match "/iterations/:id/save" => "iterations#save", :via => 'put'
  match "/iterations/single/:id1/:id2" => "iterations#single"
  match "/iterations/editCol/:id" =>"iterations#editCol"
  match "/iterations/updateCol/:id" => "iterations#updateCol"
  match "/iterations/editRow/:id" => "iterations#editRow"
  match "/iterations/updateRow/:id" => "iterations#updateRow"
  resources :projects





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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

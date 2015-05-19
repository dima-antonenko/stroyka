Rails.application.routes.draw do

  
  resources :project_attacments

  mount Ckeditor::Engine => '/ckeditor'
  resources :static_pages


  resources :post_categories, only: [:show] do
    resources :posts, only: [:show]
  end

  
    resources :projects
    




  root 'static#home'

  get '/administrator/dashboard', as: 'user_root'

  get 'persons/profile'


 devise_for :users, controllers: { sessions: "users/sessions" }

  #namespace :administrator do
    #resources :product_categories
  #end

  namespace :administrator do
    resources :projects
    resources :orders
    resources :post_categories
    resources :posts
    resources :site_variables

    resources :menus
    resources :menu_items

    resources :sliders
    resources :slides

    resources :banners
  end

  #devise_for :users

  get '/administrator', to: 'administrator#dashboard'
  get '/delivery_and_pay', to: 'static#delivery_and_pay'
  get '/contacts', to: 'static#contacts'




  get '/administrator/blocks_in_header', to: 'administrator/site_variables#blocks_in_header'
  get '/administrator/blocks_in_footer', to: 'administrator/site_variables#blocks_in_footer'
  get '/administrator/page_contact', to: 'administrator/site_variables#page_contact'
  get '/administrator/page_company_info', to: 'administrator/site_variables#page_company_info'
  get '/administrator/page_delivery_pay', to: 'administrator/site_variables#page_delivery_pay'

  get '/administrator/page_home', to: 'administrator/site_variables#page_home'

  get '/administrator/settings', to: 'administrator/site_variables#settings'



match "/404" => "application#errors_404", via: [ :get, :post, :patch, :delete ]

  #THIS IS VERY BAD !



  
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
end
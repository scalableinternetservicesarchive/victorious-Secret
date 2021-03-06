VictoriousSecret::Application.routes.draw do
  resources :conreviews do
    member do 
      post :new
    end
  end
  

  resources :proreviews do
    member do
      post :new
    end
  end

  resources :conversations do
    resources :messages
  end


   
   get "search/posts" => 'search#posts', as: :user_search
   
   get "search/search" => 'search#search', as: :post_search
   resources :bids do  
    member do
      post :new
    end

    collection do
      get :accept
    end


  end


  
  


  resources :posts

  resources :consumers

  resources :providers

  devise_for :users, controllers: { registrations: "users/registrations"  }
  
  get "login/index"

  get 'welcome/consumer_side' => 'welcome#consumer_side', as: :consumer_welcome
  get 'welcome/provider_side' => 'welcome#provider_side', as: :provider_welcome
  get 'welcome/view_profile' => 'welcome#view_profile', as: :view
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index', as: 'welcome'

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

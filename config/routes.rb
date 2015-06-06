Rails.application.routes.draw do

  resources :user_answers
  resources :pre_challenge_events
  resources :user_pre_challenges
  resources :pre_challenges
  resources :user_challenges do
    collection do
      get "progress"
      get "leader_board"
    end
  end
  resources :pictures
  resources :users
  resources :industries
  resources :industry_categories
  resources :challenges do
   collection do
    get "student_challenges"
  end
end

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
  
    devise_for :users, path: "mentor_minds", controllers: {sessions: "users/sessions", 
                        registrations: "users/registrations", passwords: "users/passwords", 
                        confirmations: "users/confirmations", unlocks: "users/unlocks"},
                         path_names: {sign_in: 'login', sign_out: 'logout', 
                          sign_up: 'user/registration'}

  unauthenticated do
    devise_scope :user do
      root to: "users/sessions#new", :as => "unauthenticated"
    end
  end

  get 'jobs/search_job'
  post 'jobs/search_job'

  authenticated do
    devise_scope :user do
       root to: "users/sessions#after_login", :as => "authenticated"
    end
  end
end

Rails.application.routes.draw do
  resources :sessions
  resources :users, only: [:create]

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'signup',  to: 'users#new', as: 'signup'
  post 'users', to: 'users#create'

  root 'static#home'

  # root 'welcome#index'

  # Example resource route (maps HTTP verbs to controller actions
  # automatically):
  #   resources :products

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end
end

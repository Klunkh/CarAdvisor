
 Rails.application.routes.draw do
  
  get 'password_resets/new'

  get 'password_resets/edit'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users, shallow: true
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]


  root                'pagina_statica#home'
end

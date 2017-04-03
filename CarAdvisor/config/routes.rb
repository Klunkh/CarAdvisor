
 Rails.application.routes.draw do
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users, shallow: true
  resources :account_activations, only: [:edit]

  root                'pagina_statica#home'
end

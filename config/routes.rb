Rails.application.routes.draw do
  # get 'lenses/index'
  # get 'lenses/new'
  # get 'lenses/create'
  # get 'lenses/edit'
  # get 'lenses/show'
  # get 'lenses/update'
  # get 'lenses/destroy'
  # get 'index/new'
  # get 'index/create'
  # get 'index/edit'
  # get 'index/show'
  # get 'index/update'
  # get 'index/destroy'
  # get 'items/index'
  # get 'items/new'
  # get 'items/create'
  # get 'items/edit'
  # get 'items/show'
  # get 'items/update'
  # get 'items/destroy'

  resources :lenses

  get 'search' => 'lenses#search'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

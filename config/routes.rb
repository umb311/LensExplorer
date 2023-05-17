Rails.application.routes.draw do
  get 'items/index'
  get 'items/new'
  get 'items/create'
  get 'items/edit'
  get 'items/show'
  get 'items/update'
  get 'items/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

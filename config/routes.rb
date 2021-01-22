Rails.application.routes.draw do
	root 'pages#home'
	get 'about', to: 'pages#about'
	resources 'articles', only: [:show, :index, :new, :create, :edit, :update]
	# get 'articles', to: 'articles#index'
	# get 'articles/:id', to: 'articles#show'
	# get 'articles/new', to: 'articles#new'

end

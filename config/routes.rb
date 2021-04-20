Rails.application.routes.draw do
	root 'pages#home'
	get 'about', to: 'pages#about'
	resources 'articles'
	get 'signup', to: 'users#new'
	post 'users', to: 'users#create'
	resources 'users', except: [:new]
	# get 'articles', to: 'articles#index'
	# get 'articles/:id', to: 'articles#show'
	# get 'articles/new', to: 'articles#new'

end

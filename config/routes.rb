Rails.application.routes.draw do
	get 'signup', to: 'users#new', as: :users_signup
	get 'login', to: 'sessions#new', as: :users_login
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	resources :users, except: %i[new]

	get 'articles/new', to: 'articles#new', as: 'new_article'
	post 'articles', to: 'articles#create', as: ''
	get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'
	patch 'articles/:id/', to: 'articles#update', as: ''
	get 'articles/:id/', to: 'articles#show', as: 'article'
	delete 'articles/:id', to: 'articles#destroy', as: 'article_delete'
	get 'articles', to: 'articles#index', as: 'articles'


	# resources :articles #, only: %i[destroy]

	root to: 'pages#home'
	get 'about', to: 'pages#about'
end
